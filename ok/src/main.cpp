#include <stdio.h>
#include <stdlib.h>
#include <iostream>

int main(int argc, char** argv) {
    int count;
    std::cin >> count;

    std::string word;

    for (int i = 0; i < count; i++) {
        std::cin >> word;
        bool foundO = false;
        bool foundK = false;
        for (int j = 0; j < word.length(); j++) {
            if (foundO && word[j] == 'K') {
                std::cout << "YES" << std::endl;
                foundK = true;
                break;
            }
            if (word[j] == 'O') {
                foundO = true;
            }
        }
        if (!foundO || !foundK) {
            std::cout << "NO" << std::endl;
        }
    }
}
