function(doc, meta) {
  if (doc.type = "following") {
    emit(doc.following_username, doc.username);
  }
}
