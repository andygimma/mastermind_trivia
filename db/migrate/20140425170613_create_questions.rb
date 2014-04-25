class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :answer
      t.string :type
      t.integer :difficulty

      t.timestamps
    end
  end
end
