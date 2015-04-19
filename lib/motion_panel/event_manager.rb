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

    def people
      people_manager
    end

    def set_person(distinct_id, params = {})
      puts '## Set person is depreciated, please use people.set'
      people_manager.set(distinct_id, params)
    end

    private

    def people_manager
      @people_manager ||= PeopleManager.new(@token)
    end

    def event_json(name, params)
      hash = {
        'event' => name,
        'properties' => {
          'token' => @token
        }.merge(params)
      }
      BW::JSON.generate(hash)
    end

    def encode_64(json)
      CGI.escape([json].pack('m'))
    end
  end
end
