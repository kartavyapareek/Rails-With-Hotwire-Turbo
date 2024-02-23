# frozen_string_literal: true

class Person < ApplicationRecord
  # validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # associations
  has_one :detail, dependent: :destroy
end
