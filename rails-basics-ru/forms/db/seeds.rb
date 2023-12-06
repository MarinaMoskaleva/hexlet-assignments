# frozen_string_literal: true

require 'faker'

10.times do
  Post.create(
    title: Faker::Movies::VForVendetta.character,
    body: Faker::Movies::VForVendetta.speech,
    published: Faker::Boolean.boolean,
    summary: Faker::Movies::VForVendetta.quote
  )
end
