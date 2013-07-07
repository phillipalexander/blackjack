class window.AppView extends Backbone.View

  template: _.template '
    <section class="padding bck theme features">
      <div class="row text center book">
        <div class="column_10 offset_1">
          <h1 class="color default">Cards go here</h1>
          <div class="dealer-hand-container"><span class="playingCards"><ul class="table"></ul></span></div>
          <div class="player-hand-container"><span class="playingCards"><ul class="table"></ul></span></div>
        </div>
      </div>
    </section>

    <section class="padding bck dark">
      <div class="row text center book margin-bottom">
        <div class="column_10 offset_1">
          <h1 class="color theme">Buttons go down here</h1>
          <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
          <div class="chip-container"></div>
        </div>
      </div>
    </section>
    '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()

  initialize: ->
    @model.on 'change', @render, @
    @render()

  render: ->
    @$el.children().detach()
    @$el.append @template()
    @$('.player-hand-container span ul').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container span ul').html new HandView(collection: @model.get 'dealerHand').el
    @$('.chip-container').html new ChipView(model: @model.get 'stack').el


