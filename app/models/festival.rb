class Festival < ActiveRecord::Base
  has_many :venues
  has_many :shows
  def to_param 
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
end
