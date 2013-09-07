require 'twilio-ruby'

class InterviewsController < ApplicationController

  def index
    @interviews = Interview.all
  end

  def show
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
    @interview = Interview.new(params[:interview])
    @interview.save

    flash[:notice] = "Your interview was submitted successfully."
    redirect_to root_path
  end

  def test_code(codestring)
  end
end
