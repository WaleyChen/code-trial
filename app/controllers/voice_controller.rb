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
        render xml: "
            <Response>
                <Record timeout=\"60\" transcribe=\"true\" />
            </Response>"
    end

end