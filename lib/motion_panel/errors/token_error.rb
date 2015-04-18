module Mixpanel
  class NoTokenError < StandardError
    def initialize(msg = 'Please initiate shared_instance_with_token with a '\
                         'valid token first.')
      super(msg)
    end
  end

  class InvalidTokenError < StandardError
    def initialize(msg = 'Please include a valid Mixpanel token.')
      super(msg)
    end
  end
end
