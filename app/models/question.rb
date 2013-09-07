class Question
  include Mongoid::Document

  field :text
  field :type
  field :position

  has_one :answer
end
