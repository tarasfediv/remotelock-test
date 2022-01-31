require 'date'

require_relative '../presenters/people_presenter'

class PeopleNormalizeService
  def initialize(repository:)
    @repository = repository
  end

  def call
    @repository.map { |row| PeoplePresenter.present(row) }
  end
end
