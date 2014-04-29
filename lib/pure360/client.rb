module Pure360
  class Client
    def initialize(params)
      @endpoint              = params.fetch(:endpoint)
      @list                  = params.fetch(:list)
      @account               = params.fetch(:account)
      @full_email_validation = params.fetch(:full_email_validation, false)
      @double_opt_in         = params.fetch(:double_opt_in, false)
    end
  end
end