class EpisodesController < ApplicationController
  def index
    @episodes = ShowManager.find(params[:show_id])

    respond_with @episodes
  end

  def show
    @episode = ShowManager.find_episode(params[:show_id], params[:id])

    respond_with @episode
  end
end
