class CodeTrial
  include Mongoid::Document

  field :name

  has_many :questions

  # seedData = [
  #   'FizzBuzz'
  # ]

  # def self.seed
  #   seedData.each do |seed|
        
  #   end
  # end
end
