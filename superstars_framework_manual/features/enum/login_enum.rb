class Login < ActiveRecord::Base

  Type = {
    (VALID = 1) => "valid",
    (INVALID = 2) => "invalid",
    (EXISTENT = 3) => "existent",
    (FIRST_ACCESS = 4) => "first_access"
  }
   
  def type_str
    Type[self.tipo]
  end
end