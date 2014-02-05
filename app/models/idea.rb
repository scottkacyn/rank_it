class Idea < ActiveRecord::Base
  belongs_to :industry
  belongs_to :revenue_model
end
