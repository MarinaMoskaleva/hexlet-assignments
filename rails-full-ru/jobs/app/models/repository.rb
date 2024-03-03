# frozen_string_literal: true

class Repository < ApplicationRecord
  validates :link, presence: true, uniqueness: true

  include AASM

  aasm do
    state :created, initial: true
    state :fetching, :fetched, :failed

    event :start_fetching do
      transitions from: %i[created fetched failed], to: :fetching
    end

    event :finish_fetching do
      transitions from: :fetching, to: :fetched
    end

    event :fail do
      transitions from: :fetching, to: :failed
    end
  end
end
