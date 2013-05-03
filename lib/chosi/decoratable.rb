require 'active_support/inflector'
require 'chosi/decoratable/decorator_not_found'

module Chosi::Decoratable
  def decorate(object, options = {})
    if object.kind_of?(Chosi::Decorator)
      object = object.source
    end

    decorator = options[:decorator] || decorator_for(object)

    decorator.new(object, view_context)
  end

  def decorator_for(object)
    class_name = object.class.name
    decorator_name = "#{class_name}Decorator"

    decorator_name.constantize
  rescue NameError
    raise DecoratorNotFound, "#{decorator_name} is not defined"
  end
end
