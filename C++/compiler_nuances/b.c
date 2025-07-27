#include <stdio.h>
int main() {
    #ifdef __linux__ 
        printf("Hello from Linux\n");
    #elif _WIN32
        printf("Hello from Windows\n");
    #else 
        std::cout << "Unknown System\n";
    #endif
    return 0;
}