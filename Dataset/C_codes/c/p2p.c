#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>
#include <winsock2.h>

#pragma comment(lib, "ws2_32.lib")

#define PORT 9090
#define BUF_SIZE 1024

DWORD WINAPI server_thread(LPVOID arg) {
    SOCKET server_sock, client_sock;
    struct sockaddr_in server, client;
    int c;
    char buffer[BUF_SIZE];

    // Create socket
    server_sock = socket(AF_INET, SOCK_STREAM, 0);
    if (server_sock == INVALID_SOCKET) {
        printf("Could not create socket: %d\n", WSAGetLastError());
        return 1;
    }

    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons(PORT);

    // Bind
    if (bind(server_sock, (struct sockaddr*)&server, sizeof(server)) == SOCKET_ERROR) {
        printf("Bind failed: %d\n", WSAGetLastError());
        closesocket(server_sock);
        return 1;
    }

    // Listen
    listen(server_sock, 5);
    printf("Server listening on port %d...\n", PORT);

    c = sizeof(struct sockaddr_in);
    while (1) {
        client_sock = accept(server_sock, (struct sockaddr*)&client, &c);
        if (client_sock == INVALID_SOCKET) {
            printf("Accept failed: %d\n", WSAGetLastError());
            continue;
        }

        int n = recv(client_sock, buffer, BUF_SIZE - 1, 0);
        if (n > 0) {
            buffer[n] = '\0';
            printf("Received file chunk: %s\n", buffer);
        }
        closesocket(client_sock);
    }

    closesocket(server_sock);
    return 0;
}

void client_send(const char* msg) {
    SOCKET sock;
    struct sockaddr_in server;

    sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == INVALID_SOCKET) {
        printf("Client socket creation failed: %d\n", WSAGetLastError());
        return;
    }

    server.sin_family = AF_INET;
    server.sin_port = htons(PORT);
    server.sin_addr.s_addr = inet_addr("127.0.0.1");

    if (connect(sock, (struct sockaddr*)&server, sizeof(server)) < 0) {
        printf("Connection failed: %d\n", WSAGetLastError());
        closesocket(sock);
        return;
    }

    send(sock, msg, strlen(msg), 0);
    closesocket(sock);
}

int main() {
    WSADATA wsa;
    HANDLE hThread;
    DWORD threadId;

    // Initialize Winsock
    if (WSAStartup(MAKEWORD(2,2), &wsa) != 0) {
        printf("Failed to initialize Winsock: %d\n", WSAGetLastError());
        return 1;
    }

    // Start server thread
    hThread = CreateThread(NULL, 0, server_thread, NULL, 0, &threadId);
    if (hThread == NULL) {
        printf("Could not create server thread.\n");
        WSACleanup();
        return 1;
    }

    Sleep(1000); // give server time to start

    char chunk[BUF_SIZE];
    for (int i = 0; i < 5; i++) {
        sprintf(chunk, "Chunk %d data... with extra payload", i + 1);
        client_send(chunk);
        Sleep(1000);
    }

    // Wait for server thread (infinite loop, so demo ends here)
    WaitForSingleObject(hThread, INFINITE);

    WSACleanup();
    return 0;
}