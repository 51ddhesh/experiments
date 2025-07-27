#include <iostream>
int main() {
    #ifdef _WIN32
        std::cout << "Hello from Windows\n";
    #elif __linux__
        std::cout << "Hello from Linux\n";
    #else 
        std::cout << "Unknown System\n";
    #endif
    return 0;
}