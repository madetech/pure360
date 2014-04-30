require 'uri'
require 'net/http'
require 'net/https'

module Pure360
  class Client
    def initialize(params)
      @params = {}

      @endpoint                        = URI.parse(params.fetch(:endpoint))
      @params[:listName]               = params.fetch(:list)
      @params[:accName]                = params.fetch(:account)
      @params[:fullEmailValidationInd] = params.fetch(:full_email_validation, "N")
      @params[:doubleOptin]            = params.fetch(:double_opt_in, "false")
    end

    def subscribe(subscription_params)
      ensure_email!(subscription_params.fetch(:email))

      post(subscription_params)
    end

    private
    def ensure_email!(email)
      raise "Invalid Email" unless valid_email?(email)
    end

    def valid_email?(email)
      return false if email.empty? or email.nil?

      true
    end

    def post(*subscription_params)
      Net::HTTP.start(@endpoint.host, @endpoint.port) do |http|
        http.use_ssl = true if @endpoint.scheme == 'https'
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        req = Net::HTTP::Post.new(@endpoint.path)
        req.set_form_data(payload(subscription_params))
        http.request(req)
      end
    end

    def payload(subscription_args)
      @params.merge! subscription_args[0]
    end
  end
end
