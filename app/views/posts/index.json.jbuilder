json.array!(@posts) do |post|
  json.extract! post, :id, :summary, :language, :user_id
  json.url post_url(post, format: :json)
end
