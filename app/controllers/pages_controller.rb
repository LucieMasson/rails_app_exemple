# encoding: utf-8

class PagesController < ApplicationController
  def home
		@titre = "Accueil"
  end

  def contact
		@titre = "Contact"
  end

  def help
    @title = "Aide"
  end

  def about
		@titre = "À Propos"
  end
end
