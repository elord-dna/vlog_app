class User < ApplicationRecord
    has_many :microposts
    attr_accessor :remember_token

    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: true }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, on: create

    # return the hash of the give string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # return a random token
    # SecureRandom.urlsafe_base64 would return a string with 22 random characters or numbers
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # forget a user
    def forget
        update_attribute(:remember_digest, nil)
    end

    # return true if the given token matches the digest
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
        # BCrypt::password.new(remember_digest) == remember_token
        # in this way, == is rewriten by the bcrypt
    end

    def check_name
      if self.name && self.name.length <= 50
        return true
      else
        errors.add(:name, "name is invalid")
        return false
      end
    end

    def check_phone
      if self.phone && self.phone.length == 11 && self.phone.match(/\d{11}/)
        return true
      else 
        errors.add(:phone, "phone is invalid")
        return false
      end
    end

    def check_email
      self.email && self.email.length <= 255 && self.email.match(VALID_EMIAL_REGEX) && count(email: self.email) < 1
    end
end
