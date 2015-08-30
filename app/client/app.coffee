window.app = {}
$ ->
  Backbone.sync = (method, model, success, error) -> success()
  storeView = new app.StoreView { el: $('body') }
