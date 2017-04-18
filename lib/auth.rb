class Auth
  SECRET= Rails.application.secrets.jwt_secret
  def self.issue(payload)
    JWT.encode(payload,SECRET)
  end
  def self.decode(token)
    JWT.decode(token,SECRET).first
  end
end
