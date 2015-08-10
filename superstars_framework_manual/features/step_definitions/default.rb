Given(/^I am on SuperStars (.+)$/) do | page | 
	visit page
	on(LoginPage).doLogin 
end