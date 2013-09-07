class CodeTrial
  include Mongoid::Document

  has_many :questions
end
