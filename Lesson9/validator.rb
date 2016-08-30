module Validator
  def valid?
    validate!
  rescue
    false
  end
end
