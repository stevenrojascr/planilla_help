# == Schema Information
# Schema version: 20101004015016
#
# Table name: empleados
#
#  id                       :integer         not null, primary key
#  cedula                   :string(255)
#  nombre                   :string(255)
#  quincena                 :decimal(, )
#  factor_hora_por_quincena :decimal(, )
#  fch_ingreso              :date
#  activo                   :boolean         default(TRUE)
#  tel_casa                 :string(255)
#  tel_movil                :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#

class Empleado < ActiveRecord::Base
    validates :cedula, :nombre, :quincena, :factor_hora_por_quincena, :fch_ingreso, :activo, :presence => true
    validates :quincena, :factor_hora_por_quincena,:numericality=>{:greater_than_or_equal_to=>0.01} 
end
