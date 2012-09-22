function(doc, meta) {
  if (doc.type != "postmeta")
    return;
  emit([doc.user, doc.time], {poster: doc.username, media_id: doc.media_id, likes: doc.likes});
}
