window.app = {}
$ ->
  Backbone.sync = (method, model, success, error) -> success()
  router = new app.storeRouter { container: $ 'body' }
