class Interview
  include Mongoid::Document

  field :name
  field :time

  field :question

  field :call_sid
  field :voice
  field :transcription

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
