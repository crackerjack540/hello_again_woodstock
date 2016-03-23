Rails.application.routes.draw do

  root 'main_pages#home'

  get 'main_pages/menu'

  get 'main_pages/about'

  get 'main_pages/contact'


end
