/* -*- mode: c++ -*- */

#pragma once
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <map>
#include <unordered_map>
#include <chrono>

typedef std::chrono::high_resolution_clock::time_point Time;

typedef std::unordered_map<std::string, std::string> Result;

template <typename T>
std::ostream &operator<<(std::ostream &o, const std::vector<T>& v){
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


template <typename T, typename T2>
std::ostream &operator<<(std::ostream &o, const std::pair<T,T2>& e){
    o << "(" << e.first << " . " << e.second << ")" ;;
}


template <typename T, typename T2>
std::ostream &operator<<(std::ostream &o, const std::map<T,T2>& v){
    bool first = true;
    o << "(";
    for (auto e : v){
        if (first){
            first = false;
        }else{
            o << " ";
        }
        o << e ;;
    }
    o << ")" ;
}

template <typename T, typename T2>
std::ostream &operator<<(std::ostream &o, const std::unordered_map<T,T2>& v){
    bool first = true;
    o << "(";
    for (auto e : v){
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

// std::map <string,string> measure(vector<long int> input);
std::vector<Result> main2(std::vector<long int> input);

double process_mem_usage();
