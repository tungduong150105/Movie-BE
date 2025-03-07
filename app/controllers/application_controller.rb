class ApplicationController < ActionController::API
  before_action :authenticate

  rescue_from JWT::VerificationError, with: :invalid_token
  rescue_from JWT::DecodeError, with: :decode_error

  private

  def authenticate
    authorization_header = request.headers["Authorization"]
    token = authorization_header.split(" ").last if authorization_header
    decode_token = JsonWebToken.decode(token)
  end

  def invalid_token
    render(json: {invalid_token: "Invalid Token"})
  end

  def decode_error
    render(json: {decode_error: "Decode Error"})
  end
end
