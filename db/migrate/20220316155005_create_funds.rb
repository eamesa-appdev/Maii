class CreateFunds < ActiveRecord::Migration[6.0]
  def change
    create_table :funds do |t|
      t.string :nombre_fondo
      t.integer :administradora_id
      t.string :tipo_fondo
      t.string :codigo_tipo_fondo
      t.integer :tipo_participaciones_count

      t.timestamps
    end
  end
end
