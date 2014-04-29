module Pure360
  class Client
    attr_accessor :endpoint
    def initialize(params)
      @endpoint = params.fetch(:endpoint)
    end
  end
end
