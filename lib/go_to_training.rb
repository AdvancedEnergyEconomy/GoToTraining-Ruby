require "httparty"
require 'multi_json'

require "go_to_training/version"
require "go_to_training/trainings"
require "go_to_training/registrants"
require "go_to_training/organizers"
require "go_to_training/sessions"

module GoToTraining
  class Client

    GOTO_TRAINING_BASE_URL = 'https://api.getgo.com/G2T/rest'
    
    include HTTParty
    format :json

    include GoToTraining::Trainings
    include GoToTraining::Registrants
    include GoToTraining::Organizers
    include GoToTraining::Sessions
    
    attr_accessor :access_token
    attr_accessor :organizer_key
    attr_accessor :account_key
    
    def initialize(access_token, account_key, organizer_key, extra_params = {})
      
      # the access token from oauth 
      @access_token = access_token
      @organizer_key = organizer_key
      @account_key = account_key
      
      @default_params = {
        :base_uri => "#{GOTO_TRAINING_BASE_URL}/organizers/#{@organizer_key}",
        :headers => {
          "Content-type" => "application/json",
          "Accept" => "application/json",
          "Authorization" => "OAuth oauth_token=#{@access_token}" 
        }
      }
      
      @default_params = @default_params.merge(extra_params).freeze
      self.class.default_options = self.class.default_options.merge(@default_params).freeze
    end
    
  end

end

