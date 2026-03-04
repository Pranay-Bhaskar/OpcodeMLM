#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define DECK_SIZE 52
#define PLAYERS 4
#define HAND_SIZE 5

char *suits[] = {"Hearts", "Diamonds", "Clubs", "Spades"};
char *ranks[] = {"2","3","4","5","6","7","8","9","10","J","Q","K","A"};

typedef struct {
    char *rank;
    char *suit;
} Card;

Card deck[DECK_SIZE];
Card hands[PLAYERS][HAND_SIZE];

void initDeck() {
    int k = 0;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 13; j++) {
            deck[k].rank = ranks[j];
            deck[k].suit = suits[i];
            k++;
        }
    }
}

void shuffleDeck() {
    for (int i = 0; i < DECK_SIZE; i++) {
        int r = rand() % DECK_SIZE;
        Card temp = deck[i];
        deck[i] = deck[r];
        deck[r] = temp;
    }
}

void dealCards() {
    int index = 0;
    for (int p = 0; p < PLAYERS; p++) {
        for (int h = 0; h < HAND_SIZE; h++) {
            hands[p][h] = deck[index++];
        }
    }
}

void showHands() {
    for (int p = 0; p < PLAYERS; p++) {
        printf("Player %d hand:\n", p+1);
        for (int h = 0; h < HAND_SIZE; h++) {
            printf("%s of %s\n", hands[p][h].rank, hands[p][h].suit);
        }
        printf("\n");
    }
}

int main() {
    srand(time(NULL));
    initDeck();
    shuffleDeck();
    dealCards();
    showHands();
    return 0;
}