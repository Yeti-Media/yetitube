'use strict'

angular.module('myYoutubeApp').controller 'VideoPlayerCtrl',['$scope', '$sce', ($scope, $sce) ->
  $scope.$on 'PlayVideo', (event, video) ->
    if video.id instanceof Object
      video_id = video.id.videoId
    else
      video_id = video.id
    $scope.video_url = $sce.trustAsResourceUrl("//www.youtube.com/embed/#{video_id}?html5=1&showinfo=0&controls=2&autoplay=1")
    console.log $scope.video_url
]
