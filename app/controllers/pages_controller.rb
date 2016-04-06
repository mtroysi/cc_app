require 'gruff'
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

    g = Gruff::Pie.new(400)
    g.title = 'Pourcentage des utilisateurs qui aimeraient 
    et qui n\'aimeraient pas lire plus de livres'
    nb_oui = User.where(moreBooks: "oui").count
    nb_non = User.where(moreBooks: "non").count
    @datasets = [
      [:Oui, [nb_oui]],
      [:Non, [nb_non]],
      ]
    @datasets.each do |data|
      g.data(data[0], data[1])
    end
    g.write("public/images/pie_lecteurs.png")
    respond_to do |format|
      format.html
      format.pdf { 
        render :pdf => "statistiques", :layout => 'pdf.html'
      }
    end
  end

end