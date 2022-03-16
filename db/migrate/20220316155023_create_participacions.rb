class CreateParticipacions < ActiveRecord::Migration[6.0]
  def change
    create_table :participacions do |t|
      t.integer :fund_id
      t.integer :codigo_participaciones
      t.float :valor_fondo
      t.float :rentabilidad_diaria
      t.float :rentabilidad_mensual
      t.float :rentabilidad_semestral
      t.float :rentabilidad_anual
      t.integer :numero_inversionistas

      t.timestamps
    end
  end
end
