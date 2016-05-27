require 'spec_helper'

describe BeachesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    it "assigns an instance variable @beaches" do
      get 'index'
      assigns(:beaches).should be_an(Array)
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
