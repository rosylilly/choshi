class UserDecorator < Chosi::Decorator
  def name
    "#{first_name} #{last_name}".strip
  end

  def full_name
    helper.user_name(self)
  end
end
