class JsonWebToken
  def self.encode(payload)
    exp = Time.now.to_i + 1 * 3600
    exp_payload = { data: payload, exp: exp }
    JWT.encode(exp_payload, ENV["JWT_SECRET_KEY"], "HS256")
  end

  def self.decode(token)
    JWT.decode(token, ENV["JWT_SECRET_KEY"], true, { algorithm: "HS256" }).first
  end
end