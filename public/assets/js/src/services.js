home.factory('products_data', [
  '$http', function($http) {
    var factory;
    factory = {};
    factory.get_products = function() {
      return $http.get('/products').then(function(result) {
        return result.data;
      });
    };
    return factory;
  }
]);
