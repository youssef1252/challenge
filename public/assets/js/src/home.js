home.controller('homeController', function($scope, products_data) {
  $scope.products = [];
  products_data.get_products().then(function(results) {
    return $scope.products = results;
  });
  $scope.liked = function(product, type) {
    return products_data.update_products(product.id, type).then(function(results) {
      if (results.response === 'success Response') {
        return product.like = true;
      }
    });
  };
  return $scope.disliked = function(product, type) {
    return products_data.update_products(product.id, type).then(function(results) {
      console.log(results);
      if (results.response === 'success Response') {
        return product.like = true;
      }
    });
  };
});

home.controller('favoriteController', function($scope, products_data) {
  $scope.products_favorite = [];
  products_data.favorite_products().then(function(results) {
    return $scope.products_favorite = results;
  });
  return $scope.remove = function(product, type) {
    return products_data.update_products(product.id, type).then(function(results) {
      if (results.response === 'success Response') {
        return product.like = false;
      }
    });
  };
});
