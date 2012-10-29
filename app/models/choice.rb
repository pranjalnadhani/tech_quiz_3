class Choice < ActiveRecord::Base
  attr_accessible :correct, :question_id, :text
  belongs_to :question
end
