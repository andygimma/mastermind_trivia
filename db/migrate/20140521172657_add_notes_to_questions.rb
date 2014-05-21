class AddNotesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :notes, :string
  end
end
