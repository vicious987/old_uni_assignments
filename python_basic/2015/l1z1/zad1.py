from random import randint
import sys

print sys.argv

def rolldice() :
    return randint(1,6)

players = {'A' : [turn_score_a,total_score_a], 'B' :[turn_score_b,total_score_b]}

while turn < n :
    for player in players:
        players[player][0] = rolldice()
        players[player][0] += rolldice()
        print ("Player " + player + " rolled " + players[player][0] + ".\n")

    if players[A][0] == players[B][0]
        print ("its a tie, no one gets a point!\n")
    elif players[A][0] < players[B][0]
        print (" player B won this time !\n")
        players[B][1] += 1
    else
        print (" player A won this time !\n")
        players[A][1] += 1
    
    for player in players:
        print ("Player " + player + " won " + players[player][1] + " times.\n")

        
