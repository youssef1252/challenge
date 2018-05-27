home.controller 'homeController', ($scope, products_data) ->
  $scope.products = []

#  get all products from service 'products_data'
  products_data.get_products().then (results) ->
    $scope.products = results

#  after click on liked button
  $scope.liked = (product, type) ->
    products_data.update_products(product.id, type).then (results) ->
      if results.response == 'success Response'
        product.like = true

home.controller 'favoriteController', ($scope, products_data) ->
  $scope.products_favorite = []

  #  get all favorites products from service 'products_data'
  products_data.favorite_products().then (results) ->
    $scope.products_favorite = results

  #  after click on liked button
  $scope.remove = (product, type) ->
    products_data.update_products(product.id, type).then (results) ->
      if results.response == 'success Response'
        product.like = false