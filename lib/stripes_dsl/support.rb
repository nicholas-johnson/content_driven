class String
  def underscore
    self.downcase
  end
  def pluralise
    self + "s"
  end
end

class Fixnum
  def to_sym
    self.to_s.to_sym
  end
end
