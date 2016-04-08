# encoding: utf-8
require 'spec_helper'

describe PagesController do
  render_views
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "devrait avoir le bon titre" do
      get 'home'
      response.should have_selector("title",
                        :content => "Projet Ruby on Rails | Accueil")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    it "devrait avoir le bon titre" do
      get 'contact'
      response.should have_selector("title",
                        :content =>
                          "Projet Ruby on Rails | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it "devrait avoir le bon titre" do
      get 'about'
      response.should have_selector("title",
                        :content =>
                          "Projet Ruby on Rails | A Propos")
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    it "devrait avoir le bon titre" do
      get 'help'
      response.should have_selector("title",
                        :content =>
                          "Projet Ruby on Rails | Aide")
    end
  end

  describe "GET 'statistiques'" do
    it "should be successful" do
      get 'statistiques'
      response.should be_success
    end
    it "devrait avoir le bon titre" do
      get 'statistiques'
      response.should have_selector("title",
                        :content =>
                          "Projet Ruby on Rails | Statistiques")
    end
  end

end
