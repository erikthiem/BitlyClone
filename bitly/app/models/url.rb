require 'SecureRandom'

class Url < ApplicationRecord
    validates :target, presence: true, format: { with: /http:\/\/|https:\/\//, message: "Must start with http:// or https://" }
    before_create :generate_shortcode

    def fullShortcodePath
         "/go/" + self.shortcode
    end

    def incrementClicks
        self.clicks += 1
        self.save
    end

    private

    def generate_shortcode
        rnd = ''
        loop do
            rnd = SecureRandom.hex(4).to_s
            break if !Url.exists?(shortcode: rnd)
        end
        self.shortcode = rnd
    end
end
