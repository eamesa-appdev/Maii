class CreateFavoritos < ActiveRecord::Migration[6.0]
  def change
    create_table :favoritos do |t|
      t.integer :participacion_id
      t.integer :user_id
      t.date :exit_date

      t.timestamps
    end
  end
end
