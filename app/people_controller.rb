require_relative './loaders/people_loader'
require_relative './repositories/people_repository'
require_relative './presenters/people_presenter'
require_relative './services/people_normalize_service'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    PeopleNormalizeService.new(repository: repository.order_by(params[:order])).call
  end

  private

  attr_reader :params

  def load_data
    @load_data ||= PeopleLoader.new(params)
  end

  def repository
    @repository ||= PeopleRepository.new(load_data)
  end
end
