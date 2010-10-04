require 'spec_helper'

describe EmpleadosController do

  def mock_empleado(stubs={})
    @mock_empleado ||= mock_model(Empleado, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all empleados as @empleados" do
      Empleado.stub(:all) { [mock_empleado] }
      get :index
      assigns(:empleados).should eq([mock_empleado])
    end
  end

  describe "GET show" do
    it "assigns the requested empleado as @empleado" do
      Empleado.stub(:find).with("37") { mock_empleado }
      get :show, :id => "37"
      assigns(:empleado).should be(mock_empleado)
    end
  end

  describe "GET new" do
    it "assigns a new empleado as @empleado" do
      Empleado.stub(:new) { mock_empleado }
      get :new
      assigns(:empleado).should be(mock_empleado)
    end
  end

  describe "GET edit" do
    it "assigns the requested empleado as @empleado" do
      Empleado.stub(:find).with("37") { mock_empleado }
      get :edit, :id => "37"
      assigns(:empleado).should be(mock_empleado)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created empleado as @empleado" do
        Empleado.stub(:new).with({'these' => 'params'}) { mock_empleado(:save => true) }
        post :create, :empleado => {'these' => 'params'}
        assigns(:empleado).should be(mock_empleado)
      end

      it "redirects to the created empleado" do
        Empleado.stub(:new) { mock_empleado(:save => true) }
        post :create, :empleado => {}
        response.should redirect_to(empleado_url(mock_empleado))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved empleado as @empleado" do
        Empleado.stub(:new).with({'these' => 'params'}) { mock_empleado(:save => false) }
        post :create, :empleado => {'these' => 'params'}
        assigns(:empleado).should be(mock_empleado)
      end

      it "re-renders the 'new' template" do
        Empleado.stub(:new) { mock_empleado(:save => false) }
        post :create, :empleado => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested empleado" do
        Empleado.should_receive(:find).with("37") { mock_empleado }
        mock_empleado.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :empleado => {'these' => 'params'}
      end

      it "assigns the requested empleado as @empleado" do
        Empleado.stub(:find) { mock_empleado(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:empleado).should be(mock_empleado)
      end

      it "redirects to the empleado" do
        Empleado.stub(:find) { mock_empleado(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(empleado_url(mock_empleado))
      end
    end

    describe "with invalid params" do
      it "assigns the empleado as @empleado" do
        Empleado.stub(:find) { mock_empleado(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:empleado).should be(mock_empleado)
      end

      it "re-renders the 'edit' template" do
        Empleado.stub(:find) { mock_empleado(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested empleado" do
      Empleado.should_receive(:find).with("37") { mock_empleado }
      mock_empleado.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the empleados list" do
      Empleado.stub(:find) { mock_empleado }
      delete :destroy, :id => "1"
      response.should redirect_to(empleados_url)
    end
  end

end
