Given(/^I am on SuperStars (.+)$/) do | page | 
	visit page
	on(LoginPage).doLogin 
end

When(/^I do the Login with valid data$/) do
	on(LoginPage).fillEmail "valid"
	on(LoginPage).fillPassword "valid"

	# on(LoginPage).fillEmail "first_acess"
	# on(LoginPage).fillPassword "first_acess"
end

Then(/^I can see the SuperStars HomePage$/) do
	on(HomePage).verifyHomePage 'skipCompleteProfile', 'false'
	# on(HomePage).verifyHomePage 'doCompleteProfile' 'true'
end

When(/^I do the Login with invalid data$/) do

	on(LoginPage).fillEmail "invalid"
  	on(LoginPage).verifyEmailErrorMessage

  	on(LoginPage).fillEmail "valid"
  	on(LoginPage).fillPassword "invalid"
  	on(LoginPage).verifyPasswordErrorMessage

	on(LoginPage).openLoginPage
  	on(LoginPage).doLogin
  	on(LoginPage).fillEmail "existent"
  	on(LoginPage).fillPassword "existent"
  	on(LoginPage).doLogin

end

Then(/^I can not see SuperStars HomePage$/) do
	on(HomePage).verifyHomePage 'notShown', 'false'
end

When(/^I fill in the page with valid data$/) do

  	on(LoginPage).fillEmail "valid"
	on(LoginPage).fillPassword "valid"

	on(HomePage).verifyHomePage 'skipCompleteProfile', 'false'
	on(ProfilePage).openProfilePage
  	on(ProfilePage).fillFields

end

Then(/^I can see the information saved$/) do
  pending # Write code here that turns the phrase above into concrete actions
end