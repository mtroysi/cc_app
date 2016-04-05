# encoding: utf-8
require 'spec_helper'

describe "Users" do

  describe "une inscription" do

    describe "ratée" do

      it "ne devrait pas créer un nouvel utilisateur" do
      	lambda do
			visit signup_path
			fill_in 'user_nom',          :with => ""
			fill_in 'user_email',        :with => ""
			fill_in 'user_nbfilms', :with => ""
			fill_in 'user_moreBooks_oui', :with => ""
			fill_in 'user_moreBooks_non', :with => ""
			click_button
			response.should render_template('users/new')
			response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
    end

    describe "réussie" do

      it "devrait créer un nouvel utilisateur" do
        lambda do
          visit signup_path
          fill_in "user_nom", :with => "Example User"
          fill_in "user_email", :with => "user@example.com"
		  fill_in 'user_nbfilms', :with => "1"
		  fill_in 'user_datnaiss_3i', :with => "01"
		  fill_in 'user_datnaiss_2i', :with => "01"
		  fill_in 'user_datnaiss_1i', :with => "2016"
		  fill_in 'user_moreBooks_oui', :with => "oui"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Bienvenue")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end

  end
end
