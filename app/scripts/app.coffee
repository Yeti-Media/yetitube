'use strict'

angular.module('myYoutubeApp', ['ngRoute','gapi'])
.value('GoogleApp', {
  client_id: '817305535343.apps.googleusercontent.com',
  scope:'https://www.googleapis.com/auth/youtube',
  state: 'profile',
  redirect_uri: window.location.protocol + "//"  + window.location.hostname + ':' + window.location.port + '/'
})
.run((GAPI) ->
  getURLParameter = (name) ->
    decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(window.location)||['',""])[1].replace(/\+/g, '%20'))||null
  access_token = getURLParameter('access_token') 
  success = () ->
  error = () ->
  GAPI.init(access_token, success, error)
)

