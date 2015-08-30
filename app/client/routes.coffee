app = window.app
app.storeRouter = Backbone.Router.extend {
  container: null
  routes:
    'store/index'
  initialize: (options) ->
    @container = options.container
    @index()
  index: -> new app.StoreView { el: @container }
}
