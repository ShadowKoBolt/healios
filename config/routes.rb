# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'links#new'

  resources :links

  devise_for :users

  get ':id', to: 'links#visit'
end
