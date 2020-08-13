from sys import argv

count = int(input())

while count > 0:
    mat = []
    for i in range(3):
        line = input()
        [a, b, c] = line.split(' ')
        mat.append([
            int(a),
            int(b),
            int(c),
        ])
    
    perms = [
        [0, 1, 2],
        [0, 2, 1],
        [1, 0, 2],
        [1, 2, 0],
        [2, 1, 0],
        [2, 0, 1],
    ]

    best_cost = 99999999
    best_perm = None
    for perm in perms:
        pos_a = perm[0]
        pos_b = perm[1]
        pos_c = perm[2]
        cost_a = mat[0][pos_a]
        cost_b = mat[1][pos_b]
        cost_c = mat[2][pos_c]
        cost = max(cost_a, cost_b, cost_c)
        if cost < best_cost:
            best_cost = cost
            best_perm = perm

    print(best_cost)

    count -= 1
