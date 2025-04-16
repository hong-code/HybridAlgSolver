#include "regexp_symbolic.h"
#include "../solver.h"

#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <mpi.h>

namespace solverbin{

 

  bool RegExpSymbolic::IntersectionK::IfMatch(SimulationState* SS){
    while (SS != nullptr){
      if (SS->NS->NFlag == RegExpSymbolic::FollowAtomata::Match){
        SS = SS->Next;
        continue;
      }
      else {
        return false;
      }
    }
    return true;
  }
  bool RegExpSymbolic::IntersectionK::ComputAllState(std::vector<std::set<RegExpSymbolic::FollowAtomata::NFAState*>> NextV, int i, SimulationState* s, SimulationState* ns, std::vector<int> &IDSet){
    if (i == 0)
      for (auto it : NextV[0]){
        s->NS = it;
        IDSet.emplace_back(s->NS->Node2Continuation.first->LabelID);
        if (i == RegExN - 1)
          s->Next = nullptr;
        else  
          s->Next = (SimulationState*)malloc(sizeof(SimulationState));
        i++;
        if (ComputAllState(NextV, i, s, s->Next, IDSet))
          return true;
        else
          i--;  

      }
    else if (i == RegExN){
      // int size = s->IDSet.size();
      if (!IsInCache(s, Scache)){
        int rank, size;
        MPI_Comm_rank(MPI_COMM_WORLD, &rank);  // 当前进程编号
        MPI_Comm_size(MPI_COMM_WORLD, &size);  // 总进程数
        if (rank == 1){
          std::cout << "data: ";
          for (int num : IDSet) {
              std::cout << num << " ";
          }
          int size;
          MPI_Recv(&size, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE); // 接收数据的大小
          std::vector<int> RevIDSet(size);
          MPI_Recv(RevIDSet.data(), size, MPI_INT, 0, 1, MPI_COMM_WORLD, MPI_STATUS_IGNORE); // 接收数据
          int size1;
          MPI_Recv(&size1, 1, MPI_INT, 0, 2, MPI_COMM_WORLD, MPI_STATUS_IGNORE); // 接收数据的大小
          char* buffer = new char[size1];
          MPI_Recv(buffer, size1, MPI_CHAR, 0, 3, MPI_COMM_WORLD, MPI_STATUS_IGNORE); // 接收数据
          std::string InterStr1(buffer);
          auto P = SimulationIDSet.find(IDSet);
          if (P != SimulationIDSet.end() && P->second.first == 0) {
            // std::cout << "Meet the same data: ";
            // for (int num : IDSet) {
            //   std::cout << num << " ";
            // }
            std::cout << std::endl;
            std::string InterStr2 = P->second.second;
            std::cout << "InterStr: " << InterStr << std::endl;
            InterStr.pop_back();
            for (auto c = InterStr2.rbegin(); c != InterStr2.rend(); c++){
              InterStr.push_back(*c);
            }
            std::cout << "Process 1: sending stop signal to Process 2\n";
            int stop = 1;
            MPI_Send(&stop, 1, MPI_INT, 0, 100, MPI_COMM_WORLD);
            return true;
          }
          SimulationIDSet.insert(std::make_pair(IDSet, std::make_pair(1, InterStr)));
          auto P1 = SimulationIDSet.find(RevIDSet);
          if (P1 != SimulationIDSet.end() && P1->second.first == 1) {
            std::cout << "Meet the same data: ";
            for (int num : RevIDSet) {
              std::cout << num << " ";
            }
            std::cout << std::endl;
            std::string InterStr2 = P1->second.second;
            InterStr2.pop_back();
            std::cout << "InterStr: " << InterStr << std::endl;
            for (auto c = InterStr1.rbegin(); c != InterStr1.rend(); c++){
              InterStr2.push_back(*c);
            }
            InterStr = InterStr2;
            std::cout << "Process 1: sending stop signal to Process 2\n";
            int stop = 1;
            MPI_Send(&stop, 1, MPI_INT, 0, 100, MPI_COMM_WORLD);
            return true;
          }
          else {
            std::cout << "Process 1: sending stop signal to Process 2\n";
            int stop = 0;
            MPI_Send(&stop, 1, MPI_INT, 0, 100, MPI_COMM_WORLD);
          }
          SimulationIDSet.insert(std::make_pair(RevIDSet, std::make_pair(0, InterStr1)));
          std::cout << "Received data: ";
          for (int num : RevIDSet) {
            std::cout << num << " ";
          }
          std::cout << std::endl;
          // if (SimulationIDSet.find(RevIDSet) != SimulationIDSet.end() || RevSimulationIDSet.find(s->IDSet) != RevSimulationIDSet.end()){
          //   std::cout << "rank: " << rank << " size: " << size << std::endl;
          //   std::cout << "IDSet: ";
          //   return true;
          //   for (auto it : IDSet)
          //     std::cout << it << " ";
          //   std::cout << std::endl;
          // }
        }
        else{
          int size = IDSet.size();
          int size1 = InterStr.size() + 1;
          std::cout << "Received data: ";
          for (int num : IDSet) {
              std::cout << num << " ";
          }
          std::cout << std::endl;
          MPI_Send(&size, 1, MPI_INT, 1, 0, MPI_COMM_WORLD); // 发送数据的大小
          MPI_Send(IDSet.data(), size, MPI_INT, 1, 1, MPI_COMM_WORLD); // 发送数据
          MPI_Send(&size1, 1, MPI_INT, 1, 2, MPI_COMM_WORLD); // 发送数据的大小
          MPI_Send(InterStr.c_str(), size1, MPI_CHAR, 1, 3, MPI_COMM_WORLD); // 发送数据
          int signal;
          MPI_Recv(&signal, 1, MPI_INT, 1, 100, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
          if (signal == 1) {
            std::cout << "Process 2: received stop signal, exiting early.\n";
            exit(0);
          }
        }
        if (IfMatch(s)){
          return true;
        }
        else {
          if (IsIntersect(s))
            return true;
        }
      }
    }  
    else {
      for (auto it : NextV[i]){
        ns->NS = it;
        IDSet.emplace_back(ns->NS->Node2Continuation.first->LabelID);
        if (i == RegExN - 1)
          ns->Next = nullptr;
        else  
          ns->Next = (SimulationState*)malloc(sizeof(SimulationState));
        i++;  
        if (ComputAllState(NextV, i, s, ns->Next, IDSet))
          return true;
        else
          i--;
      }
    }
    if (!IDSet.empty()) {
        IDSet.pop_back();
    }

    return false;
  }

  bool RegExpSymbolic::IntersectionK::IsEmptyStateIn(std::vector<std::set<RegExpSymbolic::FollowAtomata::NFAState*>> NextV){
    for (auto it : NextV){
      if (it.empty())
        return false;
    }
    return true;
  }

  void RegExpSymbolic::IntersectionK::DumpSimulationState(SimulationState* s){
    while (s != nullptr){
      std::cout << s->NS->Node2Continuation.first << ": continuation" <<  REnodeClass::REnodeToString(s->NS->Node2Continuation.second) << std::endl;
      FollowAtomata::DumpState(s->NS);
      s = s->Next;
    }
  }

  bool RegExpSymbolic::IntersectionK::IsinAlphabet(uint8_t k, std::vector<REnodeClass> REClassList){
    for (auto it : REClassList){
      if (it.ByteMap[k] == 0){
        return false;
      }
    }
    return true;
  }

  void RegExpSymbolic::IntersectionK::ComputeAlphabet(std::vector<REnodeClass> REClassList){
    for (auto it : REClassList){
      std::set<uint8_t> color_set1;
      color_set1.insert(it.ByteMap[0]);
      if (IsinAlphabet(0, REClassList))
        Alphabet.insert(0);
      for (int i = 0; i < 256; i++){
        if (color_set1.find(it.ByteMap[i]) != color_set1.end()) 
          continue;
        else{
          color_set1.insert(it.ByteMap[i]);
          if (IsinAlphabet(i, REClassList))
            Alphabet.insert(i);
        }
      }
    }
  }

  // void RegExpSymbolic::IntersectionK::InsertInCache(SimulationState* ss, SimulationCache* sc){
  //   while (ss != nullptr){
  //     auto NextCache = new SimulationCache(ss->NS);
  //     sc->NS2Cache.insert(std::make_pair(ss->NS, NextCache));
  //     sc = NextCache;
  //     ss = ss->Next;
  //   }
  // }

   bool RegExpSymbolic::IntersectionK::IsInCache(SimulationState* ss, SimulationCache* sc){
    bool ret = true;
    while (ss != nullptr){
      auto nextCache = sc->NS2Cache.find(ss->NS->Node2Continuation.first);
      if (nextCache == sc->NS2Cache.end()){
        auto NextCache = new SimulationCache(ss->NS);
        sc->NS2Cache.insert(std::make_pair(ss->NS->Node2Continuation.first, NextCache));
        ret = false;
        sc = NextCache;
        ss = ss->Next;
      }
      else{
        ss = ss->Next;  
        sc = nextCache->second;
      }
    }
    
    return ret;
  }

  RegExpSymbolic::IntersectionK::IntersectionK(std::vector<REnodeClass> ReList){
    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);  // 当前进程编号
    MPI_Comm_size(MPI_COMM_WORLD, &size);  // 总进程数
    std::cout << "rank: " << rank << " size: " << size << std::endl;
    RegExN = ReList.size();
    REClassList = ReList;
    for (auto it : REClassList)
      FList.emplace_back(FollowAtomata(it));
    auto SS = new SimulationState(FList[0].NState);
    SS->IDSet.emplace_back(SS->NS->Node2Continuation.first->LabelID);
    SSBegin = SS;
    for (int i = 1; i < FList.size(); i++){
      SS->Next = new SimulationState(FList[i].NState);
      SSBegin->IDSet.emplace_back(SS->Next->NS->Node2Continuation.first->LabelID);
      SS = SS->Next;
    };
    Scache = new SimulationCache((FollowAtomata::NFAState*)malloc(sizeof(FollowAtomata::NFAState)));
    // IsInCache(SSBegin, Scache);
    ComputeAlphabet(REClassList);
    // RegExpSymbolic::DumpAlphabet(Alphabet);
  }

