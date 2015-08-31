app = window.app
app.Phone = Backbone.Model.extend {
  urlRoot: '/phone'
}
app.PhoneView = Backbone.View.extend {
  tagName: 'div'
  events:
    'click .phone-destroy': 'destroy'
  render: ->
    @$el.html $('#phone-view').html()
    @renderReflow()
  renderReflow: ->
    $('.phone-name', @$el).text @model.get 'name'
    @
  destroy: ->
    @model.destroy()
    @remove()
}
