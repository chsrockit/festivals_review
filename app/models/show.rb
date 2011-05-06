class Show < ActiveRecord::Base
  belongs_to :venue
  belongs_to :festival
  has_many :events
  def to_param 
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
end
