module Mixpanel
  class PeopleManager
    attr_accessor :token

    def initialize(token)
      self.token = token
    end

    def set(distinct_id, params)
      engage_action(distinct_id, params, '$set')
    end

    def set_once(distinct_id, params)
      engage_action(distinct_id, params, '$set_once')
    end

    private

    def engage_action(distinct_id, params, action)
      return false unless config.should_track?
      data = encode_64(person_json(distinct_id, params, action))
      url = "http://api.mixpanel.com/engage/?data=#{data}"
      AFMotion::JSON.get(url) do |result|
        yield result.body if block_given?
      end
    end

    def config
      Mixpanel::ConfigManager
    end

    def person_json(distinct_id, params, action)
      hash = {
        '$token' => token,
        '$distinct_id' => distinct_id,
        action => params.merge(Mixpanel.default_hash)
      }
      BW::JSON.generate(hash)
    end

    def encode_64(json)
      CGI.escape([json].pack('m'))
    end
  end
end
