require "httparty"

class Anton
  # include HTTParty so you can access it
  include HTTParty

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

private

  def base_api_endpoint(end_point)
    "https://www.bloc.io/api/v1/#{end_point}"
  end

end