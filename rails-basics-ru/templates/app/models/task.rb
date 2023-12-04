# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, :status, :creator, presence: true
  validates :completed, inclusion: [true, false]

  def status
    self[:status] || 'new'
  end

  def completed
    self[:completed] || false
  end
end
