require 'uri'
require 'SecureRandom'
require 'net/http'

class Url < ApplicationRecord
    validates :target, presence: true, format: { with: /http:\/\/|https:\/\//, message: "Must start with http:// or https://" }
    validate :test_URI
    validate :test_response

    belongs_to :user

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

    def test_URI
        uri = URI self.target
    rescue URI::InvalidURIError
        errors.add(:base, "Not a valid URL")
    end

    def test_response
        uri = URI(self.target)
        response = Net::HTTP.get(uri)
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
        Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError,
        URI::InvalidURIError, Errno::ECONNREFUSED, SocketError
        errors.add(:base, "Invalid response from URL")
    end
end
