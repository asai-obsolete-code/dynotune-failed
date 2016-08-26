/* -*- mode: c++ -*- */


#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <unordered_map>

template <typename T>
std::ostream& std::operator<<(std::ostream &o, std::vector<T>& v){
    bool first = true;
    o << "#(";
    for (T e : v){
        if (first){
            first = false;
        }else{
            o << " ";
        }
        o << e ;;
    }
    o << ")" ;
}

/* for measuring the performance */

// std::unordered_map <string,string> measure(vector<long int> input);
void main2(std::vector<long int> input);

int main (int argc, char* argv[]) {
    std::ifstream f(argv[1]);

    long int x;
    std::vector<long int> v;
    while (f >> x) {
        v.push_back(x);
    }
    main2(v);
    return 0;
}

