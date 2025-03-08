class JsonWebToken
  # JWT_SECRET = Rails.application.secrets.secret_key_base
  JWT_SECRET = "d93ccd49a0e361dd83ca389d20abb047152f7fd4f44b67e4d4006136427bcb4905bda0e7ceac120783b508b11ef9724aa4c0dfb6a3b6bcc3183f7ad52e39ce9a"

  def self.encode(payload, exp = 30.minutes.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, JWT_SECRET)[0]
    HashWithIndifferentAccess.new(body)
  end
end
