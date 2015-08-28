$ ->
  ListView = Backbone.View.extend {
    el: $ 'body'
    initialize: -> @render()
    render: -> $(@el).append '<h1>Hello, world!</h1>'
  }
  listView = new ListView()
