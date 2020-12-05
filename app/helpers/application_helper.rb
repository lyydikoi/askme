module ApplicationHelper
  
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      "https://robohash.org/#{user.username}"
    end
  end

  def pluralize(num, nominative, genitive, accusative)
    return genitive if (11..14).include?(num % 100)
  
    last_digit = num % 10
  
    return nominative if last_digit == 1
    return accusative if (2..4).include?(last_digit)
    genitive
  end

  def pluralize(num, nominative, genitive_pl, genitive_sing)
    # pluralize(23, заяц, зайцев, зайца)
    # pluralize(35, ошибка, ошибок, ошибки)
    return genitive_pl if (11..14).include?(num % 100)

    last_digit = num % 10
  
    return nominative if last_digit == 1
    return genitive_sing if (2..4).include?(last_digit)
    genitive_pl
  end

  def fa_icon(icon_class, text = "")
    content_tag 'span', " #{text}", class: "fa fa-#{icon_class}"
  end
  
end
