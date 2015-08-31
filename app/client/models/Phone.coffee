app = window.app
app.Phone = Backbone.Model.extend { }
app.PhoneView = Backbone.View.extend {
  tagName: 'li'
  render: ->
    @$el.html $('#phone-view').html()
    @renderReflow()
  renderReflow: ->
    $('.phone-name', @$el).text @model.get 'name'
    @
}
