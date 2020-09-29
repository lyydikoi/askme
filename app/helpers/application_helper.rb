module ApplicationHelper
  
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpeg'
    end
  end

  def pluralize(num, nominative, genitive, accusative)
    return genitive if (11..14).include?(num % 100)
  
    last_digit = num % 10
  
    return nominative if last_digit == 1
    return accusative if (2..4).include?(last_digit)
    genitive
  end
  
end
