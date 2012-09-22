function(doc, meta) {
  if (doc.type = "following") {
    emit(doc.username, doc.following_username);
  }
}
