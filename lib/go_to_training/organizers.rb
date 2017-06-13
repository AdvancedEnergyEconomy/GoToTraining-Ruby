module GoToTraining
  module Organizers
    
    def get_organizers
      self.class.get("#{GOTO_TRAINING_BASE_URL}/accounts/#{@account_key}/users").parsed_response
    end
    
    def get_organizers_by_training(training_key)
      self.class.get("trainings/#{training_key}/organizers").parsed_response
    end
    
  end
end
