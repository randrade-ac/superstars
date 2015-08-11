class EducationCertification < ActiveRecord::Base

  Type = {
    (EDUCATION = 1) => "education",
    (CERTIFICATIONEXPIRES = 2) => "certificationExpires",
    (CERTIFICATIONNONEXPIRES = 3) => "certificationNonExpires"
  }
   
  def type_str
    Type[self.tipo]
  end
end