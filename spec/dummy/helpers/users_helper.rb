module UsersHelper
  def user_name(user)
    "#{user.first_name} #{user.last_name}".strip
  end
end
