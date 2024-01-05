# frozen_string_literal: true

class Vehicle < ApplicationRecord
  has_one_attached :image

  validates :manufacture, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :doors, presence: true, numericality: { only_integer: true }
  validates :kilometrage, presence: true, numericality: { only_integer: true }
  validates :production_year, presence: true

  validates :image, attached: true,
                    content_type: %i[png jpg jpeg],
                    size: { less_than: 5.megabytes }
end
