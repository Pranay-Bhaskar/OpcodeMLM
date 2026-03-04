#include <stdio.h>
#include <math.h>
#include <windows.h> // For Beep on Windows

typedef struct {
    int frequency;
    int duration;
} Note;

Note melody[] = {
    {440, 500}, // A4
    {494, 500}, // B4
    {523, 500}, // C5
    {587, 500}, // D5
    {659, 500}, // E5
};

int main() {
    printf("Playing simple melody...\n");
    for (int i = 0; i < sizeof(melody)/sizeof(melody[0]); i++) {
        Beep(melody[i].frequency, melody[i].duration);
    }
    return 0;
}