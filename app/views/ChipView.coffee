class window.ChipView extends Backbone.View

  className: 'chips'

  #todo: switch to mustache
  template: _.template '<button class="bet-1">Bet 1</button>
    <button class="bet-5">Bet 5</button>
    <button class="bet-10">Bet 10</button>
    <button class="bet-25">Bet 25</button>
    <button class="bet-50">Bet 50</button>
    <button class="bet-100">Bet 100</button>
    <button class="clear">Clear Bet</button>
    </br>
    <div class="stack">Stack: </div>
    </br>
    <div class="bet">Bet: </div>'

  events:
    # "click .hit-button": -> @model.get('playerHand').hit()
    # "click .stand-button": -> @model.get('playerHand').stand()
    "click .bet-1": ->
      @currentBet += 1
      @trigger 'bet'
    "click .bet-5": ->
      @currentBet += 5
      @trigger 'bet'
    "click .bet-10": ->
      @currentBet += 10
      @trigger 'bet'
    "click .bet-25": ->
      @currentBet += 25
      @trigger 'bet'
    "click .bet-50": ->
      @currentBet += 50
      @trigger 'bet'
    "click .bet-100": ->
      @currentBet += 100
      @trigger 'bet'
    "click .clear": ->
      @currentBet = 0
      @trigger 'bet'

  initialize: ->
    @currentStack = @model.get('chipStack')
    @currentBet = 0
    @on 'bet', =>
      # debugger
      # console.log(@currentBet)
      # @modBet = @model.get('curBet')
      @model.set('curBet', @currentBet)
      @render()
    # @model.on 'add remove change', =>
    #   @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template
    @$('.stack').append @model.get('chipStack')
    @$('.bet').append @currentBet
    # @$el.append @collection.map (card) ->
    #   new CardView(model: card).$el
    # @$el.html @template @model get('chipStack')
