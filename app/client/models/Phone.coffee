app = window.app
app.Phone = Backbone.Model.extend { }
app.PhoneView = Backbone.View.extend {
  tagName: 'li'
  render: ->
    content = $('#phone-view').html()
    $el = $ "<div>#{content}</div>"
    $('.phone-name', $el).text @model.get 'name'
    @$el.html $el.html()
    @
}
