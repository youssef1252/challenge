var home;

home = angular.module('appHome', []);

home.controller('homeController', function($scope) {
  return $scope.products = [];
});
