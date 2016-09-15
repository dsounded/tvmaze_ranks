require 'rails_helper'

RSpec.describe EpisodeRank, type: :model do
  it { is_expected. to validate_numericality_of :episode_id }
  it { is_expected. to validate_numericality_of :likes }
  it { is_expected. to validate_numericality_of :dislikes }
end
