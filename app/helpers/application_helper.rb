module ApplicationHelper
  
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      'https://www.google.com/imgres?imgurl=https%3A%2F%2Frobohash.org%2F7IC.png%3Fset%3Dset2&imgrefurl=https%3A%2F%2Frobohash.org%2F&tbnid=1QC9kFzxqwaeZM&vet=12ahUKEwj3hbmo9NvsAhVEuioKHV5VAloQMygBegQIARAr..i&docid=M5F0JHq_Il4eVM&w=300&h=300&q=random%20robot%20avatar%20url&client=ubuntu&ved=2ahUKEwj3hbmo9NvsAhVEuioKHV5VAloQMygBegQIARAr'
      #asset_path 'avatar.jpeg'
    end
  end

  def pluralize(num, nominative, genitive, accusative)
    return genitive if (11..14).include?(num % 100)
  
    last_digit = num % 10
  
    return nominative if last_digit == 1
    return accusative if (2..4).include?(last_digit)
    genitive
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
  
end
