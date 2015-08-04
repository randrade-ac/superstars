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

	# radio_button(:radioCertification, :class => 'ng-pristine ng-untouched ng-valid md-default-theme', :index => 1)
	# radio_button(:radioCertification, :class => 'ng-pristine ng-untouched ng-valid md-default-theme')
	text_field(:txtCertName, :xpath => '//div[2]/form/div[2]/md-input-container/input')
	text_field(:txtCertAuthority, :xpath => '//div[3]/md-input-container/input')
	text_field(:txtCertStartDate, :xpath => '//div[4]/md-input-container/p/input')
	text_field(:txtCertEndDate, :xpath => '//div/p/input')
	
	checkbox(:ckbCertNotExpires, :xpath => '//md-checkbox/div')
		
	
	def openProfilePage
		browser.goto("http://staging-superstars.avenuecode.com:3030/#!/profile/")
		sleep(2)
	end

	def fillFields
		sleep(2)
		fillAbout
		fillSummary
		fillEducCert "education"
		# fillEducCert "certificationExpires"
		# fillEducCert "certificationNonExpires"


	end

	def cleanFields
		sleep(2)
		cleanAbout
		cleanSummary
		#cleanEducCert
	end

	def fillAbout
		populate_page_with data_for "profile/valid_about"
		self.btnSaveAbout
	end

	def cleanAbout
		populate_page_with data_for "profile/clean_about"
		self.btnSaveAbout
	end

	def fillSummary
		populate_page_with data_for "profile/valid_summary"
		self.btnSaveSummary
	end

	def cleanSummary
		populate_page_with data_for "profile/clean_summary"
		self.btnSaveSummary
	end

	def fillEducCert option

		sleep(2)
		self.lnkAddNewEducCert
		sleep(2)

		if (option.eql?("education"))
			populate_page_with data_for "profile/valid_education"

		elsif (option.eql?("certificationExpires"))
			
			# browser.radio_button(:xpath => '//md-radio-button[2]/div/div').set
			# select_radioCertification

			populate_page_with data_for "profile/valid_certificationExpires"
		elsif (option.eql?("certificationNonExpires"))
			
			populate_page_with data_for "profile/valid_certificationNonExpires"
			self.ckbCertNotExpires
		end		
		
		sleep(2)
		self.btnSaveEducCert
		sleep(2)

	end



end
