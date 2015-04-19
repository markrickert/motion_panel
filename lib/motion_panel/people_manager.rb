module Mixpanel
  class PeopleManager
    attr_accessor :token

    def initialize(token)
      self.token = token
    end

    def set(distinct_id, params)
      return false unless config.should_track?
      data = encode_64(person_json(distinct_id, params))
      url = "http://api.mixpanel.com/engage/?data=#{data}"
      AFMotion::JSON.get(url) do |result|
        yield result.body if block_given?
      end
    end

    private

    def config
      Mixpanel::ConfigManager
    end

    def person_json(distinct_id, params)
      hash = {
        '$token' => token,
        '$distinct_id' => distinct_id,
        '$set' => params
      }
      BW::JSON.generate(hash)
    end

    def encode_64(json)
      CGI.escape([json].pack('m'))
    end
  end
end
