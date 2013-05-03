class BookDecorator < Chosi::Decorator
  auto_decorate :user

  def author_name
    user.name
  end
end
