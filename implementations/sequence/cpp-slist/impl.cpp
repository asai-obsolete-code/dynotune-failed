

#include "../../common.h"

#include <forward_list>

using namespace std;
using namespace std::chrono;

vector<Result> main2 (vector<long int> input) {

    forward_list<long int> sequence;

    vector<Result> results;

    results.push_back(
        measure ([&](){
                for (auto i : input){
                    sequence.push_front(i);}}));

    results.push_back(
        measure ([&](){
                for (auto i : input){
                    sequence.pop_front();}}));
    return results;
}

