# Wprawka 5 (PR)
import random

color = {"spade":0,"club":0,"heart":0,"diamond":0}

cards = {   "ace":4,
            "king":3,
            "queen":2,
            "jack":1,
            "1":0,
            "2":0,
            "3":0,
            "4":0,
            "5":0,
            "6":0,
            "7":0,
            "8":0,
            "9":0   }


def drawing_hand(deck, number_of_cards = 13):

    p0_hand = []
    p1_hand = []
    p2_hand = []
    p3_hand = []
    hands = [p0_hand, p1_hand, p2_hand, p3_hand]

    for i in range(number_of_cards):
        p0_c = random.choice(deck)
        p0_hand.append(p0_c)
        deck.remove(p0_c)

        p1_c = random.choice(deck)
        p1_hand.append(p1_c)
        deck.remove(p1_c)

        p2_c = random.choice(deck)
        p2_hand.append(p2_c)
        deck.remove(p2_c)

        p3_c = random.choice(deck)
        p3_hand.append(p3_c)
        deck.remove(p3_c)
    return hands

def auction(hand):
    color_count = color.copy()
    points = 0
    for card in hand:
        points += cards[card[0]]
        color_count[card[1]] += 1

    for x in range(3):
        for c in color_count:
            if color_count[c] == x:
                points += 3 - x

    return points

deck = []
hands = []

for t in color:
    for c in cards:
        deck.append((c,t))

hands = drawing_hand(deck,13)
print(auction(hands[0]))

