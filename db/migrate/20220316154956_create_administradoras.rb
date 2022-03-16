class CreateAdministradoras < ActiveRecord::Migration[6.0]
  def change
    create_table :administradoras do |t|
      t.string :nombre_administradora
      t.string :tipo_adminsitradora
      t.integer :fondos_count

      t.timestamps
    end
  end
end
