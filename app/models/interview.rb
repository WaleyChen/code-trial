class Interview
  include Mongoid::Document

  field :name
  field :question
  field :voice
  field :code_changes
  field :code_timestamps

  # seedData = [
  #   'FizzBuzz'
  # ]

  # def self.seed
  #   seedData.each do |seed|

  #   end
  # end
end
