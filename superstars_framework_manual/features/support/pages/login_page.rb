class LoginPage
include PageObject
include DataMagic

	page_url 'http://staging-superstars.avenuecode.com:3030/'

	button(:btnLogin, :class => 'btn btn-lg btn-primary btn-block signin-btn ng-binding')
	
	text_field(:txtEmail, :id => 'Email')
	button(:btnNext, :class => 'rc-button rc-button-submit')


	text_field(:txtPassword, :id => 'Passwd')
	button(:btnSingin, :id => 'signIn')

	span(:emailError, id: 'errormsg_0_Email')
	span(:passwordError, id: 'errormsg_0_Passwd')


	def doLogin

=begin
atualizar o sleep	
accept_button_element.wait_until { accept_button_element.visible?}
	
=end

		sleep(2)
		self.btnLogin
		DataMagic.load "login.yml"
	end

	def openLoginPage
		browser.goto("http://staging-superstars.avenuecode.com:3030/")
	end

	def fillEmail option

		puts Login::VALID

		if (option.eql?(Login::VALID))
			populate_page_with data_for "emailpage_valid"
		elsif (option.eql?(Login::INVALID))
			populate_page_with data_for "emailpage_invalid"		
		elsif (option.eql?(Login::EXISTENT))
			populate_page_with data_for "emailpage_existent"		
		elsif (option.eql?(Login::FIRST_ACCESS))
			populate_page_with data_for "emailpage_firstaccess"		
		end

		self.btnNext
	end

	def fillPassword option
		sleep(2)
		if (option.eql?(Login::VALID))
			populate_page_with data_for "passwordpage_valid"
		elsif (option.eql?(Login::INVALID))
			populate_page_with data_for "passwordpage_invalid"
		elsif (option.eql?(Login::EXISTENT))
			populate_page_with data_for "passwordpage_existent"
		elsif (option.eql?(Login::FIRST_ACCESS))
			populate_page_with data_for "passwordpage_firstaccess"
		end

		self.btnSingin
		sleep(2)
	end

	def verifyEmailErrorMessage
		sleep(2)
		self.emailError
		sleep(2)
	end

	def verifyPasswordErrorMessage
		sleep(2)
		self.passwordError
		sleep(2)
	end


end
