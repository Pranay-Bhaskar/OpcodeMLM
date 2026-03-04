#include <windows.h>
#include <stdio.h>

int main() {
    int notes[] = {440, 494, 523, 587, 659, 698, 784}; // A scale
    int duration = 300; // ms

    for (int i=0; i<7; i++) {
        Beep(notes[i], duration);
    }
    return 0;
}