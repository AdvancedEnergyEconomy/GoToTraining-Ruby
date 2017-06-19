module GoToTraining
  module Sessions
    
    def get_sessions_by_date_range(params)
      self.class.post("#{GoToTraining::Client::GOTO_TRAINING_BASE_URL}/reports/organizers/#{organizer_key}/sessions", :body => params).parsed_response
    end
    
    def get_sessions_by_training(training_key)
      self.class.get("#{GoToTraining::Client::GOTO_TRAINING_BASE_URL}/reports/organizers/#{organizer_key}/trainings/#{training_key}").parsed_response
    end
    
  end
end
