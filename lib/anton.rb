require "httparty"
require './lib/roadmap'


  class Anton
    # include HTTParty so you can access it
    include HTTParty
    include Roadmap

    def initialize(email, password)
      # make an API call to your Bloc API endpoint with your actual Bloc email and password  
      response = self.class.post(base_api_endpoint("sessions"), body: { "email": email, "password": password })
      # if successful, you will get a token
      @auth_token = response["auth_token"]
    end

    def get_me
      response = self.class.get(base_api_endpoint("users/me"), headers: { "authorization" => @auth_token })
      @user_data = JSON.parse(response.body)
    end

    def get_mentor_availability(mentor_id)
      response = self.class.get(base_api_endpoint("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
      @mentor_data = JSON.parse(response.body)
    end  

    def get_messages(page = nil)
      if page == nil
        response = self.class.get(base_api_endpoint("message_threads"), headers: { "authorization" => @auth_token })
      else
        response = self.class.get(base_api_endpoint("message_threads?=page#{page}"), headers: { "authorization" => @auth_token })
      end  
      @messages = JSON.parse(response.body)
    end 

    def create_messages(sender, recipient_id, subject, text)
      new_message = self.class.post(base_api_endpoint("messages"),
        body: {"sender": sender, "recipient_id": recipient_id, "subject": subject, "stripped-text": text }, headers: { "authorization" => @auth_token })
    end

  private

    def base_api_endpoint(end_point)
      "https://www.bloc.io/api/v1/#{end_point}"
    end
end