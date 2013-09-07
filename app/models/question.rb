class Question
  include Mongoid::Document

  field :text
  field :type
  field :position

  # belongs_to :code_trial
  has_one :answer
end
