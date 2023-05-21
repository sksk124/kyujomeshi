module ApplicationHelper

  def star_rating(rating)
  full_stars = rating.round
  half_star = (rating - full_stars) >= 0.5
  empty_stars = 5 - full_stars - (half_star ? 1 : 0)

  full_stars.times.map { '★' }.join + (half_star ? '☆' : '') + empty_stars.times.map { '☆' }.join
  end

end
