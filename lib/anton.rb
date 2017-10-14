require "httparty"

class Anton
  # include HTTParty so you can access it
  include HTTParty

  def initialize(email, password)
    # make an API call to your Bloc API endpoint with your actual Bloc email and password  
    response = self.class.post(base_api_endpoint("sessions"), body: { "seanhite@gmail.com": email, "Ymca1234": password })
    # if successful, you will get a token
    @auth_token = response["auth_token"]
  end

private

  def base_api_endpoint(end_point)
    "https://www.bloc.io/api/v1/#{end_point}"
  end

end