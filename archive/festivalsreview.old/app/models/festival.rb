class Festival < ActiveRecord::Base
  has_many :venues
  def to_param 
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
  
end
