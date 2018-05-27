home.controller 'homeController', ($scope, products_data) ->
  $scope.products = []

#  get all products from service 'products_data'
  products_data.get_products().then (results) ->
    $scope.products = results
