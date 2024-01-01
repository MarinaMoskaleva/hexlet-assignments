# frozen_string_literal: true

class Vacancy < ApplicationRecord
  include AASM

  aasm whiny_transitions: false do
    state :on_moderate, initial: true
    state :published, :archived

    event :publish do
      transitions from: :on_moderate, to: :published
    end

    event :archive do
      transitions from: %i[on_moderate published], to: :archived
    end
  end

  

  validates :title, presence: true
  validates :description, presence: true

  # BEGIN
  
  # END
end
