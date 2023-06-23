class AuthController < ApplicationController
    def access_token
      token_endpoint = 'https://auth.reloadly.com/oauth/token'
      credentials = {
        client_id: '5IlYhQTzSZL3Ax8TtSmMpnEEdCishQEJ',
        client_secret: 'rrBf89OkVL-3CX6HtuHnMct9I6sgTe-xtX9XV2dOkDRdIj7ECRBik4RHBCDmh4H',
        grant_type: 'client_credentials',
        audience: 'https://giftcards-sandbox.reloadly.com'
      }
  
      response = RestClient.post(token_endpoint, credentials.to_json, content_type: :json)
      access_token = JSON.parse(response.body)['access_token']
      render json: { access_token: access_token }
    rescue => e
      render json: { error: 'Internal server error' }, status: :internal_server_error
    end
  end
  