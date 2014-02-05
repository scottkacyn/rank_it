class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.string :name
      t.text :description
      t.string :url
      t.float :funding

      t.timestamps
    end
  end
end
