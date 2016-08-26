
#include "common.h"

using namespace std;
using namespace std::chrono;

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


Result measure (function<void()>) {
        Result result;
        Time t1 = high_resolution_clock::now();
        double rss1 = process_mem_usage();
        
        double rss2 = process_mem_usage();
        Time t2 = high_resolution_clock::now();
        result[":time"] = to_string(
            (float)(duration_cast<microseconds>( t2 - t1 ).count()) / 1000000);
        result[":space"] = to_string(rss2 - rss1);
        return result;
}
