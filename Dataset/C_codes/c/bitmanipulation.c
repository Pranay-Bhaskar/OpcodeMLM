#include <stdio.h>

int setBit(int num, int pos) { return num | (1 << pos); }
int clearBit(int num, int pos) { return num & ~(1 << pos); }
int toggleBit(int num, int pos) { return num ^ (1 << pos); }
int checkBit(int num, int pos) { return (num >> pos) & 1; }