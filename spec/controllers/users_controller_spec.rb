# encoding: utf-8

require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, :type => :controller do

  render_views

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "has correct title" do
      get :new
      expect(response.body).to have_title "Simple App du Tutoriel Ruby on Rails | Inscription"
    end    
    
  end


  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end

    it "devrait réussir" do
      get :show, :id => @user
      expect(response)
    end

    it "devrait trouver le bon utilisateur" do
      get :show, :id => @user
      expect(assigns(:user) == @user)
    end
    
    it "devrait avoir le bon titre" do
      get :show, :id => @user
      #response.should have_selector("title", :match => @user.nom)
      expect(response.body).to have_css 'title', text: "Simple App du Tutoriel Ruby on Rails | "+ @user.nom, visible: false
    end

    it "devrait inclure le nom de l'utilisateur" do
      get :show, :id => @user
      #response.should have_selector("h1", :match => @user.nom)
      expect(response.body).to have_css 'h1', text: @user.nom, visible: false
    end

    it "devrait avoir une image de profil" do
      get :show, :id => @user
      #expect(response.body).to have_selector 'h1>img', :class => "gravatar", visible: false
    end    
    
  end  
  
end
