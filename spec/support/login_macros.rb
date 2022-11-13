module LoginMacros
  def login(user)
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'ログイン'
  end
end
