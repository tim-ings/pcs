#include <stdio.h>
#include <stdlib.h>
#include <iostream>

#define PHONE_COUNT 3
#define A 0
#define B 0
#define C 0
#define PERM_COUNT 6

using namespace std;

int main(int argc, char** argv) {
    int perms[PERM_COUNT][3] = {
        {0, 1, 2},
        {0, 2, 1},
        {1, 0, 2},
        {1, 2, 0},
        {2, 1, 0},
        {2, 0, 1}
    };

    int case_count;
    cin >> case_count;

    while (case_count > 0) {
        int a, b, c;
        int mat[PHONE_COUNT * PHONE_COUNT];
        for (int i = 0; i < PHONE_COUNT; i++) {
            cin >> a >> b >> c;
            mat[i * PHONE_COUNT + A] = a;
            mat[i * PHONE_COUNT + B] = b;
            mat[i * PHONE_COUNT + C] = c;
        }

        int best_cost = 999999;
        for (int i = 0; i < PERM_COUNT; i++) {
            int pos_a = perms[i][A];
            int pos_b = perms[i][B];
            int pos_c = perms[i][C];
            int cost_a = mat[A * PHONE_COUNT + pos_a];
            int cost_b = mat[B * PHONE_COUNT + pos_b];
            int cost_c = mat[C * PHONE_COUNT + pos_c];

            int max_perm_cost = 99999;
            if (cost_a < max_perm_cost) {
                max_perm_cost = cost_a;
            }
            if (cost_b < max_perm_cost) {
                max_perm_cost = cost_b;
            }
            if (cost_c < max_perm_cost) {
                max_perm_cost = cost_c;
            }
            
        }


        case_count--;
    }
}
