class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.text :notes
      t.references :industry, index: true
      t.references :revenue_model, index: true

      t.timestamps
    end
  end
end
