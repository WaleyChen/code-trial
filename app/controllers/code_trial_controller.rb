class CodeTrialController < ApplicationController
    def index
        @codeTrials = CodeTrial.all
    end

    def show
        codeTrial = CodeTrial.where(:id => params[:id]).first
        @questions = codeTrial.questions
    end
end