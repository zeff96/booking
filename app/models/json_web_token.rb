class JsonWebToken
  def self.generate_access_token(user_id)
    exp = 1.hours.from_now.to_i
    payload = { sub: user_id, exp: exp }
    JWT.encode(payload, ENV["JWT_SECRET_KEY"], "HS256")
  end

  def self.generate_refresh_token(user_id)
    exp = 24.hours.from_now.to_i
    payload = {sub: user_id, exp: exp}
    JWT.encode(payload, ENV["JWT_SECRET_KEY"], 'HS256')
  end

  def self.decode(token)
    JWT.decode(token, ENV["JWT_SECRET_KEY"], true, { algorithm: "HS256" }).first
  end
end