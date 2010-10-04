class CreateEmpleados < ActiveRecord::Migration
  def self.up
    create_table :empleados do |t|
      t.string :cedula
      t.string :nombre
      t.decimal :quincena
      t.decimal :factor_hora_por_quincena
      t.date :fch_ingreso
      t.boolean :activo, :default => true
      t.string :tel_casa
      t.string :tel_movil

      t.timestamps
    end
  end

  def self.down
    drop_table :empleados
  end
end
