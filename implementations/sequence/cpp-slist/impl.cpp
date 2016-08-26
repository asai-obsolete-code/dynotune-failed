

#include "../../common.h"

#include <forward_list>

using namespace std;
using namespace std::chrono;

vector<Result> main2 (vector<long int> input) {

    forward_list<long int> sequence;

    vector<Result> results;

    {
        Result result;

        Time t1 = high_resolution_clock::now();
        for (auto i : input){
            sequence.push_front(i);
        }
        Time t2 = high_resolution_clock::now();

        result[":time"] = to_string(
            (float)(duration_cast<microseconds>( t2 - t1 ).count()) / 1000000);
        results.push_back(result);
    }
    
    {
        Result result;

        Time t1 = high_resolution_clock::now();
        for (auto i : input){
            sequence.pop_front();
        }
        Time t2 = high_resolution_clock::now();

        result[":time"] = to_string(
            (float)(duration_cast<microseconds>( t2 - t1 ).count()) / 1000000);
        results.push_back(result);
    }
    return results;
}

