require_relative '../app/loaders/people_loader'
require_relative '../app/repositories/people_repository'

RSpec.describe PeopleRepository do
  let(:order) { 'first_name' }
  let(:rows) { [{ 'first_name' => 'B' }, { 'first_name' => 'A' }] }
  let(:loader) { double }

  subject { described_class.new(loader).order_by(order).map { |row| row['first_name'] } }

  it 'should sort data hashes by field' do
    allow(loader).to receive(:read) { rows }
    expect(subject).to eq(%w[A B])
  end
end
