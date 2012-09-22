simple_social
=============

server for simple media sharing and social network, intended for children

Kindergram backend model


# documents
2 docs per post:
```javascript
{
  type:"postmeta",   // doc type
  appname:"",        // application that creates the media
  followinglist: [], // users following the posting user when posted
  likes: [],         // users who like it
  username: "",      // user who posted
  media_id: "",      // id of media doc
  time: integer      // unix time when posted
}
```
media doc: contains the binary, has media_id as key
  


```javascript
{
  type: "user",
  username: "" // users id
  apps: []     // list of apps you use
}
```

```javascript
{
  type: "following"
  username: "damienkatz",      //user who is following someone
  following_username: "sergey" //user who is being followed
}
```

# views
following activity stream:

```javascript
function(doc, meta) {
  if (doc.type != "postmeta")
    return;
  emit([doc.username, doc.time], {poster: doc.username, media_id: doc.media_id, likes: doc.likes});
  doc.followinglist.forEach(function(user) {
    emits([user, doc.time], {poster: doc.username, media_id: doc.media_id, likes: doc.likes});
  });
}
```

my\_activity\_stream:

```javascript
function(doc, meta) {
  if (doc.type != "postmeta")
    return;
  emit([doc.user, doc.time], {poster: doc.username, media_id: doc.media_id, likes: doc.likes});
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