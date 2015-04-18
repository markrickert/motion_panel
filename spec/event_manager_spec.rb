describe 'Mixpanel::EventManager' do
  it 'Should encode properly' do
    em = Mixpanel::EventManager.new('12345')
    em.send(:encode_64, 'Encode this').should.equal 'RW5jb2RlIHRoaXM%3D%0A'
  end
end
