describe 'Mixpanel' do
  it 'Should throw an error if access shared without token' do
    lambda {
      Mixpanel.shared_instance
    }.should.raise(Mixpanel::NoTokenError)
  end

  it 'Should throw an error if you give a blank token to shared instance' do
    lambda {
      Mixpanel.shared_instance_with_token('')
    }.should.raise(Mixpanel::InvalidTokenError)
  end

  it 'Should allow you to use the shorthand method after providing a token' do
    Mixpanel.shared_instance_with_token('1234567890')
    Mixpanel.shared_instance.class.should.equal Mixpanel::EventManager
  end
end
