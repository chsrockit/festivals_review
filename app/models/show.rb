class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :festival
  has_many :events
  has_many :reviews
  def to_param 
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
end
