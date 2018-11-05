require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'valid user' do
    user =  User.new(last_name: 'Hammond', email: 'john@example.com')
    assert_not_nil  user.valid?
  end

  test 'invalid without first_name' do
    user =  User.new(first_name: '   ', last_name: 'Hammond', email: 'john@example.com')
    refute user.valid?, 'user is valid without a first_name'
    assert_not_nil user.errors[:first_name], 'no validation error for first_name present'
  end

  test 'invalid if email is not unique' do
    user =  User.new(first_name: 'John', last_name: 'Hammond', email: 'john@example.com')
    user_copy = user.dup
    refute user_copy.valid?
  end
end
