from enum import Enum, unique
from random import shuffle


class Game:
    winnerOfHand = False
    player1PlayedCards = []
    player2PlayedCards = []

    def __init__(self):
        # create deck
        deck = Deck()
        shuffle(deck.cards)

        # get hands
        middle_index = len(deck.cards) // 2
        hand1 = Hand(deck.cards[:middle_index])
        hand2 = Hand(deck.cards[middle_index:])

        # deal cards
        self.player1 = Player("Joel", hand1)
        self.player2 = Player("Mal", hand2)

    def startGame(self):
        while self.player1.hand.cards and self.player2.hand.cards:
            print(f"\n\nPlayer {self.player1.name}: {len(self.player1.hand.cards)} cards; Player {self.player2.name}: {len(self.player2.hand.cards)} cards")
            self.clearPlayingTable()
            self.playHand()

        print(f"\n****** Player {self.player2.name} wins! ******") if not self.player1.hand.cards else  print(
            f"\n****** Player {self.player1.name} wins! ******")

    def playHand(self):
        print("Start new hand")

        self.player1PlayedCards.append(self.player1.hand.cards[0])
        self.player1.hand.remove([self.player1.hand.cards[0]])

        self.player2PlayedCards.append(self.player2.hand.cards[0])
        self.player2.hand.remove([self.player2.hand.cards[0]])

        self.evaluatePlay()

    def playWar(self):
        print("WARRRRRRRRR")
        minimum = min([4, len(self.player1.hand.cards), len(self.player2.hand.cards)])

        self.player1PlayedCards.extend(self.player1.hand.cards[:minimum])
        self.player1.hand.remove(self.player1.hand.cards[:minimum])

        self.player2PlayedCards.extend(self.player2.hand.cards[:minimum])
        self.player2.hand.remove(self.player2.hand.cards[:minimum])

        self.evaluatePlay()

    def evaluatePlay(self):
        # player 1 wins
        if self.player1PlayedCards[-1].value.value > self.player2PlayedCards[-1].value.value:
            print(f"\tPlayer {self.player1.name} wins hand with {self.player1PlayedCards[-1].value.value} of {self.player1PlayedCards[-1].suit.value}")
            print(f"\tPlayer {self.player2.name} loses hand with {self.player2PlayedCards[-1].value.value} of {self.player2PlayedCards[-1].suit.value}")
            print(f"\t\tPlayer {self.player1.name} gains {len(self.player2PlayedCards)} from player {self.player2.name}")
            self.player1.hand.add(self.player1PlayedCards)
            self.player1.hand.add(self.player2PlayedCards)
            self.winnerOfHand = True
        # player 2 wins
        elif self.player2PlayedCards[-1].value.value > self.player1PlayedCards[-1].value.value:
            print(f"\tPlayer {self.player2.name} wins hand with {self.player2PlayedCards[-1].value.value} of {self.player2PlayedCards[-1].suit.value}")
            print(f"\tPlayer {self.player1.name} loses hand with {self.player1PlayedCards[-1].value.value} of {self.player1PlayedCards[-1].suit.value}")
            print(f"\t\tPlayer {self.player2.name} gains {len(self.player1PlayedCards)} from player {self.player1.name}")
            self.player2.hand.add(self.player1PlayedCards)
            self.player2.hand.add(self.player2PlayedCards)
            self.winnerOfHand = True
        # war
        else:
            while self.winnerOfHand == False:
                self.playWar()

    def clearPlayingTable(self):
        self.winnerOfHand = False
        self.player1PlayedCards = []
        self.player2PlayedCards = []


class Player:
    def __init__(self, name, hand):
        self.name = name
        self.hand = hand


class Deck:
    cards = []

    def __init__(self):
        for suit in Suit.__members__.items():
            for value in Value.__members__.items():
                self.cards.append(Card(suit[1], value[1]))
        print(f"Deck made: {len(self.cards)} cards")


class Hand:
    def __init__(self, cards):
        self.cards = cards

    def add(self, cards):
        self.cards.extend(cards)

    def remove(self, cards):
        for card in cards:
            self.cards = list(filter(lambda x: x != card , self.cards))


class Card:
    def __init__(self, suit, value):
        self.suit = suit
        self.value = value

    def __eq__(self, other):
        if not isinstance(other, Card):
            return NotImplemented

        return self.suit == other.suit and self.value == other.value


@unique
class Suit(Enum):
    HEARTS = "Hearts"
    CLUBS = "Clubs"
    DIAMONDS = "Diamonds"
    SPADES = "Spades"


@unique
class Value(Enum):
    TWO = 2
    THREE = 3
    FOUR = 4
    FIVE = 5
    SIX = 6
    SEVEN = 7
    EIGHT = 8
    NINE = 9
    TEN = 10
    JACK = 11
    QUEEN = 12
    KING = 13
    ACE = 14


def main():
    game = Game()
    game.startGame()


if __name__ == "__main__":
    main()
