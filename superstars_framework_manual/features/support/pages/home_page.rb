class HomePage
include PageObject
include DataMagic
include RSpec::Matchers


	div(:completeProfile, :id => 'fill-profile-modal')
	button(:btnNotNow, :class => 'md-warn md-hue-1 md-button md-default-theme')
	button(:btnCompleteProfile, :class => 'md-primary md-hue-1 md-button md-default-theme')
	
	div(:editProfileTitle, :id => 'profile-page')
	div(:HomePage, :class => 'hexagon-profile')

	div(:completePosition, :id => 'pickPositionModal')
	button(:btnCancel, :class => 'md-warn md-hue-1 md-button md-default-theme')



	def verifyHomePage (option, isFirst_access)
		
		if (self.completeProfile?)
			if (option.eql?(Profile::SKIPCOMPLETEPROFILE))
				skipCompleteProfile
				verifyCookies "ac-superstars-first-home-access", isFirst_access
			elsif (option.eql?(Profile::DOCOMPLETEPROFILE))
				skipCompletePosition
				doCompleteProfile
			end
		elsif (option.eql?(Profile::SHOWNHOMEPAGE))
			self.HomePage
			verifyCookies "ac-superstars-first-home-access", isFirst_access
		else
			self.HomePage?
		end

		#present?
		#visible?
	end

	def skipCompletePosition
		sleep(2)
		if (self.completePosition?)
			self.btnCancel
		end
	end

	def skipCompleteProfile
		sleep(2)
		self.btnNotNow
		verifyEditProfilePage false
	end

	def doCompleteProfile
		sleep(2)
		self.btnCompleteProfile
		verifyEditProfilePage true
	end

	def verifyEditProfilePage isVisible
		sleep(2)
		if (isVisible)
			self.editProfileTitle
		else
			self.editProfileTitle?
		end
	end

	def verifyCookies (name, value)
		cookies = browser.cookies.to_a

		# if (cookies.find {|cookie| cookie.Name == name} != nil)
		# 	puts cookies.find {|cookie| cookie.Name == name}
		# end
		found = "false"

		cookies.each do |cookie|
			if (cookie[:name].eql?(name))
				if(cookie[:value].eql?(value))
					found = "true"
					break
				else
					found = "invalid"
					break
				end
			end
		end

		expect(found).to eq("true")

	end

	
end
