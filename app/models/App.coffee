#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @newHand()

  newHand: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'playerStand', =>
      # find dealer score
      @get('dealerHand').hit() while @get('dealerHand').scores()[0] < 16
        # if less than 16, hit
          # repeat until dealerScore > 16
      playerScore = @get('playerHand').scores()[0]
      dealerScore = @get('dealerHand').scores()[0]
      if playerScore > 21
        alert "You busted mother fucker. Don't test me bro."
      else if playerScore > dealerScore
        alert "You Win!"
      else
        alert "You lose!"
      @newHand()

