require 'rails'

class Chosi::Railtie < ::Rails::Railtie
  initializer 'chosi' do
    ActiveSupport.on_load(:action_controller) do
      ActionController::Base.send(:include, Chosi::Decoratable)
    end
  end
end
