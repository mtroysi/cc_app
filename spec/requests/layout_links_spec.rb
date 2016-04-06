# encoding: utf-8
require 'spec_helper'

describe "LayoutLinks" do

  it "devrait trouver une page Accueil à '/'" do
    get '/'
    response.should have_selector('title', :content => "Accueil")
  end

  it "devrait trouver une page Contact à '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "devrait trouver une page A Propos à '/about'" do
    get '/about'
    response.should have_selector('title', :content => "A Propos")
  end

  it "devrait trouver une page Aide à '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Aide")
  end

  it "devrait avoir une page d'inscription à '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Inscription")
  end

  it "devrait avoir une page de statistiques à '/statistiques'" do
    get '/statistiques'
    response.should have_selector('title', :content => "Statistiques")
  end
end
