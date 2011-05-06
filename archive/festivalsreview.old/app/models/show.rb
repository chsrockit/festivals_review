class Show < ActiveRecord::Base
  has_many :events
  belongs_to :festival
  belongs_to :venue
end
