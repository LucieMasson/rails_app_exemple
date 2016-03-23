# encoding: utf-8

require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#titre" do
  
    it "returns the default title if no title given" do
      expect(helper.titre).to eq("Simple App du Tutoriel Ruby on Rails")
    end
    
    it "returns formatted title if given" do
      assign(:titre, "Mon Titre")
      expect(helper.titre).to eq("Simple App du Tutoriel Ruby on Rails | Mon Titre")
    end
    
  end
end
