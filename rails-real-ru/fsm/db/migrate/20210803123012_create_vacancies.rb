# frozen_string_literal: true

class CreateVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.string :description
      t.string :aasm_state, null: false, default: 'on_moderate'

      t.timestamps
    end
  end
end
