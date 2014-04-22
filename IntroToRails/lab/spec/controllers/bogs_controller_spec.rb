require 'spec_helper'

describe BogsController do
  describe "GET #index" do
    it "should render index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "should retrieve #all bogs" do
      expect(Bog).to receive(:all)
      get :index
    end

    it "should assign bogs to @bogs" do
      bog = Bog.create()
      get :index
      expect(assigns(:bogs)).to eq([bog])
    end
  end

  describe "GET #new" do
    it "should render the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    it "should create a blog" do
      bog = double("Bog")
      expect(Bog).to receive(:create).and_return(bog)
      post :create, :bog => {name: "stick", description: "muddy"}
    end

    it "should redirect after create" do
       post :create, :bog => {name: "stick", description: "muddy"}
       expect(response).to redirect_to("/bogs")
    end
  end

end