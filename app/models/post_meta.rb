class PostMeta < Couchbase::Model

  # user who posted
  attribute :username
  # application that creates the media
  attribute :appname,         :default => ""
  # users following the posting user when posted
  attribute :following_list,  :default => []
  # users who like it
  attribute :likes,           :default => []
  # id of media doc
  attribute :media_id
  attribute :media_size
  # unix time when posted
  attribute :time,            :default => lambda { Time.now.to_i }

  view :activity_stream, :include_docs => false
end
