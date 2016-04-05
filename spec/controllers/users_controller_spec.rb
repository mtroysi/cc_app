# encoding: utf-8
require 'spec_helper'

describe UsersController do
render_views
	describe "GET 'new'" do
		it "should be successful" do
			get 'new'
			response.should be_success
		end

		it "devrait avoir le titre adequat" do
			get 'new'
			response.should have_selector("title", :content => "Simple App du Tutoriel Ruby on Rails | Inscription")
		end
	end

	describe "POST 'create'" do

		describe "échec" do

			before(:each) do
				@attr = { :nom => "", :email => "", :datnaiss => "", :nbfilms => "", :moreBooks => "" }
			end

			it "ne devrait pas créer d'utilisateur" do
				lambda do
				post :create, :user => @attr
				end.should_not change(User, :count)
			end

			it "devrait avoir le bon titre" do
				post :create, :user => @attr
				response.should have_selector("title", :content => "Inscription")
			end

			it "devrait rendre la page 'new'" do
				post :create, :user => @attr
				response.should render_template('new')
			end
		end

		describe "succès" do

			before(:each) do
				@attr = { :nom => "New User", :email => "user@example.com",
				:datnaiss => "26/05/1994", :nbfilms => "2", :moreBooks => "oui" }
			end

			it "devrait créer un utilisateur" do
				lambda do
				post :create, :user => @attr
				end.should change(User, :count).by(1)
			end

			it "devrait rediriger vers la page d'affichage de l'utilisateur" do
				post :create, :user => @attr
				response.should redirect_to(user_path(assigns(:user)))
			end 

			it "devrait avoir un message de bienvenue" do
			post :create, :user => @attr
			flash[:success].should =~ /Bienvenue dans l'Application Exemple/i
      end   
		end
	end

end
