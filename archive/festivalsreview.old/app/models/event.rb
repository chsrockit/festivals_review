class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :festival
  belongs_to :show
  def to_param 
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
  
end
