class CreateProjectNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :project_notes do |t|
      t.references :user, foreign_key: true
      t.references :note, foreign_key: true
    end
  end

  def down
    drop_table
  end
end
