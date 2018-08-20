require 'spec_helper'

describe OmniAuth::Strategies::Campfire do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }

  subject do
    args = ['appid', 'secret', @options || {}].compact
    OmniAuth::Strategies::Campfire.new(*args).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  describe 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq(:campfire)
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://camp-fire.jp')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_path).to eq('/oauth/authorize')
    end
  end

  describe 'info' do
    before do
      allow(subject).to receive(:raw_info).and_return(raw_info_hash)
    end

    it 'should returns the email' do
      expect(subject.info[:email]).to eq(raw_info_hash['email'])
    end

    it 'should returns the name' do
      expect(subject.info[:name]).to eq(raw_info_hash['name'])
    end

    it 'should returns the profile' do
      expect(subject.info[:profile]).to eq(raw_info_hash['profile'])
    end

    it 'should returns the profile_image_url' do
      expect(subject.info[:profile_image_url]).to eq(raw_info_hash['profile_image_url'])
    end
  end
end

private

def raw_info_hash
  {
    'email' => 'hi@example.com',
    'name' => 'John Doe',
    'profile' => 'Hi, this is the sample profile text.',
    'profile_image_url' => 'https://example.com/images/sample.png',
  }
end
