require 'spec_helper'

describe PaginasController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contacto'" do
    it "should be successful" do
      get 'contacto'
      response.should be_success
    end
  end

end
