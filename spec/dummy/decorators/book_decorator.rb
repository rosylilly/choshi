class BookDecorator < Choshi::Decorator
  auto_decorate :user

  def author_name
    user.name
  end
end
