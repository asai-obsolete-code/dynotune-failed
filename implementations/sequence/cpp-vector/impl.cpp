

#include "../../common.h"

#include <vector>

using namespace std;
using namespace std::chrono;

vector<Result> main2 (vector<long int> input) {

    vector<long int> sequence;

    vector<Result> results;

    results.push_back(
        measure ([&](){
                for (auto i : input){
                    sequence.push_back(i);
                }}));

    results.push_back(
        measure ([&](){
                for (auto i : input){
                    sequence.pop_back();
                }}));
    return results;
}

