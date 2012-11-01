class Choice < ActiveRecord::Base
  attr_accessible :correct, :question_id, :text
  belongs_to :question
  
  has_attached_file :option, :styles => { :full => "48x48>" }
end
