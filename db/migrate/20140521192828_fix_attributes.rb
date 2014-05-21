class FixAttributes < ActiveRecord::Migration
  def self.up
   change_column :questions, :question, :text
   change_column :questions, :answer, :text
   change_column :questions, :notes, :text
  end
  def self.down
   change_column :questions, :questions, :string
   change_column :questions, :answer, :string
   change_column :questions, :notes, :string
  end
end
