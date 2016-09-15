require 'rest-client'

class ShowManager
  DOMAIN_NAME = 'http://api.tvmaze.com/shows/'.freeze
  EPISODES = '/episodes'.freeze

  delegate :decode, to: :'ActiveSupport::JSON'

  def self.find(*attrs)
    new(*attrs).find
  end

  def self.find_episode(*attrs)
    new(*attrs).find_episode
  end

  def initialize(id, episode_id = nil)
    @id = id
    @episode_id = episode_id
  end

  def find
    decode(RestClient.get("#{DOMAIN_NAME}#{id}#{EPISODES}")).map { |episode| OpenStruct.new(episode) }
  end

  def find_episode
    find.find { |episode| episode.id == episode_id.to_i }
  end

  private

  attr_reader :id, :episode_id
end
