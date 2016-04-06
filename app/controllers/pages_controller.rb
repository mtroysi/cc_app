# encoding: utf-8
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
    @titre = "Statistiques"
    @users = User.all

    # Graphe Pourcentage de lecteurs
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

    # Graphe Fréquence des lecteurs
    g = Gruff::Bar.new(400)
    g.title = 'Fréquences des lecteurs et des non lecteurs'
    g.labels = {
        0 => 'Janv',
        1 => 'Fév',
        2 => 'Mars',
        3 => 'Avril',
        4 => 'Mai',
        5 => 'Juin',
        6 => 'Juil',
        7 => 'Août',
        8 => 'Sept',
        9 => 'Oct',
        10 => 'Nov',
        11 => 'Déc',
    }
    g.y_axis_increment = 1
    tab_oui = []
    tab_non = []
    for i in 1..12
      tab_oui.push(User.where(moreBooks: "oui").where("strftime('%m', created_at) + 0 = ?", i).count)
      tab_non.push(User.where(moreBooks: "non").where("strftime('%m', created_at) + 0 = ?", i).count)
    end
    @datasets = [
      [:Oui, tab_oui],
      [:Non, tab_non],
      ]
    @datasets.each do |data|
      g.data(data[0], data[1])
    end
    g.write('public/images/bar_frequence.png')

    respond_to do |format|
      format.html
      format.pdf { 
        render :pdf => "statistiques", :layout => 'pdf.html'
      }
    end
  end

end