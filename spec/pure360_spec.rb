require 'spec_helper'

describe Pure360 do
  it 'Sets the endpoint' do
    an_endpoint = "https://a_pure_360_endpoint.com"
    p360 = Pure360::Client.new(:endpoint => an_endpoint)
    p360.endpoint.should == an_endpoint
  end
end
