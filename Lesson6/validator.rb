module Validator

  def valid?
    self.validate!
  rescue
    false
  end
end
