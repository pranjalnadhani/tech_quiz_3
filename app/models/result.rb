class Result < ActiveRecord::Base
  attr_accessible :percentage, :user_id
  belongs_to :user
end
