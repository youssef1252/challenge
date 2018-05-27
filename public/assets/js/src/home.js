home.controller('homeController', function($scope, products_data) {
  $scope.products = [];
  return products_data.get_products().then(function(results) {
    return $scope.products = results;
  });
});
