class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :user, foreign_key: true
    end
  end

  def down
    drop_table :projects
  end
end
