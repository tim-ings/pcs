#include <stdio.h>
#include <stdlib.h>
#include <iostream>

int main(int argc, char** argv) {
    int count;
    std::cin >> count;

    int a, b;

    for (int i = 0; i < count; i++) {
        std::cin >> a >> b;
        std::cout << a + b << std::endl;
    }
}
