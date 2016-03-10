# encoding: utf-8

require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :nom => "Example User", :email => "user@example.com", :datnaiss => "1994-05-26", :nbfilms => 5 }
  end

  it "devrait créer une nouvelle instance dotée des attributs valides" do
    User.create!(@attr)
  end

  it "exige un nom" do
    bad_guy = User.new(@attr.merge(:nom => ""))
    bad_guy.should_not be_valid
  end

  it "exige une adresse email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "exige une date de naissance" do
    no_datnaiss_user = User.new(@attr.merge(:datnaiss => ""))
    no_datnaiss_user.should_not be_valid
  end

  it "exige un nombre de films" do
    no_nbfilms_user = User.new(@attr.merge(:nbfilms => ""))
    no_nbfilms_user.should_not be_valid
  end

  it "devrait rejeter les noms trop longs" do
    long_nom = "a" * 51
    long_nom_user = User.new(@attr.merge(:nom => long_nom))
    long_nom_user.should_not be_valid
  end

    it "devrait accepter une adresse email valide" do
    adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    adresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "devrait rejeter une adresse email invalide" do
    adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    adresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "devrait rejeter une adresse email invalide jusqu'à la casse" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "devrait rejeter les dates de naissance dans le futur" do
    invalid_datnaiss_user = User.new(@attr.merge(:datnaiss => Date.today+1))
    invalid_datnaiss_user.should_not be_valid
  end

  it "devrait rejeter un nombre de films négatif" do
    invalid_nbfilms_user = User.new(@attr.merge(:nbfilms => -1))
    invalid_nbfilms_user.should_not be_valid
  end

  it "devrait rejeter un nombre de films non-entier" do
    invalid_nbfilms_user = User.new(@attr.merge(:nbfilms => 1.5))
    invalid_nbfilms_user.should_not be_valid
  end
end
