require 'rails_helper'

describe LikesController, type: :controller do
  render_views

  let(:episode_rank) { create :episode_rank }

  it 'likes the episode' do
    expect { post :create, show_id: 1, episode_id: 1, format: :json }.to change { episode_rank.reload.likes }.by 1
  end

  it 'removes like from the episode' do
    expect { post :destroy, show_id: 1, episode_id: 1, format: :json }.to change { episode_rank.reload.likes }.by -1
  end
end
