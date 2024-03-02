json.id @user.id
json.email @user.email
json.address @user.address
json.full_name "#{@user.first_name} #{@user.last_name}"
json.posts do
  json.partial! 'api/v1/users/posts', collection: @user.posts, as: :post
end
