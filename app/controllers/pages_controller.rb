class PagesController < ApplicationController

  def home
    @titre = "Accueil"
  end

  def contact
    @titre = "Contact"
  end

  def about
    @titre = "A Propos"
  end

  def help
    @titre = "Aide"
  end

  def statistiques
    @users = User.all
  end

end