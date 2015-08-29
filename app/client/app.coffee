$ ->
  Item = Backbone.Model.extend {
    defaults:
      part1: 'hello'
      part2: 'world'
  }
  List = Backbone.Collection.extend { model: Item }
  ListView = Backbone.View.extend {
    el: $ 'body'
    events:
      'click button#add': 'addItem'
    initialize: ->
      @collection = new List()
      @collection.bind 'add', @appendItem
      @counter = 0
      @render()
    render: ->
      $(@el).append '<button id="add">Add list item</button>'
      $(@el).append '<ul></ul>'
      @appendItem item for item in @collection.models
    addItem: ->
      @counter++
      item = new Item()
      item.set {
        part2: item.get('part2') + @counter
      }
      @collection.add item
    appendItem: (item) ->
      $('ul', @el).append "<li>#{item.get('part1')} #{item.get('part2')}</li>"
  }
  listView = new ListView()
