#include <stdio.h>
#include <signal.h>
#include <unistd.h>

void handler(int sig){ printf("Caught signal %d\n",sig); }

int main() {
    signal(SIGINT,handler);
    while(1){ printf("Running...\n"); sleep(1); }
    return 0;
}