home.controller('homeController', function($scope, products_data) {
  $scope.products = [];
  products_data.get_products().then(function(results) {
    return $scope.products = results;
  });
  return $scope.action = function(product, type) {
    return products_data.update_products(product.id, type).then(function(results) {
      console.log(results);
      if (results.response === 'success Response') {
        if (type === 'like') {
          return product.like = true;
        } else {
          return product.like = false;
        }
      }
    });
  };
});
