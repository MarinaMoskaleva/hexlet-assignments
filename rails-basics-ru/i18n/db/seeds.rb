# frozen_string_literal: true

require 'faker'

5.times do
  Post.create(
    {
      title: Faker::Movies::HarryPotter.character,
      body: Faker::ChuckNorris.fact
    }
  )
end

10.times do
  post_id = Post.all.sample.id 
  Post::Comment.create(
    {
      post_id: post_id,
      body: Faker::ChuckNorris.fact
    }
  )
end