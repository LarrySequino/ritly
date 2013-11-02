class Url < ActiveRecord::Base
    before_create :generate_hash

    protected
    def generate_hash
        self.hash_code = loop do
            random_hash = SecureRandom.urlsafe_base64(8)
            break random_hash unless Url.exists?(hash_code: random_hash)        
        end
    end
end
