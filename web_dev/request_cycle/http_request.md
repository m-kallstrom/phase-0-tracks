#What are some common HTTP status codes?

200 OK
300 Multiple Choices
301 Moved Permanently
302 Found
304 Not Modified
307 Temporary Redirect
400 Bad Request
401 Unauthorized
*403 Forbidden
*404 Not Found
410 Gone
500 Internal Server Error
501 Not Implemented
*503 Service Unavailable
*504 Gateway Timeout
*550 Permission denied

*Ones I remember having run into.

#What is the difference between a GET request and a POST request? When might each be used?

GET - Requests data from a specified resource
POST - Submits data to be processed to a specified resource

You would generally use GET to, well, get files/info from another server whereas you'd use POST to send files/info to a server. GET shouldn't be used for sensitive information because it stores info and is more vulnerable to hacking.

Apparently GET useage should be restricted to cases where it's "idempotent"-- where redoing the operation will not change the results.

There are also a few more types:

HEAD  Same as GET but returns only HTTP headers and no document body
PUT Uploads a representation of the specified URI
DELETE  Deletes the specified resource
OPTIONS Returns the HTTP methods that the server supports
CONNECT Converts the request connection to a transparent TCP/IP tunnel

#Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?

Cookies are small text files created by a particular website that store user information so that the website 'remembers' that user and any settings for them. It helps with personalization, makes it so you don't have to log into a website every time you use it, etc. Advertisers associated with a a particular webpage can also store and access cookies across platforms, so if you look up 'goatsmilk soap' in Google, you might find an add for it on a random webpage you visit.

Cookies are passed in HTML headers. Since HTTP doesn't have memory, it helps servers remember specific users.

Apparently web storage API is the way to go these days?

