require 'rails_helper'

describe EpisodesController, type: :controller do
  render_views

  it 'returns empty likes dislikes in response for each episode' do
    get :index, show_id: 1, episode_id: 1, format: :json

    expect(response).to have_http_status :ok

    ActiveSupport::JSON.decode(response.body).each do |episode|
      expect(episode['likes']).to be_zero
      expect(episode['dislikes']).to be_zero
    end
  end

  context 'with records' do
    before do
      create :episode_rank, episode_id: 1, likes: 15, dislikes: 7

      get :index, show_id: 1, episode_id: 1, format: :json
    end

    it 'returns proper count for first episode' do
      expect(response).to have_http_status :ok

      ActiveSupport::JSON.decode(response.body).first.tap do |episode|
        expect(episode['likes']).to eq 15
        expect(episode['dislikes']).to eq 7
      end
    end
  end
end
