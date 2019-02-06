class SearchFacade
  def initialize(parameters)
    @zipcode = parameters
  end

  private

  def service
    @service ||= RHELService.new(ENV["NREL_API_KEY"])
  end
end
