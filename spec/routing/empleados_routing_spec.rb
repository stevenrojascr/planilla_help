require "spec_helper"

describe EmpleadosController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/empleados" }.should route_to(:controller => "empleados", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/empleados/new" }.should route_to(:controller => "empleados", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/empleados/1" }.should route_to(:controller => "empleados", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/empleados/1/edit" }.should route_to(:controller => "empleados", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/empleados" }.should route_to(:controller => "empleados", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/empleados/1" }.should route_to(:controller => "empleados", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/empleados/1" }.should route_to(:controller => "empleados", :action => "destroy", :id => "1")
    end

  end
end
