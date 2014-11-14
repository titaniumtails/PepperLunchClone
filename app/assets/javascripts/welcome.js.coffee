# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module("pepperApp", [])

app.controller("TimetableCtrl", ["$scope", "$http", ($scope, $http) -> 
  $scope.weeks = []
  $scope.lunchCount = 0

  $scope.init = ->
    for i in [1..13]
      $scope.weeks.push [0, 0, 0, 0, 0]

  $scope.increment = (weekrow, daycol) ->
    if $scope.weeks[weekrow][daycol] is 0
      $scope.weeks[weekrow][daycol] = 1
      $scope.lunchCount += 1

    else 
      $scope.weeks[weekrow][daycol] = 0
      $scope.lunchCount -= 1

  $scope.btnClass = (dayvalue) ->
    if dayvalue is 0
      "btn-success"
    else 
      "btn-danger"

  $scope.btnWords = (dayvalue) ->
    if dayvalue is 0
      "yum"
    else 
      "bleh"

  $scope.submitCount = ->
    jsonObj = {"keydata": $scope.weeks}
    $http.post('/api/lunches/submit.json', jsonObj)
      .success (rawdata) ->
        console.log rawdata
      .error (rawdata) ->
        console.log rawdata

  $scope.init()
])