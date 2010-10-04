require 'spec_helper'

describe "empleados/new.html.erb" do
  before(:each) do
    assign(:empleado, stub_model(Empleado,
      :new_record? => true,
      :cedula => "MyString",
      :nombre => "MyString",
      :quincena => "9.99",
      :factor_hora_por_quincena => "9.99",
      :activo => false,
      :tel_casa => "MyString",
      :tel_movil => "MyString"
    ))
  end

  it "renders new empleado form" do
    render

    rendered.should have_selector("form", :action => empleados_path, :method => "post") do |form|
      form.should have_selector("input#empleado_cedula", :name => "empleado[cedula]")
      form.should have_selector("input#empleado_nombre", :name => "empleado[nombre]")
      form.should have_selector("input#empleado_quincena", :name => "empleado[quincena]")
      form.should have_selector("input#empleado_factor_hora_por_quincena", :name => "empleado[factor_hora_por_quincena]")
      form.should have_selector("input#empleado_activo", :name => "empleado[activo]")
      form.should have_selector("input#empleado_tel_casa", :name => "empleado[tel_casa]")
      form.should have_selector("input#empleado_tel_movil", :name => "empleado[tel_movil]")
    end
  end
end
