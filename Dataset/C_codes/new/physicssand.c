#include <stdio.h>
#include <stdlib.h>

typedef struct {
    float x, y, vx, vy;
} Particle;

#define N 5

Particle particles[N];

void initParticles() {
    for (int i = 0; i < N; i++) {
        particles[i].x = i * 2;
        particles[i].y = i * 2;
        particles[i].vx = 0.5 * (i+1);
        particles[i].vy = 0.3 * (i+1);
    }
}

void updateParticles() {
    for (int i = 0; i < N; i++) {
        particles[i].x += particles[i].vx;
        particles[i].y += particles[i].vy;
    }
}

void showParticles() {
    for (int i = 0; i < N; i++) {
        printf("Particle %d: (%.2f, %.2f)\n", i, particles[i].x, particles[i].y);
    }
}

int main() {
    initParticles();
    for (int step = 0; step < 5; step++) {
        printf("Step %d:\n", step);
        showParticles();
        updateParticles();
    }
    return 0;
}