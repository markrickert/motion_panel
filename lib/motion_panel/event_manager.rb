module Mixpanel
  class EventManager
    def initialize(token)
      @token = token
    end

    def track(event_name, params = {})
      data = encode_64(event_json(event_name, params))
      url = "http://api.mixpanel.com/track/?data=#{data}"
      AFMotion::JSON.get(url) do |result|
        yield result.body if block_given?
      end
    end

    def set_person(distinct_id, params = {})
      data = encode_64(person_json(distinct_id, params))
      url = "http://api.mixpanel.com/engage/?data=#{data}"
      AFMotion::JSON.get(url) do |result|
        yield result.body if block_given?
      end
    end

    private

    def event_json(name, params)
      hash = {
        'event' => name,
        'properties' => {
          'token' => @token
        }.merge(params)
      }
      BW::JSON.generate(hash)
    end

    def person_json(distinct_id, params)
      hash = {
        '$token' => @token,
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
