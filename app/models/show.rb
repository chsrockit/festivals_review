
class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :festival
  has_many :events
  has_many :reviews
  def to_param 
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end

  def weight(source)
    weighting = {"Guardian" => 1.35, "Fest" => 1.15, "ThreeWeeks" => 0.6, "The List" => 0.9}
    weighting[source]
  end

  def score
    scores = []

    if self.reviews.length == 0
      return 0.0
    end

    for item in self.reviews
      scores << item.score.to_f * self.weight(item.source).to_f
    end

    top_score = scores.slice(0)

    for item in scores.slice(1 .. scores.length)
      top_score += item
    end

    return top_score / scores.length * 20
  end
end
