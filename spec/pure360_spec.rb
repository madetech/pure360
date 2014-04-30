require 'spec_helper'

describe Pure360 do
  let(:params) do
    { endpoint:              "https://news.test.com/lists",
      list:                  "ActiveData_2014-04-14",
      account:               "Client",
      full_email_validation: "false",
      double_opt_in:         "false" }
  end

  context "#new" do
    it 'Parses an HTTPS endpoint' do
      p360 = Pure360::Client.new(params)

      p360.instance_variable_get(:@endpoint).should be_kind_of(URI::HTTPS)
    end

    it 'Creates a new object' do
      p360 = Pure360::Client.new(params)

      p360.instance_variable_get(:@params)[:listName].should eq(params[:list])
      p360.instance_variable_get(:@params)[:accName].should eq(params[:account])
      p360.instance_variable_get(:@params)[:fullEmailValidationInd].should eq(params[:full_email_validation])
      p360.instance_variable_get(:@params)[:doubleOptin].should eq(params[:double_opt_in])
    end
  end

  context "#subscribe" do
    context 'Successful subscribe' do
      let(:subscriber_params) do
        { :email => 'test@test.com' }
      end
      let(:p360) { Pure360::Client.new(params) }
      let(:parsed_endpoint) { URI.parse(params[:endpoint]) }
      let(:http) { double(:http).as_null_object }
      let(:post) { double(:post).as_null_object }

      before(:each) do
        Net::HTTP.stub(:start).and_yield http
        Net::HTTP::Post.stub(:new).and_return post
      end

      it 'sends any custom customer params specified to the endpoint' do
        post.should_receive(:set_form_data).with(hash_including(subscriber_params))

        p360.subscribe(subscriber_params)
      end
    end

    context 'Unsuccessful subscribe' do
      it 'fails if an email is not present in the subscriber params' do
        subscriber_params = {}
        expect { Pure360::Client.new(params).subscribe(subscriber_params) }.to raise_error
      end

      it 'fails if an email is present in the subscriber params but blank' do
        subscriber_params = { email: "" }
        expect { Pure360::Client.new(params).subscribe(subscriber_params) }.to raise_error
      end

      it 'fails if an email is present in the subscriber params but blank' do
        subscriber_params = { email: nil }
        expect { Pure360::Client.new(params).subscribe(subscriber_params) }.to raise_error
      end
    end
  end
end
