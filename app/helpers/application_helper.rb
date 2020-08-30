module ApplicationHelper
  
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpeg'
    end
  end

  def pluralize(num, nominative, genitive, accusative)
    if num > 9 && num < 21
      genitive
    elsif (num == 1 || num % 10 == 1)
      nominative
    elsif(num > 1 && num < 5) || (num % 10 > 1 && num % 10 < 5)
      accusative
    else
      genitive
    end
  end
  
end
