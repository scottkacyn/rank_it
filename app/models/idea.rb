class Idea < ActiveRecord::Base
  belongs_to :industry
  belongs_to :revenue_model
  acts_as_votable 
end
