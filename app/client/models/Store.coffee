app = window.app
app.Store = Backbone.Collection.extend { model: app.Phone }
app.StoreView = Backbone.View.extend {
  events:
    'click button#add': 'add'
  initialize: ->
    @collection = new app.Store()
    @collection.bind 'add', @append
    @counter = 0
    @render()
  render: ->
    $(@el).append '<button id="add">Add phone</button>'
    $(@el).append '<ul></ul>'
    @append phone for phone in @collection.models
  add: ->
    @counter++
    phone = new app.Phone()
    phone.set {
      part2: phone.get('part2') + @counter
    }
    @collection.add phone
  append: (phone) ->
    phoneView = new app.PhoneView { model: phone }
    $('ul', @el).append phoneView.render().el
}
