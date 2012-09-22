function(doc, meta) {
  if (doc.type != "postmeta")
    return;
  emit([doc.username, doc.time], {poster: doc.username, media_id: doc.media_id, likes: doc.likes});
  doc.followinglist.forEach(function(user) {
    emits([user, doc.time], {poster: doc.username, media_id: doc.media_id, likes: doc.likes});
  });
}
