require 'spec_helper'

describe Pure360 do
  let(:params) {
    {
      endpoint:              "https://news.test.com/lists",
      list:                  "ActiveData_2014-04-14",
      account:               "Client",
      full_email_validation: false,
      double_opt_in:         false
    }
  }

  it 'Creates a new object' do
    p360 = Pure360::Client.new(params)

    p360.instance_variable_get(:@endpoint).should eq(params[:endpoint])
    p360.instance_variable_get(:@list).should eq(params[:list])
    p360.instance_variable_get(:@account).should eq(params[:account])
    p360.instance_variable_get(:@full_email_validation).should eq(params[:full_email_validation])
    p360.instance_variable_get(:@double_opt_in).should eq( params[:double_opt_in])
  end
end