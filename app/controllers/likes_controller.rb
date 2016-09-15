class LikesController < ApplicationController
  LIKE_RANK = 1
  DISLIKE_RANK = -1

  def create
    figurant.like(LIKE_RANK)
    @stats = figurant.get

    respond_with @stats
  end

  def destroy
    figurant.like(DISLIKE_RANK)
    @stats = figurant.get

    respond_with @stats
  end

  private

  def figurant
    @figurant ||= RankFigurant.new(params[:episode_id])
  end
end
