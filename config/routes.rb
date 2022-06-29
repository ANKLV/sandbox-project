# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # delete "/admin/users/:id(.:format) " => "admin/users#destroy"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'home#index'
end
