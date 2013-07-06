class window.ChipView extends Backbone.View

  className: 'chips'

  #todo: switch to mustache
  template: _.template '<h2><%= chipStack %></h2>'

  initialize: ->
    # @model.on 'add remove change', =>
    #   @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model
    # @$el.append @collection.map (card) ->
    #   new CardView(model: card).$el
    # @$('.score').append @model get('chipStack')
    # @$('.score').append @collection.scores()[1]
