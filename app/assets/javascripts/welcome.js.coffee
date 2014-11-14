# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module("pepperApp", [])

app.controller("TimetableCtrl", ["$scope", ($scope) -> 
  $scope.weeks = []
  $scope.lunchCount = 0

  $scope.init = ->
    for i in [1..13]
      $scope.weeks.push [0, 0, 0, 0, 0]

  $scope.increment = (weekrow, daycol) ->
    if scope.increment[weekrow][daycol] is 1
      scope.increment[weekrow][daycol] = 1
      $scope.lunchCount += 1

    else 
      scope.increment[weekrow][daycol] is 0
      $scope.lunchCount -= 1

  $scope.init()
])