simple_social
=============

server for simple media sharing and social network, intended for children

Kindergram backend model


# documents
2 docs per post:
postmeta:
  appname
  followinglist - usernames who are following [damien, jchris, sergey]
  likes - list - usernames who like
  username - poster
  mediaid = id of photo
  time: when posted
media:
  binary
  random id


user profile:
  username
  apps - list of apps you use

"following" association:
  username: damienkatz
  following_username: sergey


# views
following activity stream:

```javascript
function(doc, meta) {
  if (doc.type != "postmeta")
    return;
  emit([doc.username, doc.time], {poster: username, media_id: media_id, likes: doc.likes});
  foreach(user in followinglist)
    emits([user, doc.time], {poster: username, media_id: media_id, likes: doc.likes});
}
```

my\_activity\_stream:

```javascript
function(doc, meta) {
  if (doc.type != "postmeta")
    return;
  emit([doc.user, doc.time], {poster: username, media_id: media_id, likes: doc.likes});
}
```
  
my\_followers:

```javascript
function(doc, meta) {
  if (doc.type = "following") {
    emit(doc.following_username, doc.username);
  }
}
```

who\_i\_follow:
```javascript
function(doc, meta) {
  if (doc.type = "following") {
    emit(doc.username, doc.following_username);
  }
}
```
    
popular posts:
????