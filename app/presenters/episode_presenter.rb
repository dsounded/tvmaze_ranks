class EpisodePresenter < BasePresenter
  include Dry::Monads::Maybe::Mixin

  DEFAULT_VALUE = 0

  presents :episode

  # def likes
  # def dislikes
  %i(likes dislikes).each do |method_name|
    define_method(method_name) do
      Maybe(ranks).fmap(&method_name).value_or(DEFAULT_VALUE)
    end
  end

  private

  def ranks
    return @ranks if defined?(@ranks)

    @ranks = RankFigurant.get(id)
  end
end
