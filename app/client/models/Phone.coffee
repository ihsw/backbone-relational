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
    $(@el).html "<span style='color: black; '>#{@model.get('part1')}
      #{@model.get('part2')}</span> &nbsp;&nbsp;
      <span class='swap' style='font-family:sans-serif; color:blue;
      cursor:pointer;'>[swap]</span>
      <span class='delete' style='cursor:pointer; color:red;
      font-family:sans-serif;'>[delete]</span>"
    @
  unrender: -> $(@el).remove()
  swap: ->
    swapped =
      part1: @model.get 'part2'
      part2: @model.get 'part1'
    @model.set swapped
  remove: -> @model.destroy()
}
