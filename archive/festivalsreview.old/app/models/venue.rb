class Venue < ActiveRecord::Base
  has_many :events
  belongs_to :festival
  def to_param 
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
end
