
#include "../../common.h"

int main (int argc, char* argv[]) {
    ifstream f(argv[1]);

    long int x;
    std::vector<long int> v;
    while (f >> x) {
        v.push_back(v);
    }
    main2(v);
    return 0;
}

