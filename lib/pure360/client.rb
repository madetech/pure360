module Pure360
  class Client
    def initialize(params)
      @endpoint              = URI.parse(params.fetch(:endpoint))
      @list                  = params.fetch(:list)
      @account               = params.fetch(:account)
      @full_email_validation = params.fetch(:full_email_validation, false)
      @double_opt_in         = params.fetch(:double_opt_in, false)
    end

    def subscribe(subscriber_params)
      ensure_email!(subscriber_params.fetch(:email))

      post(subscriber_params)
    end

    private
    def ensure_email!(email)
      raise "Invalid Email" unless valid_email?(email)
    end

    def valid_email?(email)
      return false if email.empty? or email.nil?

      true
    end

    def post(*args)
      Net::HTTP.post_form(@endpoint, args)
    end
  end
end
