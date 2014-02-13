class Idea < ActiveRecord::Base
  belongs_to :industry
  belongs_to :revenue_model
  acts_as_votable
  acts_as_commentable

  def self.highest_voted
     self.order("cached_votes_up - cached_votes_down DESC")
  end

end
