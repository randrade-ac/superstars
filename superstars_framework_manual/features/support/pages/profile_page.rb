#profile_page

class ProfilePage
include PageObject
include DataMagic


	page_url 'http://staging-superstars.avenuecode.com:3030/'

	# button(:btnSaveAbout, :xpath => '//div[@id=\'profile-page\']/div[2]/div/div/div/div/p[2]/button')
	button(:btnSaveAbout, :xpath => '//p[2]/button')
	textarea(:txtAbout, :xpath => '//div[@id=\'profile-page\']/div[2]/div/div/div/div/p/md-input-container/textarea')
	
	# button(:btnSaveSummary, :xpath => '//div[@id=\'profile-page\']/div[2]/div/div[2]/div/div/p[2]/button')
	button(:btnSaveSummary, :xpath => '//div[2]/div/div/p[2]/button')
	textarea(:txtSummary, :xpath => '//div[@id=\'profile-page\']/div[2]/div/div[2]/div/div/p/md-input-container/textarea')


	link(:lnkAddNewEducCert, :css => 'p.add-new-element.ng-binding')
	button(:btnSaveEducCert, :xpath => '//div[3]/p/button')

	text_field(:txtEducSchool, :xpath => '//md-input-container/input')
	text_field(:txtEducStartDate, :xpath => '//p/input')
	text_field(:txtEducEndDate, :xpath => '//md-input-container[2]/p/input')
	text_field(:txtDegree, :xpath => '//div[4]/md-input-container/input')
	text_field(:txtField, :xpath => '//div[5]/md-input-container/input')
	textarea(:txtActivities, :xpath => '//div[6]/md-input-container/textarea')

	text_field(:txtCertName, :xpath => '//div[2]/form/div[2]/md-input-container/input')
	text_field(:txtCertAuthority, :xpath => '//div[3]/md-input-container/input')
	text_field(:txtCertStartDate, :name => 'certificationStartDate')
	text_field(:txtCertEndDate, :name => 'certificationEndDate')
	
	link(:lnkAddNewExperience, :css => 'div.box.container-fluids > div.ng-isolate-scope > div > div > p.add-new-element.ng-binding')
	text_field(:txtPosition, :xpath => '//div[3]/form/div[2]/md-input-container/input')
	text_field(:txtCompany, :xpath => '//div[3]/form/div[3]/md-input-container/input')
	text_field(:txtExpeStartDate, :name => 'startDate')
	text_field(:txtExpeEndDate, :xpath => '//div[6]/md-input-container[2]/div/p/input')
	textarea(:txtActivityDescription, :xpath => '//div[8]/md-input-container/textarea')
	button(:btnSaveExperience, :xpath => '//div[9]/p/button')

	text_field(:txtTwitter, :xpath => '//div[2]/div[2]/md-input-container/input')
	text_field(:txtFacebook, :xpath => '//div[3]/div[2]/md-input-container/input')
	text_field(:txtLinkedIn, :xpath => '//div[4]/div[2]/md-input-container/input')

	link(:lnkAddNewSkill, :css => 'div.skills-header > p.add-new-element.ng-binding')
	text_field(:txtSkill, :xpath => '//span/md-input-container/input')
	text_field(:txtExpertise, :xpath => '//md-content/div/md-input-container/input')
	
	button(:btnSaveSkill, :xpath => '//div[2]/form/div/p/button')
	
	div(:divStars, :class => 'skill-level icons')

		
	
	def openProfilePage
		browser.goto("http://staging-superstars.avenuecode.com:3030/#!/profile/")
		sleep(2)
	end

	def fillFields
		sleep(2)
		DataMagic.load "profile.yml"
		fillAbout
		sleep(2)
		# fillSummary
		# sleep(2)
		# fillEducCert EducationCertification::EDUCATION
		# sleep(2)
		# fillEducCert EducationCertification::CERTIFICATIONEXPIRES
		# sleep(2)
		# fillEducCert EducationCertification::CERTIFICATIONNONEXPIRES
		# sleep(2)
		# fillExperience
		# sleep(2)
		# fillSocialNetwork
		# sleep(2)
		# fillSkill

	end

	#TODO avaliar necessidade
	def cleanFields
		sleep(2)
		cleanAbout
		cleanSummary
	end

	def fillAbout
		populate_page_with data_for "valid_about"
		self.btnSaveAbout
	end

	def cleanAbout
		populate_page_with data_for "clean_about"
		self.btnSaveAbout
	end

	def fillSummary
		populate_page_with data_for "valid_summary"
		self.btnSaveSummary
	end

	def cleanSummary
		populate_page_with data_for "clean_summary"
		self.btnSaveSummary
	end

	def fillEducCert option

		sleep(2)
		self.lnkAddNewEducCert
		sleep(2)

		if (option.eql?(EducationCertification::EDUCATION))
			populate_page_with data_for "valid_education"

		elsif (option.eql?(EducationCertification::CERTIFICATIONEXPIRES))
			
			clickCertification
			populate_page_with data_for "valid_certificationExpires"

		elsif (option.eql?(EducationCertification::CERTIFICATIONNONEXPIRES))

			clickCertification
			populate_page_with data_for "valid_certificationNonExpires"
			clickCertificationNonExpires

		end		
		
		sleep(2)
		self.btnSaveEducCert
		sleep(2)

	end

	def clickCertification
		#TODO esta não é uma boa prática de teste; no entanto, o elemento no sistema é um 
		#"<md-radio-button>" ao invés de "<input type='radio'>". Sendo assim, a forma 
		#mais simples foi chamar o "element" diretamente no momento.
		#Para pensar: quando usei link com xpath ele pediu o <a>; quando usei link com css ele deu certo.
		#verificar se eu chamar por outro atributo funciona.

		@browser.element(:xpath => '//md-radio-button[2]/div/div').click

	end

	def clickCertificationNonExpires
		#TODO esta não é uma boa prática de teste; no entanto, o elemento no sistema é um 
		#"<md-checkbox" ao invés de "<checkbox>". Sendo assim, a forma 
		#mais simples foi chamar o "element" diretamente no momento.
		#Para pensar: quando usei link com xpath ele pediu o <a>; quando usei link com css ele deu certo.
		#verificar se eu chamar por outro atributo funciona.

		@browser.element(:xpath => '//md-checkbox/div').click
	end

	def fillExperience
		self.lnkAddNewExperience
		populate_page_with data_for "valid_experience"
		self.btnSaveExperience
	end

	def fillSocialNetwork
		populate_page_with data_for "valid_socialNetwork"
	end

	def fillSkill
		lnkAddNewSkill
		populate_page_with data_for "valid_skill"

		@browser.div(:class => 'skill-level icons').click
		sleep(2)

		self.btnSaveSkill
	end

	def verifyData
		#TODO
	end
end


