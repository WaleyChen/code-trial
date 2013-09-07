require 'twilio-ruby'

class VoiceController < ApplicationController
    def twilio
        # Find these values at twilio.com/user/account
        account_sid = 'AC137a01b504ae85a808fc1523cf60cb04'
        auth_token = 'd6cdac5ab028c8051187a76e2fbace0b'
        # This application sid will play a Welcome Message.
        demo_app_sid = 'APabe7650f654fc34655fc81ae71caa3ff'
        capability = Twilio::Util::Capability.new account_sid, auth_token
        capability.allow_client_outgoing demo_app_sid
        @token = capability.generate
    end

    def recordVoice
        render xml: "
            <Response>
                <Say voice=\"woman\">Please leave a message after the tone.</Say>
                <Record maxLength=\"20\" />
            </Response>"
    end
end