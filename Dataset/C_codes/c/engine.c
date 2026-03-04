#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ROOMS 10
#define MAX_ITEMS 10
#define MAX_CMD   100

typedef struct {
    char name[50];
    char description[200];
    int exits[4]; // N,E,S,W
    char items[MAX_ITEMS][50];
    int item_count;
} Room;

Room rooms[MAX_ROOMS];
int current_room = 0;

void init_game() {
    strcpy(rooms[0].name, "Entrance");
    strcpy(rooms[0].description, "You are at the entrance of a dark cave.");
    rooms[0].exits[1] = 1; // east
    rooms[0].item_count = 1;
    strcpy(rooms[0].items[0], "torch");

    strcpy(rooms[1].name, "Hall");
    strcpy(rooms[1].description, "A long hall with dripping water.");
    rooms[1].exits[3] = 0; // west
    rooms[1].exits[2] = 2; // south
    rooms[1].item_count = 0;

    strcpy(rooms[2].name, "Treasure Room");
    strcpy(rooms[2].description, "A glittering room filled with gold!");
    rooms[2].exits[0] = 1; // north
    rooms[2].item_count = 2;
    strcpy(rooms[2].items[0], "gold");
    strcpy(rooms[2].items[1], "crown");
}

void look() {
    Room r = rooms[current_room];
    printf("== %s ==\n%s\n", r.name, r.description);
    if (r.item_count > 0) {
        printf("Items here: ");
        for (int i = 0; i < r.item_count; i++) {
            printf("%s ", r.items[i]);
        }
        printf("\n");
    }
    printf("Exits: ");
    if (r.exits[0] != -1) printf("N ");
    if (r.exits[1] != -1) printf("E ");
    if (r.exits[2] != -1) printf("S ");
    if (r.exits[3] != -1) printf("W ");
    printf("\n");
}

void move(char *dir) {
    int d = -1;
    if (strcmp(dir,"north")==0) d=0;
    else if (strcmp(dir,"east")==0) d=1;
    else if (strcmp(dir,"south")==0) d=2;
    else if (strcmp(dir,"west")==0) d=3;

    if (d==-1) { printf("Unknown direction.\n"); return; }
    if (rooms[current_room].exits[d] != -1) {
        current_room = rooms[current_room].exits[d];
        look();
    } else {
        printf("No exit that way.\n");
    }
}

void take(char *item) {
    Room *r = &rooms[current_room];
    for (int i=0;i<r->item_count;i++) {
        if (strcmp(r->items[i], item)==0) {
            printf("You take the %s.\n", item);
            for (int j=i;j<r->item_count-1;j++) {
                strcpy(r->items[j], r->items[j+1]);
            }
            r->item_count--;
            return;
        }
    }
    printf("No such item here.\n");
}

int main() {
    for (int i=0;i<MAX_ROOMS;i++) {
        for (int j=0;j<4;j++) rooms[i].exits[j] = -1;
        rooms[i].item_count=0;
    }
    init_game();
    look();

    char cmd[MAX_CMD];
    while (1) {
        printf("> ");
        if (!fgets(cmd, MAX_CMD, stdin)) break;
        cmd[strcspn(cmd,"\n")] = 0;

        if (strcmp(cmd,"quit")==0) break;
        else if (strcmp(cmd,"look")==0) look();
        else if (strncmp(cmd,"go ",3)==0) move(cmd+3);
        else if (strncmp(cmd,"take ",5)==0) take(cmd+5);
        else printf("Unknown command.\n");
    }
    printf("Game over.\n");
    return 0;
}