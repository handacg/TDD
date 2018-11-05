require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

=begin  test 'Login presence if logged out' do
    get'/'
    assert_select 'body > nav > ul > li:nth-child(2) > a',  'Login', 'Login is not present when not logged in'
  end
  test 'Sign up presence if logged out' do
    get'/'
    assert_select 'body > nav > ul > li:nth-child(1) > a', 'Sign up', 'Sign up is not present when not logged in'
  end
=end
  test 'wrong fields' do
    visit new_user_path

    fill_in 'First name', with: ''
    fill_in 'Last name', with: 'Musk'
    fill_in 'Email', with: 'elon@email.com'
    fill_in 'Password', with: '123456'
    fill_in 'user_confirm_password', with: '123456'


    click_on 'Create'

    assert_current_path signup_path
  end
end
