module Mixpanel
  class EventManager
    def initialize(token)
      @token = token
    end

    def track(event_name, params = {})
      data = [event_json(event_name, params)].pack('m')
      url = "http://api.mixpanel.com/track/?data=#{CGI.escape(data)}&verbose=1"
      AFMotion::JSON.get(url) do |result|
        puts result.body
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
  end
end
