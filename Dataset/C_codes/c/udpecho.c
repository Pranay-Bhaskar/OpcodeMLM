#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <winsock2.h>
#include <ws2tcpip.h>

#define PORT 8080
#define BUF_SIZE 1024

int main() {
    WSADATA wsa;
    SOCKET sockfd;
    char buffer[BUF_SIZE];
    struct sockaddr_in servaddr, cliaddr;
    int len, n;

    // Initialize Winsock
    if (WSAStartup(MAKEWORD(2,2), &wsa) != 0) {
        printf("WSAStartup failed. Error: %d\n", WSAGetLastError());
        return 1;
    }

    // Create socket
    if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) == INVALID_SOCKET) {
        printf("Socket creation failed. Error: %d\n", WSAGetLastError());
        WSACleanup();
        return 1;
    }

    memset(&servaddr, 0, sizeof(servaddr));
    memset(&cliaddr, 0, sizeof(cliaddr));

    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = INADDR_ANY;
    servaddr.sin_port = htons(PORT);

    // Bind socket
    if (bind(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)) == SOCKET_ERROR) {
        printf("Bind failed. Error: %d\n", WSAGetLastError());
        closesocket(sockfd);
        WSACleanup();
        return 1;
    }

    printf("UDP Echo Server running on port %d...\n", PORT);

    while (1) {
        len = sizeof(cliaddr);
        n = recvfrom(sockfd, buffer, BUF_SIZE, 0, (struct sockaddr *)&cliaddr, &len);
        if (n == SOCKET_ERROR) {
            printf("recvfrom failed. Error: %d\n", WSAGetLastError());
            break;
        }
        buffer[n] = '\0';
        printf("Client: %s\n", buffer);

        if (sendto(sockfd, buffer, n, 0, (struct sockaddr *)&cliaddr, len) == SOCKET_ERROR) {
            printf("sendto failed. Error: %d\n", WSAGetLastError());
            break;
        }
    }

    closesocket(sockfd);
    WSACleanup();
    return 0;
}