module Mixpanel
  class EventManager
    def initialize(token)
      @token = token
    end

    def track(event_name, params)
      data = [event_json(name)].pack('m')
      url = "http://api.mixpanel.com/track/?data=#{data}&verbose=1"
      AFMotion::HTTP.get(url) do |result|
        puts result.body
      end
    end

    private

    def event_json(name)
      BW::JSON.generate(
      {
        'event' => name,
        'properties' => {
          'token' => @token
        }
      })
    end
  end
end
