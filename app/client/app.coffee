$ ->
  ListView = Backbone.View.extend {
    el: $ 'body'
    events:
      'click button#add': 'addItem'
    initialize: ->
      @counter = 0
      @render()
    render: ->
      $(@el).append '<button id="add">Add list item</button>'
      $(@el).append '<ul></ul>'
    addItem: ->
      @counter++
      $('ul', @el).append "<li>Hello, world (#{@counter})</li>"
  }
  listView = new ListView()
