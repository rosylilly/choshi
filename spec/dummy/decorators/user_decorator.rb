class UserDecorator < Chosi::Decorator
  auto_decorate :books

  def name
    "#{first_name} #{last_name}".strip
  end

  def full_name
    helper.user_name(self)
  end
end
