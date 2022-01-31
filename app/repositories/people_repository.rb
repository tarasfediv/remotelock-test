class PeopleRepository
  def initialize(loader)
    @rows = loader.read
  end

  def order_by(field)
    @rows.sort_by { |h| h[field.to_s] }
  end
end
