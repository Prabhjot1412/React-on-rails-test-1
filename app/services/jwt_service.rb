module JwtService
  class << self
    def encode(user_id)
      payload = { user_id: user_id}

      JWT.encode(payload, nil, 'none')
    end

    def decode(token)
      JWT.decode(token, nil, false)
    end
  end
end
