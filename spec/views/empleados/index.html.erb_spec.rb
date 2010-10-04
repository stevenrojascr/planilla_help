require 'spec_helper'

describe "empleados/index.html.erb" do
  before(:each) do
    assign(:empleados, [
      stub_model(Empleado,
        :cedula => "Cedula",
        :nombre => "Nombre",
        :quincena => "9.99",
        :factor_hora_por_quincena => "9.99",
        :activo => false,
        :tel_casa => "Tel Casa",
        :tel_movil => "Tel Movil"
      ),
      stub_model(Empleado,
        :cedula => "Cedula",
        :nombre => "Nombre",
        :quincena => "9.99",
        :factor_hora_por_quincena => "9.99",
        :activo => false,
        :tel_casa => "Tel Casa",
        :tel_movil => "Tel Movil"
      )
    ])
  end

  it "renders a list of empleados" do
    render
    rendered.should have_selector("tr>td", :content => "Cedula".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Nombre".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "9.99".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "9.99".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Tel Casa".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Tel Movil".to_s, :count => 2)
  end
end
