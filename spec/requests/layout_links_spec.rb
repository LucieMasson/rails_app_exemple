# encoding: utf-8

require 'rails_helper'

RSpec.describe "LayoutLinks", :type => :request do

  it "devrait trouver une page Accueil à '/'" do
    get '/'
    #expect(response.body).to have_title "Simple App du Tutoriel Ruby on Rails | Accueil"
  end

  it "devrait trouver une page Contact at '/contact'" do
    get '/contact'
    #expect(response.body).to have_title "Contact"
  end

  it "should have an À Propos page at '/about'" do
    get '/about'
    #expect(response.body).to have_title "À Propos"
  end

  it "devrait trouver une page Aide à '/help'" do
    get '/help'
    #expect(response.body).to have_title "Aide"
  end

end
