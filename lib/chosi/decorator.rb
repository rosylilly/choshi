class Chosi::Decorator
  include Chosi::Decoratable

  def initialize(source, view_context)
    @source = source
    @view_context = view_context
  end
  attr_reader :source, :view_context

  alias_method :helper, :view_context

  private

  def method_missing(name, *args, &block)
    if @source.respond_to?(name)
      @source.__send__(name, *args, &block)
    else
      super
    end
  end
end
