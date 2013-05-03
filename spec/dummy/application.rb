require 'active_record'
require 'action_controller/railtie'
require 'action_view/railtie'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)

module Dummy
  class Application < ::Rails::Application
    config.secret_token = 'alchol'
    config.session_store :cookie_store, :key => '__alchol__'
    config.active_support.deprecation = :log

    root = File.expand_path('..', __FILE__)
    config.autoload_paths +=
      Dir["#{root}/{models,controllers,helpers,decorators}"]
  end
end
Dummy::Application.initialize!

Dummy::Application.routes.draw do
  resources :users do
    resources :books
  end
end

class ApplicationController < ActionController::Base
   self.append_view_path(File.expand_path('../views', __FILE__))
end

module ApplicationHelper; end

class CreateTables < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :first_name
      t.string :last_name
    end

    create_table(:books) do |t|
      t.references :user
      t.string :title
    end
  end
end
