module UsersHelper

  def user_color(user)
    if user.color.present?
      user.color
    else
      '#005a55'
    end
  end

  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      "https://robohash.org/#{user.username}"
    end
  end

end
