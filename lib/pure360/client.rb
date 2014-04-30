require 'uri'
require 'net/http'
require 'net/https'

module Pure360
  class Client
    def initialize(params)
      @params = {}

      @params[:endpoint]               = URI.parse(params.fetch(:endpoint))
      @params[:listName]               = params.fetch(:list)
      @params[:accName]                = params.fetch(:account)
      @params[:fullEmailValidationInd] = params.fetch(:full_email_validation, "N")
      @params[:doubleOptin]            = params.fetch(:double_opt_in, "false")
    end

    def subscribe(subscription_params)
      ensure_email!(subscription_params.fetch(:email))

      response = post(subscription_params)

      response.body
    end

    private
    def ensure_email!(email)
      raise "Invalid Email" unless valid_email?(email)
    end

    def valid_email?(email)
      return false if email.empty? or email.nil?

      true
    end

    def post(subscription_params)
      req = Net::HTTP::Post.new(@params[:endpoint].path)
      req.set_form_data(payload(subscription_params))
      http.request(req)
    end

    def http
      https = Net::HTTP.new(@params[:endpoint].host, @params[:endpoint].port)
      https.use_ssl = true
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE

      https
    end

    def payload(subscription_args)
      @params.merge subscription_args
    end
  end
end
