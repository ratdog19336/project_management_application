class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :name
      t.string :content
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
    end
  end

  def down
    drop_table :notes
  end
end
