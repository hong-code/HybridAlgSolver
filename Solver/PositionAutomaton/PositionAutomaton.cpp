#include "PositionAutomaton.h"
#include "../solver.h"

#include <cmath>
#include <map>
#include <list>
#include <bitset>



using namespace solverbin;


namespace solverbin{

  int FollowAtomata::FindIndexOfNodes(REnode* e){
    auto Index = Node2Index.find(e);
    if (Index == Node2Index.end()){
      IndexMax++;
      Node2Index.insert(std::make_pair(e, IndexMax));
      return IndexMax;
    }
    else {
      return Index->second;
    }
  }

  void FollowAtomata::ProcessCounting(RuneClass& r){
    if (r.min == 0){
      r.max--;
    }
    else {
      r.min--;
      r.max--;
    }
  }

  void FollowAtomata::Isnullable(REnode* e1){
  switch (e1->KindReturn())
  {
  case Kind::REGEXP_NONE:{
    e1->Isnullable = true;
    break;
  }
  case Kind::REGEXP_RUNE:{
    e1->Isnullable = false;
    break;
  }
  case Kind::REGEXP_CONCAT:{
    e1->Isnullable = true;
    for (long unsigned int i = 0; i < e1->Children.size(); i++){
      Isnullable(e1->Children[i]);
      if (!e1->Children[i]->Isnullable){
        e1->Isnullable = false;
        break;
      }
    }
    break;
  }
  case Kind::REGEXP_UNION:{
    e1->Isnullable = false;
    for (long unsigned int i = 0; i < e1->Children.size(); i++){
      Isnullable(e1->Children[i]);
      if (e1->Children[i]->Isnullable){
        e1->Isnullable = true;
        break;
      }
    }
    break;
  }
  case Kind::REGEXP_STAR:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
    e1->Isnullable = true;
    Isnullable(e1->Children[0]);
    break;
  }
  case Kind::REGEXP_PLUS:{
    Isnullable(e1->Children[0]);
    if (e1->Children[0]->Isnullable){
      e1->Isnullable = true;
    }
    else{
      e1->Isnullable = false;
    }
    break;
  }
  case Kind::REGEXP_OPT:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
    e1->Isnullable = true;
    Isnullable(e1->Children[0]);
    break;
  }
  case Kind::REGEXP_CHARCLASS:{
    e1->Isnullable = false;
    break;
  }
  case Kind::REGEXP_DIFF:
    break;
  case Kind::REGEXP_COMPLEMENT:
    break;
  case Kind::REGEXP_STRING:
    break;
  case Kind::REGEXP_LOOP:{
    Isnullable(e1->Children[0]);
    if (e1->Children[0]->Isnullable){
      e1->Isnullable = true;
    }
    else if (e1->Counting.min == 0){
      e1->Isnullable = true;
    }
    else {
      e1->Isnullable = false;
    }
    break;
  }
  // case Kind::REGEXP_REPEAT:{
  //   isNullable(e1->Children[0]);
  //   if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE){
  //     e1->Status = NODE_STATUS::NODE_NULLABLE;
  //   }
  //   else{
  //     e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
  //   }
  //   break;
  // }  
  case Kind::REGEXP_Lookahead:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
    Isnullable(e1->Children[0]);
    if (e1->Children[0]->Isnullable)
      e1->Isnullable = true;
    else  
      e1->Isnullable = false;  
    break;
  }

  case Kind::REGEXP_NLookahead:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
    Isnullable(e1->Children[0]);
    if (e1->Children[0]->Isnullable)
      e1->Isnullable = true;
    else  
      e1->Isnullable = false; 
    break;
  }

  default:
    break;
  }
}

  std::vector<FollowAtomata::State*> FollowAtomata::MergeState(std::vector<FollowAtomata::State*> SV1, FollowAtomata::State* s2){
    std::vector<FollowAtomata::State*> VEC;
    for (auto it : SV1){
      if (it->ValideRange.max >= s2->ValideRange.min){
        
        int up_bound = std::min(it->ValideRange.max, s2->ValideRange.max);
        int low_bound = std::max(it->ValideRange.min, s2->ValideRange.min);
        if (up_bound >= low_bound){
          if (it->Ccontinuation->kind == Kind::REGEXP_NLookahead) {
            Isnullable(it->Ccontinuation);
            if (it->Ccontinuation->Isnullable) {
              continue;
            }
          }
          auto S = new FollowAtomata::State(s2->IndexSequence, it->Ccontinuation, it->ValideRange);
          S->ValideRange = RuneClass(low_bound, up_bound);
          for (auto itc : it->IndexSequence)
            S->IndexSequence.insert(itc);
          REnode* e = REClass.initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));  
          e->Children.emplace_back(it->Ccontinuation);
          e->Children.emplace_back(s2->Ccontinuation);
          S->Ccontinuation = e;
          VEC.emplace_back(S);
        }
        else {
          if (it->Ccontinuation->kind == Kind::REGEXP_NLookahead) {
            Isnullable(it->Ccontinuation);
            if (!it->Ccontinuation->Isnullable) {
              VEC.emplace_back(s2);
            }
          }
          continue;
        }

      }
      else {
        if (it->Ccontinuation->kind == Kind::REGEXP_NLookahead) {
          Isnullable(it->Ccontinuation);
          if (!it->Ccontinuation->Isnullable) {
            VEC.emplace_back(s2);
          }
        }
        continue;
      }
         
    }
    return VEC;
  }  

  std::pair<std::vector<FollowAtomata::State*>, std::vector<FollowAtomata::State*>> FollowAtomata::FirstNode(REnode* e1){
  // BuildBytemapToString(this->ByteMap);
  // std::cout << REnodeToString(e1) << std::endl;
  std::vector<FollowAtomata::State*> RSVec1;
  std::vector<FollowAtomata::State*> RSVec2;
  std::vector<FollowAtomata::State*> Vec_Null;
  std::set<int> IndexS1;
  std::set<int> IndexS2;
  switch (e1->KindReturn()){
    case Kind::REGEXP_NONE:{
      e1->Status = NODE_STATUS::NODE_NULLABLE;
      e1->Isnullable = true;
      break;
    }
    case Kind::REGEXP_RUNE:{
      auto Vec = Node2NFAState.find(e1);
      if (Vec == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        e1->Isnullable = false;
        REnode* e2 = REClass.initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
        IndexS2.insert(FindIndexOfNodes(e1));
        FollowAtomata::State* NS = new FollowAtomata::State(IndexS2, e2, e1->Rune_Class);
        RSVec2.emplace_back(NS);
        Node2NFAState.insert(std::make_pair(e1, RSVec2));
        return std::make_pair(RSVec1, RSVec2);
      }
      else {
        return std::make_pair(RSVec1, Vec->second);
      }
    }
    case Kind::REGEXP_CONCAT:{
      auto Vec2 = Node2NFAState.find(e1);
      auto Vec1 = Node2LookAState.find(e1);
      if (Vec2 == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        e1->Isnullable = true;
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          auto RSA = FirstNode(e1->Children[i]);
          auto RS1 = RSA.second;
          if (RS1.size() != 0){
            for (auto it : RS1){
              REnode* e2 = REClass.initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
              if (it->Ccontinuation->KindReturn() == Kind::REGEXP_NONE){
                if (i == e1->Children.size() - 1)
                  e2 = it->Ccontinuation;
                else{
                  if (i == e1->Children.size() - 2){
                    e2 = *(e1->Children.end()-1);
                  }
                  else
                    e2->Children.insert(e2->Children.end(), e1->Children.begin() + i + 1, e1->Children.end());
                }
              }
              else{
                if (i == e1->Children.size() - 1)
                  e2 = it->Ccontinuation;
                else{
                  e2->Children.emplace_back(it->Ccontinuation);
                  e2->Children.insert(e2->Children.end(), e1->Children.begin() + i + 1, e1->Children.end());
                }
              }        
              auto nfa_e2 = new FollowAtomata::State(it->IndexSequence, e2, it->ValideRange);
              if (RSVec1.size() != 0){
                auto Vec_Ret = MergeState(RSVec1, nfa_e2);
                RSVec2.insert(RSVec2.end(), Vec_Ret.begin(), Vec_Ret.end());
              }
              else{
                RSVec2.emplace_back(nfa_e2);
              }
            }
          }
          if (RSVec1.size() == 0)
            RSVec1.insert(RSVec1.end(), RSA.first.begin(), RSA.first.end());
          else {
            std::vector<FollowAtomata::State*> RSVec_Stable;
            for (auto LookAroundNode : RSA.first){
              auto nfa_LookAroundNode = new FollowAtomata::State(LookAroundNode->IndexSequence, LookAroundNode->Ccontinuation, LookAroundNode->ValideRange);
              auto Vec_Ret = MergeState(RSVec1, nfa_LookAroundNode);
              RSVec_Stable.insert(RSVec_Stable.end(), Vec_Ret.begin(), Vec_Ret.end());
            }
            if (RSVec_Stable.size() != 0)
              RSVec1 = RSVec_Stable;
          } 
          if (!e1->Children[i]->Isnullable){
            e1->Isnullable = false;
          }
          if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE_NOT){
            e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
            break;
          }
        }
        Node2NFAState.insert(std::make_pair(e1, RSVec2));
        if (e1->Status == NODE_STATUS::NODE_NULLABLE){
          Node2LookAState.insert(std::make_pair(e1, RSVec1));
          return std::make_pair(RSVec1, RSVec2);
        }
        else{
          Node2LookAState.insert(std::make_pair(e1, Vec_Null));
          return std::make_pair(Vec_Null, RSVec2);
        }
      }
      else {
        return std::make_pair(Vec1->second, Vec2->second);
      }
      break;
    }
      
    case Kind::REGEXP_UNION:{
      auto Vec2 = Node2NFAState.find(e1);
      auto Vec1 = Node2LookAState.find(e1);
      if (Vec2 == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        e1->Isnullable = false;
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          auto RSA = FirstNode(e1->Children[i]);
          auto RS1 = RSA.second;
          RSVec2.insert(RSVec2.end(), RS1.begin(), RS1.end());
          RSVec1.insert(RSVec1.end(), RSA.first.begin(), RSA.first.end());
          if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE){
            e1->Status = NODE_STATUS::NODE_NULLABLE;
          } 
          if (e1->Children[i]->Isnullable){
            e1->Isnullable = true;
          }
        }
        Node2NFAState.insert(std::make_pair(e1, RSVec2));
        Node2LookAState.insert(std::make_pair(e1, RSVec1));
        return std::make_pair(RSVec1, RSVec2);
      }
      else {
        return std::make_pair(Vec1->second, Vec2->second);
      }
      break;
    }
    case Kind::REGEXP_INTER:{
      // TODO
      break;
    }  
    case Kind::REGEXP_STAR:{
      auto Vec2 = Node2NFAState.find(e1);
      auto Vec1 = Node2LookAState.find(e1);
      if (Vec2 == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        e1->Isnullable = true;
        auto RSA = FirstNode(e1->Children[0]);
        auto RS1 = RSA.second;
        if (RS1.size() != 0){
          for (auto it : RS1){
            if (it->Ccontinuation->KindReturn() == Kind::REGEXP_NONE){
              RSVec2.emplace_back(new FollowAtomata::State(it->IndexSequence, e1, it->ValideRange));
            }
            else{
              REnode* e2 = REClass.initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
              e2->Children.emplace_back(it->Ccontinuation);
              e2->Children.emplace_back(e1);
              RSVec2.emplace_back(new FollowAtomata::State(it->IndexSequence, e2, it->ValideRange));
            }
          }
        }
        Node2NFAState.insert(std::make_pair(e1, RSVec2));
        Node2LookAState.insert(std::make_pair(e1, RSVec1));
        return std::make_pair(Vec_Null, RSVec2);
      }
      else 
        return std::make_pair(Vec1->second, Vec2->second);
      break;
    }
    case Kind::REGEXP_OPT:{
      auto Vec2 = Node2NFAState.find(e1);
      auto Vec1 = Node2LookAState.find(e1);
      if (Vec2 == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        e1->Isnullable = true;
        auto LookAheadNodes = REClass.initREnode(Kind::REGEXP_OPT, RuneClass(0, 0));
        auto RSA = FirstNode(e1->Children[0]);
        auto RS1 = RSA.second;
        if (RS1.size() != 0){
          RSVec2 = RS1;
        }
        Node2NFAState.insert(std::make_pair(e1, RSVec2));
        Node2LookAState.insert(std::make_pair(e1, RSVec1));
        return std::make_pair(Vec_Null, RSVec2);
      }
      else 
        return std::make_pair(Vec1->second, Vec2->second);
      break;
    }
    case Kind::REGEXP_CHARCLASS:{
      auto Vec2 = Node2NFAState.find(e1);
      auto Vec1 = Node2LookAState.find(e1);
      if (Vec2 == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        e1->Isnullable = false;  
        REnode* e2 = REClass.initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
        IndexS2.insert(FindIndexOfNodes(e1));
        FollowAtomata::State* NS = new FollowAtomata::State(IndexS2, e2, e1->Rune_Class);
        RSVec2.emplace_back(NS);
        Node2NFAState.insert(std::make_pair(e1, RSVec2));
        Node2LookAState.insert(std::make_pair(e1, RSVec1));
        return std::make_pair(RSVec1, RSVec2);
      }
      else {
        return std::make_pair(Vec1->second, Vec2->second);
      }
      break;
    }
    case Kind::REGEXP_DIFF:
      break;
    case Kind::REGEXP_COMPLEMENT:
      break;
    case Kind::REGEXP_STRING:
      break;
    case Kind::REGEXP_LOOP:{
      auto Vec2 = Node2NFAState.find(e1);
      auto Vec1 = Node2LookAState.find(e1);
      RuneClass Counting;
      Counting.min = e1->Counting.min;
      Counting.max = e1->Counting.max;
      if (Vec2 == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        e1->Isnullable = true;
        while (Counting.max > 0){
          auto node_new = REClass.CopyREnode(e1->Children[0]);
          auto e1Copy = REClass.CopyREnode(e1);
          auto RSA = FirstNode(node_new);
          ProcessCounting(Counting);
          auto RS1 = RSA.second;
          if (RS1.size() != 0){
            for (auto it : RS1){
              REnode* e2 = REClass.initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
              if (it->Ccontinuation->KindReturn() == Kind::REGEXP_NONE){
                if (Counting.max == 0)
                  e2 = it->Ccontinuation;
                else{
                  e2 = e1Copy;
                  e2->Counting = Counting;
                }
              }
              else{
                if (Counting.max == 0)
                  e2 = it->Ccontinuation;
                else{
                  e1Copy->Counting = Counting;
                  e2->Children.emplace_back(it->Ccontinuation);
                  e2->Children.emplace_back(e1Copy);
                }
              }        
              auto nfa_e2 = new FollowAtomata::State(it->IndexSequence, e2, it->ValideRange);
              if (RSVec1.size() != 0){
                auto Vec_Ret = MergeState(RSVec1, nfa_e2);
                RSVec2.insert(RSVec2.end(), Vec_Ret.begin(), Vec_Ret.end());
              }
              else{
                RSVec2.emplace_back(nfa_e2);
              }
            }
          }
          if (RSVec1.size() == 0)
            RSVec1.insert(RSVec1.end(), RSA.first.begin(), RSA.first.end());
          else {
            std::vector<FollowAtomata::State*> RSVec_Stable;
            for (auto LookAroundNode : RSA.first){
              auto nfa_LookAroundNode = new FollowAtomata::State(LookAroundNode->IndexSequence, LookAroundNode->Ccontinuation, LookAroundNode->ValideRange);
              auto Vec_Ret = MergeState(RSVec1, nfa_LookAroundNode);
              RSVec_Stable.insert(RSVec_Stable.end(), Vec_Ret.begin(), Vec_Ret.end());
            }
            if (RSVec_Stable.size() != 0)
              RSVec1 = RSVec_Stable;
          }
          if (!e1->Children[0]->Isnullable && e1->Counting.min > 0){
            e1->Isnullable = false;
          }
          if (node_new->Status == NODE_STATUS::NODE_NULLABLE_NOT){
            if (e1->Counting.min > 0)
              e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
            break;
          }
        }
        Node2NFAState.insert(std::make_pair(e1, RSVec2));
        Node2LookAState.insert(std::make_pair(e1, RSVec1));
      }  
      else {
        return std::make_pair(Vec1->second, Vec2->second);
      }
      break;
    }
    
    case Kind::REGEXP_Lookahead:{
      auto Vec2 = Node2NFAState.find(e1);
      auto Vec1 = Node2LookAState.find(e1);
      if (Vec2 == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        e1->Isnullable = false;
        auto R1 = FirstNode(e1->Children[0]);
        for (auto it : R1.first){
          auto REnode_LOOKA = REClass.initREnode(Kind::REGEXP_Lookahead, RuneClass(0,0));
          REnode_LOOKA->Children.emplace_back(it->Ccontinuation);
          RSVec1.emplace_back(new FollowAtomata::State(it->IndexSequence, REnode_LOOKA, it->ValideRange));
        }
        for (auto it : R1.second){
          auto REnode_LOOKA = REClass.initREnode(Kind::REGEXP_Lookahead, RuneClass(0,0));
          REnode_LOOKA->Children.emplace_back(it->Ccontinuation);
          RSVec1.emplace_back(new FollowAtomata::State(it->IndexSequence, REnode_LOOKA, it->ValideRange));
        }
        Node2LookAState.insert(std::make_pair(e1, RSVec1));
        Node2NFAState.insert(std::make_pair(e1, RSVec2));
        if (e1->Children[0]->Isnullable)
          e1->Isnullable = true;
        return std::make_pair(RSVec1, RSVec2); 
      }
      else {
        return std::make_pair(Vec1->second, Vec2->second);
      }
    }

    case Kind::REGEXP_NLookahead:{
      auto Vec2 = Node2NFAState.find(e1);
      auto Vec1 = Node2LookAState.find(e1);
      if (Vec2 == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        e1->Isnullable = false;
        auto R1 = FirstNode(e1->Children[0]);
        for (auto it : R1.first){
          auto REnode_LOOKA = REClass.initREnode(Kind::REGEXP_NLookahead, RuneClass(0,0));
          REnode_LOOKA->Children.emplace_back(it->Ccontinuation);
          RSVec1.emplace_back(new FollowAtomata::State(it->IndexSequence, REnode_LOOKA, it->ValideRange));
        }
        for (auto it : R1.second){
          auto REnode_LOOKA = REClass.initREnode(Kind::REGEXP_NLookahead, RuneClass(0,0));
          REnode_LOOKA->Children.emplace_back(it->Ccontinuation);
          RSVec1.emplace_back(new FollowAtomata::State(it->IndexSequence, REnode_LOOKA, it->ValideRange));
        }
        Node2LookAState.insert(std::make_pair(e1, RSVec1));
        Node2NFAState.insert(std::make_pair(e1, RSVec2));
        if (e1->Children[0]->Isnullable)
          e1->Isnullable = true;
        return std::make_pair(RSVec1, RSVec2); 
      }
      else {
        return std::make_pair(Vec1->second, Vec2->second);
      }
    }

    default: break;
    
  }
  return std::make_pair(RSVec1, RSVec2);
}

  FollowAtomata::FollowAtomata(){}
  FollowAtomata::FollowAtomata(Node e){
    REClass = REnodeClass("");
    REClass.REnodeToString(REClass.Renode);
    // REClass.FirstNode(REClass.Renode);
    // NState->NodeSequence = REClass.FirstNode(Renode1);
    std::set<int> IntS;
    IntS.insert(0);
    IndexMax++;
    NState = new State(IntS, REClass.Renode, RuneClass(0, 0));
    auto Ret = FirstNode(REClass.Renode);
    NState->FirstSet = Ret.second;
    NState->FirstSet.insert(NState->FirstSet.end(), Ret.first.begin(), Ret.first.end());
    DumpState(NState);
    if (NState->Ccontinuation->Isnullable){
      NState->DFlag = Match;
    }else
      NState->DFlag = Begin;
    
  }
  FollowAtomata::FollowAtomata(REnodeClass e){
    REClass = e;
    std::set<int> IntS;
    IntS.insert(0);
    IndexMax++;
    NState = new State(IntS, REClass.Renode, RuneClass(0, 0));
    auto Ret = FirstNode(REClass.Renode);
    NState->FirstSet = Ret.second;
    NState->FirstSet.insert(NState->FirstSet.end(), Ret.first.begin(), Ret.first.end());
    if (NState->Ccontinuation->Isnullable){
      NState->DFlag = Match;
    }else
      NState->DFlag = Begin;
    FindInNFACache(nfacache, NState);
  }

  std::vector<FollowAtomata::State*> FollowAtomata::StepOneByte(State* s, uint8_t c){
    std::vector<FollowAtomata::State*> NFAStateVec;
    auto itc = s->NextStates.find(REClass.ByteMap[c]);
    if (itc != s->NextStates.end()){
      NFAStateVec = itc->second;
      return NFAStateVec;
    }
    // bool Mark = false;
    for (auto i : s->FirstSet){
      if (c >= i->ValideRange.min && c <= i->ValideRange.max){
        auto Tuple = FirstNode(i->Ccontinuation);
        // if (Tuple.second.size() == 0)
        //   Mark = true;
        i->FirstSet = Tuple.second;
        i->FirstSet.insert(i->FirstSet.end(), Tuple.first.begin(), Tuple.first.end());
        if (i->Ccontinuation->Isnullable){
          i->DFlag = Match;
          if (REClass.matchFlag != REnodeClass::MatchFlag::dollarEnd)
            return {};
        }else
          i->DFlag = Normal;
        NFAStateVec.emplace_back(FindInNFACache(nfacache, i));
      }
      else
        continue;
      
    }
    s->NextStates.insert(std::make_pair(REClass.ByteMap[c], NFAStateVec));
    return NFAStateVec;
  }

  void  FollowAtomata::DumpState(State* s){
    std::cout << "Follow: ";
    for (auto i : s->FirstSet){
      std::cout << REnodeClass::REnodeToString(i->Ccontinuation) << "\n";
    }
    std::cout << "" << std::endl;
  }

  FollowAtomata::NFACache* FollowAtomata::Step2Left(NFACache* DC, int c){
    NFACache* dc = DC;
    for (int i = 0; i < c; i++){
      if (dc->left == nullptr){
        dc->left = new NFACache(IsNULL, nullptr, nullptr);
        dc = dc->left;
      }
      else{
        dc = dc->left;
      }
    }
    return dc;
  }

  FollowAtomata::NFACache* FollowAtomata::Step2Right(NFACache* DC, int c){
    NFACache* dc = DC;
    for (int i = 0; i < c; i++){
      if (dc->right == nullptr){
        dc->right = new NFACache(IsNULL, nullptr, nullptr);
        dc = dc->right;
      }
      else{
        dc = dc->right;
      }
    }
    return dc;
  }

  FollowAtomata::State* FollowAtomata::FindInNFACache(NFACache* DC, State* s){
    int BeginiIndex = 0;
    for (auto i : s->IndexSequence){
      if (i - BeginiIndex > 0){
        DC = Step2Left(DC, i - BeginiIndex);
      }
      DC = Step2Right(DC, 1);
      BeginiIndex = i;
    }
    if (DC->NCFlage == IsNotNULL){
      return DC->DS;
    }else{
      DC->NCFlage = IsNotNULL;
      DC->DS = s;
      return s;
    }
  }

} //solverbin
