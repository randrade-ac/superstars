
When(/^I do the Login with valid data$/) do
	on(LoginPage).fillEmail Login::VALID
	on(LoginPage).fillPassword Login::VALID

	# on(LoginPage).fillEmail "first_acess"
	# on(LoginPage).fillPassword "first_acess"
end

Then(/^I can see the SuperStars HomePage$/) do
	on(HomePage).verifyHomePage Profile::SKIPCOMPLETEPROFILE, 'false'
	# on(HomePage).verifyHomePage 'Profile::DOCOMPLETEPROFILE 'true'
end

When(/^I do the Login with invalid data$/) do

	#declarar uma váriavel com a página e iterar nessa variavel buscando os metodos
	#page.fillEmail
	on(LoginPage).fillEmail Login::INVALID
  	on(LoginPage).verifyEmailErrorMessage

  	on(LoginPage).fillEmail Login::VALID
  	on(LoginPage).fillPassword Login::INVALID
  	on(LoginPage).verifyPasswordErrorMessage

	on(LoginPage).openLoginPage
  	on(LoginPage).doLogin
  	on(LoginPage).fillEmail Login::EXISTENT
  	on(LoginPage).fillPassword Login::EXISTENT
  	on(LoginPage).doLogin

end

Then(/^I can not see SuperStars HomePage$/) do
	on(HomePage).verifyHomePage Profile::NOTSHOWNHOMEPAGE, 'false'
end