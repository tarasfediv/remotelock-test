class PeopleLoader
  DELIMITERS = {
    dollar_format: ' $ ',
    percent_format: ' % '
  }.freeze

  def initialize(params)
    @users_data = params.slice(*DELIMITERS.keys)
    @order = params[:order]
  end

  def read
    @users_data.map do |k, v|
      format_to_hash(parse_data(v, DELIMITERS[k]))
    end.flatten
  end

  private

  def parse_data(data, delimiter)
    data.split("\n").map { |raw| raw.split(delimiter) }
  end

  def format_to_hash(arr)
    arr[1..-1].map { |a| arr.first.zip(a).to_h }.compact
  end
end
