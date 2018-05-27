# Service for all opérations #{get all products - get favorites products - like products....}
home.factory('products_data', ['$http', ($http) ->
  factory = {}

  factory.get_products = ->
    $http.get('/products').then (result) ->
      return result.data

  factory.update_products = (id, type) ->
    $http.get('/products/update/'+id+'/'+type).then (result) ->
      return result.data

  factory.favorite_products = (id, type) ->
    $http.get('/products/favorites').then (result) ->
      return result.data

  return factory
])
