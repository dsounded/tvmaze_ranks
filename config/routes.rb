Rails.application.routes.draw do
  scope '/shows/:show_id' do
    resources :episodes, only: %i(index show) do
      resource :like, only: %i(create destroy)
      resource :dislike, only: %i(create destroy)
    end
  end
end
