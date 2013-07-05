#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'playerStand', =>
      console.log(arguments)
      console.log(@)
      playerScore = @get('playerHand').scores()[0]
      dealerScore = @get('dealerHand').scores()[0]
      if playerScore > 21
        alert "You busted mother fucker. Don't test me bro."
      else if playerScore > dealerScore
        alert "You Win!"
      else
        alert "You lose!"

  # @get 'playerHand'
  # get player score
  # get dealer score
  # compare scores, winner is closer to 21 without going over
  # start new round