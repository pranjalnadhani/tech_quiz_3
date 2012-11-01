class AddImagesToChoices < ActiveRecord::Migration
  def self.up
    add_attachment :questions, :main
    add_attachment :choices, :option
  end
  
  def self.down
    add_attachment :questions, :main
    add_attachment :choices, :option
  end
end
