
#include "common.h"

using namespace std;

int main (int argc, char* argv[]) {
    string input = argv[1];
    ifstream f(input);

    long int x;
    vector<long int> v;
    while (f >> x) {
        v.push_back(x);
    }
    for (auto e : main2(v)){
        e[":input"] = "\""+input+"\"";
        cout << e << endl;
    }
    return 0;
}

