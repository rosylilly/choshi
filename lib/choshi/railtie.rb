require 'rails'

class Choshi::Railtie < ::Rails::Railtie
  initializer 'choshi' do
    ActiveSupport.on_load(:action_controller) do
      ActionController::Base.send(:include, Choshi::Decoratable)
    end
  end
end
