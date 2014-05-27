class AddSuggestedSongToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :suggested_song, :string
  end
end
