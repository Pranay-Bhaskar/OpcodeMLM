#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <winsock2.h>

#pragma comment(lib, "ws2_32.lib")

#define PORT 8080
#define MAX_CLIENTS 10
#define BUF_SIZE 1024

typedef struct {
    SOCKET sockfd;
    char name[50];
} Client;

Client clients[MAX_CLIENTS];
int client_count = 0;
HANDLE lock; // Windows mutex

// Broadcast message to all clients
void broadcast(const char *msg, SOCKET sender_sock) {
    WaitForSingleObject(lock, INFINITE);
    for (int i = 0; i < client_count; i++) {
        if (clients[i].sockfd != sender_sock) {
            send(clients[i].sockfd, msg, strlen(msg), 0);
        }
    }
    ReleaseMutex(lock);
}

// Handle client connection
DWORD WINAPI handle_client(LPVOID arg) {
    SOCKET sock = *(SOCKET*)arg;
    char buffer[BUF_SIZE];
    char name[50];

    int n = recv(sock, name, sizeof(name) - 1, 0);
    if (n <= 0) {
        closesocket(sock);
        return 0;
    }
    name[n] = '\0';

    WaitForSingleObject(lock, INFINITE);
    if (client_count < MAX_CLIENTS) {
        clients[client_count].sockfd = sock;
        strncpy(clients[client_count].name, name, sizeof(clients[client_count].name) - 1);
        client_count++;
    }
    ReleaseMutex(lock);

    sprintf(buffer, "%s joined the chat.\n", name);
    broadcast(buffer, sock);

    while (1) {
        n = recv(sock, buffer, BUF_SIZE - 1, 0);
        if (n <= 0) {
            sprintf(buffer, "%s left the chat.\n", name);
            broadcast(buffer, sock);

            WaitForSingleObject(lock, INFINITE);
            for (int i = 0; i < client_count; i++) {
                if (clients[i].sockfd == sock) {
                    for (int j = i; j < client_count - 1; j++) {
                        clients[j] = clients[j + 1];
                    }
                    client_count--;
                    break;
                }
            }
            ReleaseMutex(lock);

            closesocket(sock);
            break;
        }
        buffer[n] = '\0';
        char msg[BUF_SIZE + 50];
        snprintf(msg, sizeof(msg), "%s: %s", name, buffer);
        broadcast(msg, sock);
    }
    return 0;
}

int main() {
    WSADATA wsa;
    SOCKET server_fd, new_sock;
    struct sockaddr_in address;
    int addrlen = sizeof(address);

    if (WSAStartup(MAKEWORD(2,2), &wsa) != 0) {
        printf("Failed to initialize Winsock: %d\n", WSAGetLastError());
        return 1;
    }

    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == INVALID_SOCKET) {
        printf("Socket failed: %d\n", WSAGetLastError());
        WSACleanup();
        return 1;
    }

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) == SOCKET_ERROR) {
        printf("Bind failed: %d\n", WSAGetLastError());
        closesocket(server_fd);
        WSACleanup();
        return 1;
    }

    if (listen(server_fd, 3) == SOCKET_ERROR) {
        printf("Listen failed: %d\n", WSAGetLastError());
        closesocket(server_fd);
        WSACleanup();
        return 1;
    }

    printf("Chat server running on port %d...\n", PORT);

    lock = CreateMutex(NULL, FALSE, NULL);

    while (1) {
        new_sock = accept(server_fd, (struct sockaddr *)&address, &addrlen);
        if (new_sock == INVALID_SOCKET) {
            printf("Accept failed: %d\n", WSAGetLastError());
            continue;
        }
        HANDLE hThread = CreateThread(NULL, 0, handle_client, &new_sock, 0, NULL);
        if (hThread == NULL) {
            printf("Could not create thread.\n");
            closesocket(new_sock);
        } else {
            CloseHandle(hThread); // detach
        }
    }

    closesocket(server_fd);
    WSACleanup();
    return 0;
}