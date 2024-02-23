# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Detail do
  describe 'validations' do
    let(:person) { Person.create(email: 'xyz@example.com') }

    it 'is valid with valid attributes' do
      detail = described_class.new(name: 'John Doe', person:)
      expect(detail).to be_valid
    end

    it 'is not valid without a name' do
      detail = described_class.new(name: nil)
      expect(detail).not_to be_valid
    end

    it 'is associated with a person' do
      detail = described_class.new(name: 'John Doe', person:)
      expect(detail.person).to eq(person)
    end

    it 'is destroyed when the associated person is destroyed' do
      described_class.new(name: 'John Doe', person:)
      expect { person.destroy }.not_to change(described_class, :count)
    end
  end
end
