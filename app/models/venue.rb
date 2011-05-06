class Venue < ActiveRecord::Base
  belongs_to :festival
  has_many :shows
  def to_param 
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
end
