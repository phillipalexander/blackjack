#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'chipStack', 2000
    # debugger;
    @newGame()

  newGame: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'playerHit', =>
      if @get('playerHand').scores()[0] > 21
        @endGame()
    @get('playerHand').on 'playerStand', =>
      @endGame()

  endGame: ->
    @get('dealerHand').hit() while @get('dealerHand').scores()[0] < 16
    playerScore = @get('playerHand').scores()[0]
    dealerScore = @get('dealerHand').scores()[0]
    if playerScore > 21
      alert "You busted mother fucker. Don't test me bro."
    else if dealerScore > 21 or playerScore > dealerScore
      alert "You Win!"
    else
      alert "You lose!"
    @newGame()