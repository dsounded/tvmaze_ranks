require 'rails_helper'

describe DislikesController, type: :controller do
  render_views

  let(:episode_rank) { create :episode_rank }

  it 'deslikes the episode' do
    expect { post :create, show_id: 1, episode_id: 1, format: :json }.to change { episode_rank.reload.dislikes }.by 1
  end

  it 'removes deslike from the episode' do
    expect { post :destroy, show_id: 1, episode_id: 1, format: :json }.to change { episode_rank.reload.dislikes }.by -1
  end
end
