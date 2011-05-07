class Venue < ActiveRecord::Base
  belongs_to :festival
  has_many :shows
  def to_param 
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end

  def weight(source)
    weighting = {"Guardian" => 1.35, "Fest" => 1.15, "ThreeWeeks" => 0.6, "The List" => 0.9}
    return weighting[source]
  end

  def rate_show(reviews)
    scores = []

    for item in reviews
      scores << item.score.to_f * weight(item.source).to_f
    end

    top_score = scores.slice(0)

    for item in scores.slice(1 .. scores.length)
      top_score += item
    end

    return top_score / scores.length * 20
  end

  def score
    shows_number = self.shows.length
    reviews_number = 0
    reviews = []
    
    self.shows.each do |show|
      reviews_number += show.reviews.length
      show.reviews.each do |review|
        reviews << review
      end
    end

    venue_score = (shows_number / 146.0*100*0.5 )+(reviews_number/208.0*100)+(rate_show(reviews))/3
    return venue_score
  end
end
