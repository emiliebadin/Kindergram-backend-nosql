class User < Couchbase::Model

  attribute :username

  view :my_activity_stream, :include_docs => false
  view :my_followers, :include_docs => false
  view :who_i_follow, :include_docs => false
end
