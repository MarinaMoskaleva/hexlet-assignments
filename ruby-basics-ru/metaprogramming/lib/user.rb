# frozen_string_literal: true

require_relative 'model'

class User
include Model

  attribute :name, type: :string, default: 'Andrey'
  attribute :birthday, type: :datetime
  attribute :active, type: :boolean, default: false
end

user = User.new
#  p "user.methods", user.methods
p "user.attributes", user.attributes
    # user.name = nil

    # p user.name

