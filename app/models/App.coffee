#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'stack', new Stack()
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
    @currentStack = @get('stack').get('chipStack')
    @currentBet = @get('stack').get('curBet')
    if dealerScore > 21 and playerScore < 22
      @youWin()
    else if playerScore > 21
      @youLose()
    else if playerScore > dealerScore
      @youWin()
    else
      @youLose()
    @newGame()

  youLose: ->
    @get('stack').set('chipStack', @currentStack - @currentBet)
    @get('stack').set('curBet', 0)
    alert "You lose!"

  youWin: ->
    @get('stack').set('chipStack', @currentStack + @currentBet)
    @get('stack').set('curBet', 0)
    alert "You Win!"