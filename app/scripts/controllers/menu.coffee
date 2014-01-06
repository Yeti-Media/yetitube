'use strict'

angular.module('myYoutubeApp').controller 'MenuCtrl', [ '$scope', 'Youtube', '$rootScope', ($scope, Youtube, $rootScope) ->

  $scope.search = () ->
    Youtube.listSearch({ 'part': 'snippet', 'q': $scope.search.query }).success((data)->
      $scope.videos = data
    )

  $scope.pickVideo = (video) ->
    $rootScope.$broadcast('PlayVideo', video)
    $scope.loadRelatedVideos(video)

  $scope.loadRelatedVideos = (video) ->
    if video.id instanceof Object
      video_id = video.id.videoId
    else
      video_id = video.id
    Youtube.listSearch({ part: 'snippet', type: 'video', relatedToVideoId: video_id}).success((data) ->
      $scope.relatedVideos = data
    )

  $scope.go = (section) ->
    $scope.menuSection = "/views/#{section}.html"
 

  $scope.load = () ->
    $scope.menuSection = '/views/popular.html'
    Youtube.listVideos({ part: 'snippet', chart: 'mostPopular' }).success((data)->
      $scope.popularVideos = data
    )

  $scope.load()
]
