module ApplicationHelper

  def star_rating(rating)
    case rating
    when 5
      '⭐️⭐️⭐️⭐️⭐️'
    when 4
      '⭐️⭐️⭐️⭐️'
    when 3
      '⭐️⭐️⭐️'
    when 2
      '⭐️⭐️'
    when 1
      '⭐️'
    else
      ''
    end
  end

end
