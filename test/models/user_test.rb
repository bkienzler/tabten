require 'test_helper'

class UserTest < ActiveSupport::TestCase
  ############
  # Test proper insert
  ############
  test "user should save" do
    user = User.new
    user.ranking = User.maximum(:ranking) + 1
    user.name = "ProperInsertUser"
    user.email = "ProperInsertUser@gmail.com"
    user.password = "12345678"
    assert user.save, "Could not save correct user"
  end
  
  ############
  # Test the presence of necessary fields
  ############
  test "user should not save without name" do
    user = User.new
    user.ranking = User.maximum(:ranking) + 1
    user.email = "InsertUser@gmail.com"
    user.password = "12345678"
    assert_not user.save, "Saved the user without a name"
  end
  
  test "user should not save without email" do
    user = User.new
    user.ranking = User.maximum(:ranking) + 1
    user.name = "InsertUser"
    user.password = "12345678"
    assert_not user.save, "Saved the user without a email"
  end
  
  test "user should not save without ranking" do
    user = User.new
    user.email = "InsertUser@gmail.com"
    user.name = "InsertUser"
    user.password = "12345678"
    assert_not user.save, "Saved the user without a ranking"
  end
  
  test "user should not save without password" do
    user = User.new
    user.ranking = User.maximum(:ranking) + 1
    user.name = "ProperInsertUser"
    user.email = "ProperInsertUser@gmail.com"
    assert_not user.save, "Saved the user without a password"
  end
  
  ############
  # Test the uniqueness of unique fields
  ############
  test "user should not save with duplicate ranking" do
    user = User.new
    user.ranking = User.maximum(:ranking)
    user.name = "ProperInsertUser"
    user.email = "ProperInsertUser@gmail.com"
    user.password = "12345678"
    assert_not user.save, "Saved the user with duplicate ranking"
  end
  
  test "user should not save with duplicate email" do
    user = User.new
    user.ranking = User.maximum(:ranking) + 1
    user.name = "ProperInsertUser"
    user.email = User.pluck(:email).first
    user.password = "12345678"
    assert_not user.save, "Saved the user with duplicate email"
  end
  
  test "user should not save with duplicate name" do
    user = User.new
    user.ranking = User.maximum(:ranking) + 1
    user.name = User.pluck(:name).first
    user.email = "ProperInsertUser@gmail.com"
    user.password = "12345678"
    assert_not user.save, "Saved the user with duplicate name"
  end
end
