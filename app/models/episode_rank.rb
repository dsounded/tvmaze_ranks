class EpisodeRank < ActiveRecord::Base
  validates :episode_id, :likes, :dislikes, numericality: true
end
