class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :name,                null: false
      t.integer    :price,               null: false
      t.text       :description,         null: false
      t.integer    :category_id,         null: false
      t.integer    :condition_id,        null: false
      t.integer    :shipping_charged_id, null: false
      t.integer    :shipping_days_id,    null: false
      t.integer    :prefecture_id,       null: false
      t.references :user,                foreign_key: true

      t.timestamps
    end
  end
end
