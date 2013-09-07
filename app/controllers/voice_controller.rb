require 'twilio-ruby'

class VoiceController < ApplicationController
    def twilio
        # Find these values at twilio.com/user/account
        account_sid = 'AC137a01b504ae85a808fc1523cf60cb04'
        auth_token = 'd6cdac5ab028c8051187a76e2fbace0b'
        # This application sid will play a Welcome Message.
        demo_app_sid = 'AP244ce8f18416aa34561138d5379f2b40'
        capability = Twilio::Util::Capability.new account_sid, auth_token
        capability.allow_client_outgoing demo_app_sid
        @token = capability.generate
    end

    def recordVoice
        interview = Interview.where(:call_id=>nil).last
        interview.call_sid = params[:CallSid]
        interview.save

        render xml: "
            <Response>
                <Record timeout=\"60\" transcribe=\"true\" action=\"http://codetrial.herokuapp.com/finishedRecording\" transcribeCallback=\"http://codetrial.herokuapp.com/transcribeCallback\" />
            </Response>"
    end

    def finishedRecording
        interview = Interview.where(:call_sid => params[:CallSid]).first
        interview.voice = params[:RecordingUrl]
        interview.save

        render :nothing => true, :status => 200
    end

    def transcribeCallback
        interview = Interview.where(:call_sid => params[:CallSid]).first
        interview.transcription = params[:TranscriptionText]
        interview.save

        render :nothing => true, :status => 200
    end

end
