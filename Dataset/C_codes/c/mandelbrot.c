#include <stdio.h>

int main() {
    int width = 80, height = 24, max_iter = 1000;
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            double cx = (x - width/2.0) * 4.0/width;
            double cy = (y - height/2.0) * 2.0/height;
            double zx = 0, zy = 0;
            int iter = 0;
            while (zx*zx + zy*zy < 4 && iter < max_iter) {
                double tmp = zx*zx - zy*zy + cx;
                zy = 2*zx*zy + cy;
                zx = tmp;
                iter++;
            }
            putchar(iter == max_iter ? '#' : ' ');
        }
        putchar('\n');
    }
    return 0;
}