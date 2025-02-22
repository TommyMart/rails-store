# JWT Helper for DRY
class JsonWebToken
  SECRET_KEY = Rails.application.credentials.secret_key_base.to_s

  # Encode a payload into a token with an exp time
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # Decode a token and return payload
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::DecodeError
    nil
  end
end
