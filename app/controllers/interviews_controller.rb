require 'twilio-ruby'

class InterviewsController < ApplicationController

  def index
    @interviews = Interview.all
  end

  def show
    @interview = Interview.where(:id => params[:id]).first
  end

  def new
    # Find these values at twilio.com/user/account
    account_sid = 'AC137a01b504ae85a808fc1523cf60cb04'
    auth_token = 'd6cdac5ab028c8051187a76e2fbace0b'
    # This application sid will play a Welcome Message.
    demo_app_sid = 'AP244ce8f18416aa34561138d5379f2b40'
    capability = Twilio::Util::Capability.new account_sid, auth_token
    capability.allow_client_outgoing demo_app_sid
    @token = capability.generate

    @interview = Interview.new
  end

  def create
    puts 'ASDF'
    puts params[:interview]
    @interview = Interview.last
    @interview.update_attributes(params[:interview])
    puts @interview.id
    puts @interview.inspect
    @interview.save

    flash[:notice] = "Your interview was submitted successfully."
    redirect_to root_path
  end

  def test_code
    code = params[:codearea]
    run_code = <<-HDOC

fizzbuzztests = [ { call: "fizzbuzz(3)", out: 'fizz' } ,
            { call: "fizzbuzz(5)", out: 'buzz' },
            { call: "fizzbuzz(15)",  out: 'fizzbuzz' } ,
            { call: "fizzbuzz(7)",  out: '' } ]
final_res = []
fizzbuzztests.each_with_index do |test, index|
  retval = eval(test[:call])
  if retval == test[:out]
    final_res += [{ status: true, text: "Test " + index.to_s + " passed OK!" }]
  else
    final_res += [{ status: false, text: "Test " + index.to_s + " failed! Expected '" + test[:out] + "', got '" + retval + "' for " + test[:call] }]
  end
end
final_res
HDOC

  begin
    lambda do
      render json: eval(code + run_code)
    end.call
  rescue Exception => e
    render json: { status: false, text: "Fatal error! " + e.message }
  end


  
  end

  def record
    code_changes = params["code_changes"]
    code_timestamps = params["code_timestamps"]
    puts 'params',params
    puts 'code_changes',code_changes
    puts 'code_timestamps',code_timestamps
  end
end
