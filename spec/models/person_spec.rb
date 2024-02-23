# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person do
  it 'is valid with valid attributes' do
    person = described_class.new(email: 'test@example.com')
    expect(person).to be_valid
  end

  it 'is not valid without an email' do
    person = described_class.new(email: nil)
    expect(person).not_to be_valid
  end

  it 'is not valid with a duplicate email' do
    described_class.create(email: 'test@example.com')
    person = described_class.new(email: 'test@example.com')
    expect(person).not_to be_valid
  end

  it 'is not valid with an invalid email' do
    person = described_class.new(email: 'test')
    expect(person).not_to be_valid
  end
end
