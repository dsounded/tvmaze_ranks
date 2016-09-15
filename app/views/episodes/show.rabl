extends 'episodes/episode'

if @episode
  object present(@episode, EpisodePresenter)
else
  node :error do
    t('resource.not_found')
  end
end
