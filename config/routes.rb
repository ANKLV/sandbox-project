# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'home#index'
end
