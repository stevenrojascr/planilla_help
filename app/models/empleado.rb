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
    validates :quincena, :factor_hora_por_quincena, :numericality => { :greater_than_or_equal_to => 0.01}
    validates :cedula, :uniqueness => true
    validates :cedula, :format => {
                      :with => /^[1-9]{1}[0-9]{8}$/, 
                      :message => "deben ser 9 dígitos" }
    validates :fch_ingreso, :format => {
                      :with => /^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/,
                      :message => 'debe ser una fecha en formato aaaa-mm-dd' }
    validates :tel_casa, :format => {
                      :with => /^[2]{1}[0-9]{7}$/, 
                      :message => "deben ser 8 dígitos e iniciar con 2" }
    validates :tel_movil, :format => {
                      :with => /^[8]{1}[0-9]{7}$/, 
                      :message => "deben ser 8 dígitos e iniciar con 8" }
    validate :quincena_mayor_a_salario_minimo

  protected
    def quincena_mayor_a_salario_minimo
      errors.add(:quincena, 'debe ser mayor al salario mínimo de 95.000') if quincena.nil? ||
                    quincena < 95000
    end
end
