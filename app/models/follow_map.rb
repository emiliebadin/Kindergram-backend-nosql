class FollowMap < Couchbase::Model

  # user who is following someone
  attribute :username
  # user who is being followed
  attribute :following_username

end
