app = window.app
app.Store = Backbone.Collection.extend {
  model: app.Phone
  url: '/phones'
}
app.StoreView = Backbone.View.extend {
  events:
    'submit form': 'submit'
  initialize: ->
    _.bindAll @, 'append'
    @collection = new app.Store()
    @collection.bind 'add', @append
    @collection.fetch()
    @render()
  render: ->
    @$el.html $('#store-index').html()
    @renderReflow()
  renderReflow: ->
    $('#phones-list', @$el).toggleClass 'hide', @collection.length == 0
    $('#empty-phones', @$el).toggleClass 'hide', @collection.length > 0
    @
  submit: (e) ->
    e.preventDefault()
    $phoneInput = $('#phone-name', @el)

    phone = new app.Phone { name: $phoneInput.val() }
    phone.save()
    @collection.add phone

    $phoneInput.val ''
    @
  append: (phone) ->
    phoneView = new app.PhoneView { model: phone }
    $('#phones-list', @el).append phoneView.render().el
    @renderReflow()
}
