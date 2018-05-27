home.controller 'homeController', ($scope, products_data) ->
  $scope.products = []

#  get all products from service 'products_data'
  products_data.get_products().then (results) ->
    $scope.products = results

#  after click on liked button
  $scope.action = (product, type) ->
    products_data.update_products(product.id, type).then (results) ->
      console.log results
      if results.response == 'success Response'
        if type == 'like'
          product.like = true
        else
          product.like = false