class Question < ActiveRecord::Base
  attr_accessible :title
  has_many :choices
  
  has_attached_file :main, :styles => { :full => "256x256>", :mini => "48x48>" }
  
  def answer
	 uncorrect
	 choices.select {|c| c.correct}[0]
  end	
  
  def uncorrect
	 choices.each {|c| c.correct = false}
  end
  
  def answer= choice
	 if !answer.nil?
		answer.correct = false
	 end
	 
	 if choices.include? choice
		choice.correct = true
	 else
		choices << choice
		choice.correct = true
	 end
  end
end
