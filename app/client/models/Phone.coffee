app = window.app
app.Phone = Backbone.Model.extend {
  defaults:
    part1: 'hello'
    part2: 'world'
}
app.PhoneView = Backbone.View.extend {
  tagName: 'li'
  events:
    'click span.swap': 'swap'
    'click span.delete': 'remove'
  initialize: ->
    _.bindAll @, 'render', 'unrender', 'swap', 'remove'
    @model.bind 'change', @render
    @model.bind 'remove', @unrender
  render: ->
    content = $('#phone-view').html()
    $el = $ "<div>#{content}</div>"
    $('.part1', $el).text @model.get 'part1'
    $('.part2', $el).text @model.get 'part2'
    @$el.html $el.html()
    @
  unrender: -> $(@el).remove()
  swap: ->
    swapped =
      part1: @model.get 'part2'
      part2: @model.get 'part1'
    @model.set swapped
  remove: -> @model.destroy()
}
