home.factory('products_data', [
  '$http', function($http) {
    var factory;
    factory = {};
    factory.get_products = function() {
      return $http.get('/products').then(function(result) {
        return result.data;
      });
    };
    factory.update_products = function(id, type) {
      return $http.get('/products/update/' + id + '/' + type).then(function(result) {
        return result.data;
      });
    };
    factory.favorite_products = function() {
      return $http.get('/products/favorites').then(function(result) {
        return result.data;
      });
    };
    return factory;
  }
]);
