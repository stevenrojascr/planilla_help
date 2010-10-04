require 'spec_helper'

describe "empleados/show.html.erb" do
  before(:each) do
    @empleado = assign(:empleado, stub_model(Empleado,
      :cedula => "Cedula",
      :nombre => "Nombre",
      :quincena => "9.99",
      :factor_hora_por_quincena => "9.99",
      :activo => false,
      :tel_casa => "Tel Casa",
      :tel_movil => "Tel Movil"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Cedula".to_s)
    rendered.should contain("Nombre".to_s)
    rendered.should contain("9.99".to_s)
    rendered.should contain("9.99".to_s)
    rendered.should contain(false.to_s)
    rendered.should contain("Tel Casa".to_s)
    rendered.should contain("Tel Movil".to_s)
  end
end
