extends 'episodes/episode'

collection @episodes.map { |episode| present(episode, EpisodePresenter) }
