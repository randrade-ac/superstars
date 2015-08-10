class Profile < ActiveRecord::Base

  Type = {
    (SKIPCOMPLETEPROFILE = 1) => "skipCompleteProfile",
    (DOCOMPLETEPROFILE = 2) => "doCompleteProfile",
    (SHOWNHOMEPAGE = 3) => "shownHomePage",
    (NOTSHOWNHOMEPAGE = 4) => "notShownHomePage"
  }
   
  def type_str
    Type[self.tipo]
  end
end