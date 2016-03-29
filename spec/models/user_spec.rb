# encoding: utf-8

require 'rails_helper'

RSpec.describe User, :type => :model do

  before(:each) do
    @attr = { :nom => "Example User", :email => "user@example.com" }
  end

  it "devrait créer une nouvelle instance dotée des attributs valides" do
    User.create!(@attr)
  end

  it "exige un nom" do
    bad_guy = User.new(@attr.merge(:nom => ""))
    bad_guy.valid?
    #expect(bad_guy).not_to be true
    expect(bad_guy.errors[:nom]).to include("can't be blank")
  end
  
   it "exige une adresse email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.valid?
    expect(no_email_user.errors[:email]).to include("can't be blank")
  end 

  it "devrait rejeter les noms trop longs" do
    long_nom = "a" * 51
    long_nom_user = User.new(@attr.merge(:nom => long_nom))
    expect(long_nom_user.valid?).to be false
  end

  it "devrait accepter une adresse email valide" do
    adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    adresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      expect(valid_email_user.valid?).to be true
    end
  end

  it "devrait rejeter une adresse email invalide" do
    adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    adresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      expect(invalid_email_user.valid?).to be false
    end
  end

  it "devrait rejeter un email double" do
    # Place un utilisateur avec un email donné dans la BD.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email.valid?).to be false
  end

  it "devrait rejeter une adresse email invalide jusqu'à la casse" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email.valid?).to be false
  end

end
