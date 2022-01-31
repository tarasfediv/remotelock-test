require 'date'

module PeoplePresenter

  DATE_FORMAT = '%-m/%-d/%Y'
  OUTPUT_DELIMITER = ', '
  CITIES_DICT = {'LA'=>'Los Angeles','NYC'=>'New York City'}.freeze

  OUTPUT = {
    first_name: -> (first_name) { first_name },
    city: -> (city) { CITIES_DICT[city] || city },
    birthdate: -> (date) { Date.parse(date).strftime(DATE_FORMAT) }
  }.freeze

  def self.present(row)
    OUTPUT.map do |k,v|
      v.call(row[k.to_s])
    end.join(OUTPUT_DELIMITER)
  end
end