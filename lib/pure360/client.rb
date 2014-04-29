module Pure360
  class Client
    def initialize(params)
      @endpoint              = URI.parse(params.fetch(:endpoint))
      @list                  = params.fetch(:list)
      @account               = params.fetch(:account)
      @full_email_validation = params.fetch(:full_email_validation, false)
      @double_opt_in         = params.fetch(:double_opt_in, false)
    end

    def subscribe(subscriber)
      email = subscriber.fetch(:email)
      raise "Invalid Email" unless valid_email?(email)

      Net::HTTP.post_form(@endpoint, email)
    end

    private
    def valid_email?(email)
      return false if email.empty? or email.nil?

      true
    end
  end
end
