/******************************************************************************
 * Top contributors (to current version):
 *   Aina Niemetz, Gereon Kremer, Andrew Reynolds
 *
 * This file is part of the cvc5 project.
 *
 * Copyright (c) 2009-2023 by the authors listed in the file AUTHORS
 * in the top-level source directory and their institutional affiliations.
 * All rights reserved.  See the file COPYING in the top-level source
 * directory for licensing information.
 * ****************************************************************************
 *
 * The cvc5 C++ API.
 */

#include "solver_export.h"

#ifndef CVC5__API__CVC5_H
#define CVC5__API__CVC5_H

#include "solver_kind.h"
#include "solver_types.h"
#include "solver_proof_rule.h"
#include <functional>
#include <map>
#include <memory>
#include <optional>
#include <set>
#include <sstream>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <variant>
#include <vector>

namespace solverbin {


enum AssertionStatus {
  IsInRe,
  NoneDefined
};

 enum NODE_STATUS{
      NODE_NULLABLE = 0,
      NODE_NULLABLE_UNKNOWN = 1,
      NODE_NULLABLE_NOT = 2,
};

struct RuneClass
{
  unsigned min;
  unsigned max;
  friend bool operator < (const RuneClass& n1, const RuneClass& n2)
  {
    if (n1.min != n2.min)
      return n1.min < n2.min;
    else
      return n1.max < n2.max;
  }
  RuneClass() : min(), max(){}
  RuneClass(unsigned i, unsigned a) : min(i), max(a){}
};// the definition of CharClass


class REnode{
  public:
    Kind kind;
    NODE_STATUS Status = NODE_NULLABLE_UNKNOWN; // the status of the node
    std::vector<REnode*> Children;   //child nodes
    RuneClass Rune_Class;     // charclass decoded by utf-8
    RuneClass Counting;      // counting range
    std::string Str;    // string Kind
    REnode* UnfoldNode = nullptr;
    REnode* First = nullptr;
    std::map<uint8_t, std::map<REnode*, REnode*>> kToNode; // map from the byte to the node
    std::map<REnode*, REnode*> FiretSeq; // map from the byte to the node
    Kind KindReturn() {return kind;}; // return the kind of the node

    REnode()  :kind(), Rune_Class(){}

    REnode(Kind K, RuneClass RC) :kind(K), Rune_Class(RC){}
};

class REnodeClass{
  public:
    

    struct DFAState{

    };

    #ifndef RuneSequence
      typedef std::vector<REnode*> RuneSequence;
    #endif  
    
    REnode* initREnode(Kind K, RuneClass RC){
      REnode* e = new REnode(K, RC);
      return e;
    }

    uint8_t ByteMap[256];   // disjoint range of the node
    std::set<RuneClass> BytemapRange;  // the range of the node


    REnode* Renode;
    int color_max = 0;

    REnodeClass(Node r);
    REnodeClass();
    
    std::set<uint8_t> Alphabet; // the alphabet of the node

    REnode* linearize(Node e, std::set<RuneClass>& BytemapRange); // convert the node to the linear form

    std::string REnodeToString(REnode* e); // convert the node to the string

    std::map<REnode*, REnode*> FirstNode(REnode* e);

    std::map<REnode*, REnode*> ccontinuation(REnode* e1, unsigned int c); //todo 

    void BytemapRangeToString(std::set<RuneClass>& BytemapRange); // convert the range to the string

    void BuildBytemap(uint8_t* ByteMap, std::set<RuneClass>& BytemapRange); // convert the range to the bytemap

    void ComputeAlphabet(uint8_t* ByteMap, std::set<uint8_t> &Alphabet); // compute the alphabet of the node

    void BuildBytemapToString(uint8_t* ByteMap); // convert the bytemap to the string

    void RuneSequenceToString(std::map<REnode*, REnode*>& RS); // convert the range to the string

    void ConvertToUTF_8(int_21 min, int_21 max, RuneSequence& RS); // convert the range to the utf-8

    void isNullable(REnode* e); // check if the node is nullable

    REnode* CopyREnode(REnode* e);
    
}; // the definition of node in Regex


class Node{
  public:
    Kind kind;
    bool isNull(){
      return false;
    };
    Kind getKind(){
      return kind;
    };
};

class NodeOperator{
  public:
    Node* mkNode(Kind, uint32_t, uint32_t);
};

class NodeManager{
  NodeOperator* mkNodeOperator;

  public:
    NodeOperator* currentNM(){
      return mkNodeOperator;
    };
};

class Assertion{
  public:
    AssertionStatus Status;

};

class Command{
  public:
};

class Solver{
  public:
    std::vector<Assertion> Assertions;
    Node* mkNode();
    Solver();
    ~Solver();
};


namespace main {
class CommandExecutor;
}  // namespace main

namespace internal {

}

}  // namespace cvc5

#endif