  bool RegExpSymbolic::IntersectionK::Intersect(){
    if (IfMatch(SSBegin))
      return true;
    if (IsIntersect(SSBegin))
      return true;
    else
      return false;  
  }

  bool RegExpSymbolic::IntersectionK::IsIntersect(SimulationState* s){
    // std::cout << "witness str: " << InterStr << std::endl;
    // DumpSimulationState(s);
    for (auto c : Alphabet){
      // std::cout << "matching: " << int(c) << " " << std::endl;
      // s->byte2state.insert(std::make_pair(ByteMap[c], SimulationSet));
      auto ss = s;
      std::vector<std::set<RegExpSymbolic::FollowAtomata::NFAState*>> NextList;
      int FollowID = 0;
      bool ISN = false;
      while (ss != nullptr){
        auto nextns1 = FList[FollowID].StepOneByte(ss->NS, c);
        if (nextns1.size() == 0)
          ISN = true;
        NextList.emplace_back(nextns1);
        ss = ss->Next;
        FollowID = FollowID + 1;
      }
      if (ISN){
        continue;
      }
      InterStr.push_back(c);
      auto currs = (SimulationState*)malloc(sizeof(SimulationState));
      int level = 0;
      std::vector<int> IDSet;
      if (ComputAllState(NextList, level, currs, nullptr, IDSet)){
        return true;
      }
      else
        InterStr.pop_back();
      
    }

    return false;
  }
}

