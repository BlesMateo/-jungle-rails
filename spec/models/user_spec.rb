require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    before do
      @user = User.create(name: "Whoopi Goldberg", email: "odamaebrown@ghost.com", password: "tensandtwenties", password_confirmation: "tensandtwenties")
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "should have a valid first name" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end


    it "should have a valid email" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have a unique email" do
      @user2 = User.create(name: "Whoopi Goldberg", email: "ODAMAEBROWN@ghost.com", password: "tensandtwenties", password_confirmation: "tensandtwenties")
      @user2.valid?
      expect(@user2.errors.full_messages).to_not be_empty
    end

    it "should have an inputted password" do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should match password with password confirmation" do
      @user.password_confirmation = "cutebutwhite"
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have at least 5 characters in the password" do
      @user.password = "girl"
      @user.password_confirmation = "girl"
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(name: "Whoopi Goldberg", email: "odamaebrown@ghost.com", password: "tensandtwenties", password_confirmation: "tensandtwenties")
    end


    it "should login if valid email and valid password is correct" do
      email = 'odamaebrown@ghost.com'
      password = 'tensandtwenties'

      @user2 = User.authenticate_with_credentials(email, password)

      expect(@user2).to eq(@user)
    end

    it "should not logging if email is incorrect" do
      email = 'maebrown@ghost.com'
      password = 'tensandtwenties'

      @user2 = User.authenticate_with_credentials(email, password)

      expect(@user2).to_not eq(@user)
    end

    it "should not logging if password is incorrect" do
      email = 'odamaebrown@ghost.com'
      password = 'onesandtwos'

      @user2 = User.authenticate_with_credentials(email, password)

      expect(@user2).to_not eq(@user)
    end

    it "should login if there email has spaces" do
      email = ' odamaebrown@ghost.com  '
      password = 'tensandtwenties'

      @user2 = User.authenticate_with_credentials(email, password)

      expect(@user2).to eq(@user)
    end

    it "should login if email is typed in different cases" do
      email = 'oDaMaEbRoWN@GhOsT.cOm'
      password = 'tensandtwenties'

      @user2 = User.authenticate_with_credentials(email, password)

      expect(@user2).to eq(@user)
    end

  end

end
