# frozen_string_literal: true

5.times do |index|
  b_index = index + 1
  Bulletin.create(title: "Title #{b_index}", body: "bulletin's body #{b_index}", published: (b_index % 2).zero?)
end
