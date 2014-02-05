class CreateRevenueModels < ActiveRecord::Migration
  def change
    create_table :revenue_models do |t|
      t.string :title

      t.timestamps
    end
  end
end
