
When(/^I fill in the page with valid data$/) do

  	on(LoginPage).fillEmail Login::VALID
	on(LoginPage).fillPassword Login::VALID

	on(HomePage).verifyHomePage Profile::SKIPCOMPLETEPROFILE, 'false'
	on(ProfilePage).openProfilePage
  	on(ProfilePage).fillFields

end

Then(/^I can see the information saved$/) do
	on(ProfilePage).verifyData
end