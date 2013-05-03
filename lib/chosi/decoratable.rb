require 'chosi/decoratable/decorator_not_found'

module Chosi::Decoratable
  def decorate(object, options = {})
    return decorate_with_array(object, options) if object.is_a?(Array)

    if (defined?(ActiveRecord) && object.kind_of?(ActiveRecord::Relation))
      return decorate_with_array(object, options)
    end

    if object.kind_of?(Chosi::Decorator)
      object = object.source
    end

    decorator = options[:decorator] || decorator_for(object)

    decorator.new(object, view_context)
  end

  def decorate_with_array(relation, options)
    relation.map { |object| decorate(object, options) }
  end

  def decorator_for(object)
    class_name = object.class.name
    decorator_name = "#{class_name}Decorator"

    decorator_name.constantize
  rescue NameError
    raise DecoratorNotFound, "#{decorator_name} is not defined"
  end
end
