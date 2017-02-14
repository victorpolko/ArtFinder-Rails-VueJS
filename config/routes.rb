Rails.application.routes.draw do
  root to: redirect('/artworks')

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :artworks, only: [:index, :show], concerns: :paginatable do
    patch :toggle_published, on: :member
    put :toggle_published, on: :member
  end
end
