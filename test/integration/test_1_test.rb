require 'test_helper'

class Test1Test < ActionDispatch::IntegrationTest
  fixtures :users
  
  test 'Возможность вычислений после авторизации' do
    user = User.create(
        :email => 'testuser@demomailtest.com',
        :password => 'MyTestingPassword',
        :password_confirmation => 'MyTestingPassword'
    )
    assert user.save
    get '/input'
    assert_response :redirect
    post '/users/sign_in',
         params: {'user[email]' => user.email, 'user[password]' => user.password}
    follow_redirect!
    assert_equal 200, status
    assert_equal '/input', path
  end

  test 'Невозможность выполнения вычислений без авторизации' do
    get '/view',
        params: {num:333}
    assert_response :redirect
    follow_redirect!
    assert_equal 200, status
    assert_equal '/users/sign_in', path
  end
end
