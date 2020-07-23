class Game {
    let player1: Player
    let player2: Player

    var winnerOfHand = false
    var player1PlayedCards = [Card]()
    var player2PlayedCards = [Card]()

    init() {
        // shuffle cards
        var deck = Deck()
        deck.cards.shuffle()

        // get hands
        let hand1 = Hand(cards: Array(deck.cards[0..<deck.cards.count / 2]))
        let hand2 = Hand(cards: Array(deck.cards[deck.cards.count / 2 ..< deck.cards.count]))

        // deal cards
        self.player1 = Player(name: "Joel", hand: hand1)
        self.player2 = Player(name: "Mal", hand: hand2)
    }

    func startGame() {
        while !player1.hand.cards.isEmpty && !player2.hand.cards.isEmpty {
            print("\n\nPlayer \(player1.name): \(player1.hand.cards.count) cards; Player \(player2.name): \(player2.hand.cards.count) cards")
            clearPlayingTable()
            playHand()
        }
        (player1.hand.cards.isEmpty) ? print("\n****** Player \(player2.name) wins! ******") : print("\n****** Player \(player1.name) wins! ******")
    }

    func playHand() {
        print("Start new hand")

        player1PlayedCards.append(player1.hand.cards.first!)
        player1.hand.remove(cards: [player1.hand.cards.first!])

        player2PlayedCards.append(player2.hand.cards.first!)
        player2.hand.remove(cards: [player2.hand.cards.first!])

        evaluatePlay()
    }

    func playWar() {
        print("WARRRRRRR")
        let min = [4, player1.hand.cards.count, player2.hand.cards.count].min()

        player1PlayedCards.append(contentsOf: player1.hand.cards.prefix(min!))
        player1.hand.remove(cards: Array(player1.hand.cards.prefix(min!)))

        player2PlayedCards.append(contentsOf: player2.hand.cards.prefix(min!))
        player2.hand.remove(cards: Array(player2.hand.cards.prefix(min!)))

        evaluatePlay()
    }

    func evaluatePlay() {
        // player 1 wins
        if (player1PlayedCards.last!.value.rawValue > player2PlayedCards.last!.value.rawValue) {
            print("\tPlayer \(player1.name) wins hand with \(player1PlayedCards.last!.value) of \(player1PlayedCards.last!.suit)")
            print("\tPlayer \(player2.name) loses hand with \(player2PlayedCards.last!.value) of \(player2PlayedCards.last!.suit)")
            print("\t\tPlayer \(player1.name) gains \(player2PlayedCards.count) from player \(player2.name)")
            player1.hand.add(cards: player1PlayedCards)
            player1.hand.add(cards: player2PlayedCards)
            winnerOfHand = true
        //player 2 wins
        } else if (player2PlayedCards.last!.value.rawValue > player1PlayedCards.last!.value.rawValue)  {
            print("\tPlayer \(player2.name) wins hand with \(player2PlayedCards.last!.value) of \(player2PlayedCards.last!.suit)")
            print("\tPlayer \(player1.name) loses hand with \(player1PlayedCards.last!.value) of \(player1PlayedCards.last!.suit)")
            print("\t\tPlayer \(player2.name) gains \(player1PlayedCards.count) from player \(player1.name)")
            player2.hand.add(cards: player2PlayedCards)
            player2.hand.add(cards: player1PlayedCards)
            winnerOfHand = true
        // war
        } else {
            while winnerOfHand == false {
                playWar()
            }
        }
    }

    func clearPlayingTable() {
        winnerOfHand = false
        player1PlayedCards = []
        player2PlayedCards = []
    }
}

struct Player {
    let name: String
    let hand: Hand
}

struct Deck {
    var cards = [Card]()

    init() {
        for suit in [Suit.Hearts, Suit.Clubs, Suit.Diamonds, Suit.Spades] {
            for value in (Value.Two.rawValue...Value.Ace.rawValue) {
                cards.append(Card(suit: suit, value: Value.init(rawValue: value)!))
            }
        }
        print("Deck made: \(cards.count) cards")
    }
}

class Hand {
    var cards: [Card]

    init(cards: [Card]) {
        self.cards = cards
        print("Hand made: \(cards.count) cards")
    }

    func add(cards: [Card]) {
        self.cards.append(contentsOf: cards)
    }

    func remove(cards: [Card]) {
        for card in cards {
            self.cards = self.cards.filter { $0 != card}
        }
    }
}

struct Card: Equatable {
    let suit: Suit
    let value: Value

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.suit == rhs.suit && lhs.value == rhs.value
    }
}

enum Value: Int {
    case Two = 2
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Ten
    case Jack
    case Queen
    case King
    case Ace
}

enum Suit {
    case Hearts
    case Clubs
    case Diamonds
    case Spades
}

let game = Game()
game.startGame()
