#include <stdio.h>
#include <math.h>

#define WIDTH 80
#define HEIGHT 40

int main() {
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            double nx = (x - WIDTH/2.0) / (WIDTH/2.0);
            double ny = (y - HEIGHT/2.0) / (HEIGHT/2.0);
            double r = sqrt(nx*nx + ny*ny);
            if (r < 0.7) {
                double shade = 1.0 - r/0.7;
                char pixel = shade > 0.8 ? '@' :
                             shade > 0.6 ? '#' :
                             shade > 0.4 ? '*' :
                             shade > 0.2 ? ':' : '.';
                printf("%c", pixel);
            } else {
                printf(" ");
            }
        }
        printf("\n");
    }
    return 0;
}