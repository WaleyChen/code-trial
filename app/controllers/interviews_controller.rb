class InterviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def test_code(codestring)
  end

  def create
    @submitted = params
  end

  def record
    code_changes = params["code_changes"]
    code_timestamps = params["code_timestamps"]
    puts 'params',params
    puts 'code_changes',code_changes
    puts 'code_timestamps',code_timestamps
  end
end
