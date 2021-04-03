module LoginMacros
  def login(user)
    click_on "ログイン"
    fill_in  "user_email",    with: user.email
    fill_in  "user_password", with: user.password
    click_on "commit"
  end

  def user_edit(user)
    fill_in  "user_username",	              with: "edit_name"
    fill_in  "user_email",	                with: "edit_test@example.com"
    fill_in  "user_current_password",	      with: user.password 
    click_on "編集"
  end
end