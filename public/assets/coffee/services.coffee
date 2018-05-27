home.factory('products_data', ['$http', ($http) ->
  factory = {}

  factory.get_products = ->
    $http.get('/products').then (result) ->
      return result.data
  return factory
])