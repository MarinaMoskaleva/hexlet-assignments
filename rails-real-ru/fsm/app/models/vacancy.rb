# frozen_string_literal: true

class Vacancy < ApplicationRecord
  include AASM

  aasm do
    state :on_moderate, initial: true
    state :published, :archived

    event :publish do
      transitions from: [:on_moderate, :archived], to: :published
    end

    event :archive do
      transitions from: [:on_moderate, :published], to: :archived
    end
  end

  

  validates :title, presence: true
  validates :description, presence: true

  # BEGIN
  
  # END
end
