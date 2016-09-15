class RankFigurant
  def self.get(*attrs)
    new(*attrs).get
  end

  def initialize(id)
    @id = id
  end

  def get
    EpisodeRank.find_by(episode_id: id)
  end

  # def like
  # def dislike
  %i(like dislike).each do |method_name|
    define_method(method_name) do |by|
      episode_rank = get || EpisodeRank.create(episode_id: id)

      episode_rank.increment!(method_name.to_s.pluralize, by)
    end
  end

  private

  attr_reader :id
end
