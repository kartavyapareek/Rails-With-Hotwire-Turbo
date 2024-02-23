# frozen_string_literal: true

class Detail < ApplicationRecord
  # validations
  validates :name, presence: true

  # associations
  belongs_to :person
end
