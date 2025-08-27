#include "FollowAutomaton.h"
#include "../solver.h"

#include <cmath>
#include <iostream>
#include <map>



using namespace solverbin;


namespace solverbin{

  // int FollowAutomaton::FindIndexOfNodes(REnode* e){
  //   auto Index = Node2Index.find(e);
  //   if (Index == Node2Index.end()){
  //     IndexMax++;
  //     Node2Index.insert(std::make_pair(e, IndexMax));
  //     return IndexMax;
  //   }
  //   else {
  //     return Index->second;
  //   }
  // }

  void FollowAutomaton::ProcessCounting(RuneClass& r){
    if (r.min == 0){
      r.max--;
    }
    else {
      r.min--;
      r.max--;
    }
  }

  void FollowAutomaton::Isnullable(REnode* e1){
  switch (e1->KindReturn())
  {
  case Kind::REGEXP_NONE:{
    e1->Status= NODE_STATUS::NODE_NULLABLE;
    break;
  }
  case Kind::REGEXP_RUNE:{
    e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    break;
  }
  case Kind::REGEXP_CONCAT:{
    e1->Status = NODE_STATUS::NODE_NULLABLE;
    for (long unsigned int i = 0; i < e1->Children.size(); i++){
      Isnullable(e1->Children[i]);
      if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE_NOT){
        e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        break;
      }
    }
    break;
  }
  case Kind::REGEXP_UNION:{
    e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    for (long unsigned int i = 0; i < e1->Children.size(); i++){
      Isnullable(e1->Children[i]);
      if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        break;
      }
    }
    break;
  }
  case Kind::REGEXP_STAR:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
    e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    Isnullable(e1->Children[0]);
    break;
  }
  case Kind::REGEXP_PLUS:{
    Isnullable(e1->Children[0]);
    if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE){
      e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    }
    else{
      e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
    }
    break;
  }
  case Kind::REGEXP_OPT:{
    // isNullable(e1->Children[0]); if you want to check whether the child is nullable
    e1->Status = NODE_STATUS::NODE_NULLABLE;
    Isnullable(e1->Children[0]);
    break;
  }
  case Kind::REGEXP_CHARCLASS:{
    e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
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
    if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE){
      e1->Status = NODE_STATUS::NODE_NULLABLE;
    }
    else if (e1->Counting.min == 0){
      e1->Status = NODE_STATUS::NODE_NULLABLE;
    }
    else {
      e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
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
  // case Kind::REGEXP_Lookahead:{
  //   // isNullable(e1->Children[0]); if you want to check whether the child is nullable
  //   Isnullable(e1->Children[0]);
  //   if (e1->Children[0]->Isnullable)
  //     e1->Isnullable = true;
  //   else  
  //     e1->Isnullable = false;  
  //   break;
  // }

  // case Kind::REGEXP_NLookahead:{
  //   // isNullable(e1->Children[0]); if you want to check whether the child is nullable
  //   Isnullable(e1->Children[0]);
  //   if (e1->Children[0]->Isnullable)
  //     e1->Isnullable = true;
  //   else  
  //     e1->Isnullable = false; 
  //   break;
  // }

  default:
    break;
  }
}

  // std::vector<FollowAutomaton::State*> FollowAutomaton::MergeState(std::vector<FollowAutomaton::State*> SV1, FollowAutomaton::State* s2){
  //   std::vector<FollowAutomaton::State*> VEC;
  //   for (auto it : SV1){
  //     if (it->ValideRange.max >= s2->ValideRange.min){
        
  //       int up_bound = std::min(it->ValideRange.max, s2->ValideRange.max);
  //       int low_bound = std::max(it->ValideRange.min, s2->ValideRange.min);
  //       if (up_bound >= low_bound){
  //         if (it->Ccontinuation->kind == Kind::REGEXP_NLookahead) {
  //           Isnullable(it->Ccontinuation);
  //           if (it->Ccontinuation->Isnullable) {
  //             continue;
  //           }
  //         }
  //         auto S = new FollowAutomaton::State(s2->IndexSequence, it->Ccontinuation, it->ValideRange);
  //         S->ValideRange = RuneClass(low_bound, up_bound);
  //         for (auto itc : it->IndexSequence)
  //           S->IndexSequence.insert(itc);
  //         REnode* e = REClass.initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));  
  //         e->Children.emplace_back(it->Ccontinuation);
  //         e->Children.emplace_back(s2->Ccontinuation);
  //         S->Ccontinuation = e;
  //         VEC.emplace_back(S);
  //       }
  //       else {
  //         if (it->Ccontinuation->kind == Kind::REGEXP_NLookahead) {
  //           Isnullable(it->Ccontinuation);
  //           if (!it->Ccontinuation->Isnullable) {
  //             VEC.emplace_back(s2);
  //           }
  //         }
  //         continue;
  //       }

  //     }
  //     else {
  //       if (it->Ccontinuation->kind == Kind::REGEXP_NLookahead) {
  //         Isnullable(it->Ccontinuation);
  //         if (!it->Ccontinuation->Isnullable) {
  //           VEC.emplace_back(s2);
  //         }
  //       }
  //       continue;
  //     }
         
  //   }
  //   return VEC;
  // }  

  std::vector<FollowAutomaton::State*> FollowAutomaton::FirstNode(REnode* e1){
  std::vector<FollowAutomaton::State*> NFAStateVec;
  std::set<int> IndexS1;
  switch (e1->KindReturn()){
    case Kind::REGEXP_NONE:{
      e1->Status = NODE_STATUS::NODE_NULLABLE;
      break;
    }
    case Kind::REGEXP_RUNE:{
      auto Vec = Node2NFAState.find(e1);
      if (Vec == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        REnode* e2 = REClass.initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
        FollowAutomaton::State* SubState = new FollowAutomaton::State(IndexMax, e2, e1->Rune_Class);
        IndexMax++;
        NFAStateVec.emplace_back(SubState);
        Node2NFAState.insert(std::make_pair(e1, NFAStateVec));
        return NFAStateVec;
      }
      else {
        return Vec->second;
      }
    }
    case Kind::REGEXP_CONCAT:{
      auto Vec = Node2NFAState.find(e1);
      if (Vec == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          auto FirstSetofChild = FirstNode(e1->Children[i]);
          if (FirstSetofChild.size() != 0){
            for (auto it : FirstSetofChild){
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
              auto SubState = new FollowAutomaton::State(it->Index, e2, it->ValideRange);
              NFAStateVec.emplace_back(SubState);
            }
          }
          if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE_NOT){
            e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
            break;
          }
        }
        Node2NFAState.insert(std::make_pair(e1, NFAStateVec));
        return NFAStateVec;
      }
      else {
        return Vec->second;
      }
      break;
    }
      
    case Kind::REGEXP_UNION:{
      auto Vec = Node2NFAState.find(e1);
      if (Vec == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          auto FirstSetofChild = FirstNode(e1->Children[i]);
          NFAStateVec.insert(NFAStateVec.end(), FirstSetofChild.begin(), FirstSetofChild.end());
          if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE){
            e1->Status = NODE_STATUS::NODE_NULLABLE;
          } 
        }
        Node2NFAState.insert(std::make_pair(e1, NFAStateVec));

        return NFAStateVec;
      }
      else {
        return Vec->second;
      }
      break;
    }
    case Kind::REGEXP_INTER:{
      // TODO
      break;
    }  
    case Kind::REGEXP_STAR:{
      auto Vec = Node2NFAState.find(e1);
      if (Vec == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        auto FirstSetofChild = FirstNode(e1->Children[0]);
        if (FirstSetofChild.size() != 0){
          for (auto it : FirstSetofChild){
            if (it->Ccontinuation->KindReturn() == Kind::REGEXP_NONE){
              NFAStateVec.emplace_back(new FollowAutomaton::State(it->Index, e1, it->ValideRange));
            }
            else{
              REnode* e2 = REClass.initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
              e2->Children.emplace_back(it->Ccontinuation);
              e2->Children.emplace_back(e1);
              NFAStateVec.emplace_back(new FollowAutomaton::State(it->Index, e2, it->ValideRange));
            }
          }
        }
        Node2NFAState.insert(std::make_pair(e1, NFAStateVec));
        return NFAStateVec;
      }
      else 
        return Vec->second;
      break;
    }
    case Kind::REGEXP_OPT:{
      auto Vec = Node2NFAState.find(e1);
      if (Vec == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        auto FirstSetofChild = FirstNode(e1->Children[0]);
        if (FirstSetofChild.size() != 0){
          NFAStateVec = FirstSetofChild;
        }
        Node2NFAState.insert(std::make_pair(e1, NFAStateVec));
        return NFAStateVec;
      }
      else 
        return Vec->second;
      break;
    }
    case Kind::REGEXP_CHARCLASS:{
      auto Vec = Node2NFAState.find(e1);
      if (Vec == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        REnode* e2 = REClass.initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
        FollowAutomaton::State* SubState = new FollowAutomaton::State(IndexMax, e2, e1->Rune_Class);
        IndexMax++;
        NFAStateVec.emplace_back(SubState);
        Node2NFAState.insert(std::make_pair(e1, NFAStateVec));
        return NFAStateVec;
      }
      else {
        return Vec->second;
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
      auto Vec = Node2NFAState.find(e1);
      RuneClass Counting;
      Counting.min = e1->Counting.min;
      Counting.max = e1->Counting.max;
      if (Vec == Node2NFAState.end()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        while (Counting.max > 0){
          auto node_new = REClass.CopyREnode(e1->Children[0]);
          auto e1Copy = REClass.CopyREnode(e1);
          auto FirstSetofChild = FirstNode(node_new);
          ProcessCounting(Counting);
          if (FirstSetofChild.size() != 0){
            for (auto it : FirstSetofChild){
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
              auto SubState = new FollowAutomaton::State(it->Index, e2, it->ValideRange);
              NFAStateVec.emplace_back(SubState);
            }
          }
          if (node_new->Status == NODE_STATUS::NODE_NULLABLE_NOT){
            if (e1->Counting.min > 0)
              e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
            break;
          }
        }
        Node2NFAState.insert(std::make_pair(e1, NFAStateVec));
      }  
      else {
        return Vec->second;
      }
      break;
    }

    default: break;
    
  }
  return NFAStateVec;
}

  FollowAutomaton::FollowAutomaton(){}
  FollowAutomaton::FollowAutomaton(Node e){
    REClass = REnodeClass("");
    REClass.REnodeToString(REClass.Renode);
    // REClass.FirstNode(REClass.Renode);
    // NState->NodeSequence = REClass.FirstNode(Renode1);
    std::set<int> IntS;
    IntS.insert(0);
    NState = new State(IndexMax, REClass.Renode, RuneClass(0, 0));
    IndexMax++;
    auto Ret = FirstNode(REClass.Renode);
    NState->FirstSet = Ret;
    DumpState(NState);
    if (NState->Ccontinuation->Status == NODE_STATUS::NODE_NULLABLE){
      NState->DFlag = Match;
    }else
      NState->DFlag = Begin;
    
  }
  FollowAutomaton::FollowAutomaton(REnodeClass e){
    REClass = e;
    NState = new State(IndexMax, REClass.Renode, RuneClass(0, 0), REClass.color_max);
    IndexMax++;
    DeadState->DFlag = Dead;
    auto Ret = FirstNode(REClass.Renode);
    for (auto it : Ret){
      NState->FollowIndexSet.insert(it->Index);
      NState->FirstSet.emplace_back(it);
    }
    if (NState->Ccontinuation->Status == NODE_STATUS::NODE_NULLABLE){
      NState->DFlag = Match;
    }else
      NState->DFlag = Begin;
    // FindInNFACache(nfacache, NState);
    Index2State.insert({NState->Index, NState});
    IndexSet2State.insert({NState->FollowIndexSet, NState});
  }

  std::vector<FollowAutomaton::State*> FollowAutomaton::StepOneByte(State* s, uint8_t c){
    std::vector<FollowAutomaton::State*> NFAStateVec;
    auto itc = s->NextStates[REClass.ByteMap[c]];
    if (!itc.empty()){
      if (itc[0] != DeadState)
        NFAStateVec = itc;
      return NFAStateVec;
    }
    // bool Mark = false;
    for (auto i : s->FirstSet){
      i->NextStates = std::vector<std::vector<State*>>(REClass.color_max+1);
      if (c >= i->ValideRange.min && c <= i->ValideRange.max){
        auto OldState = Index2State.find(i->Index);
        if (OldState != Index2State.end()){
          i = OldState->second;
        }
        else {
          Index2State.insert({i->Index, i});
          auto Tuple = FirstNode(i->Ccontinuation);
          for (auto it : Tuple){
            i->FirstSet.emplace_back(it);
            i->FollowIndexSet.insert(it->Index);
          }
          if (i->Ccontinuation->Status == NODE_STATUS::NODE_NULLABLE){
            i->DFlag = Match;
            // if (REClass.matchFlag != REnodeClass::MatchFlag::dollarEnd)
            //   return {};
          }else
            i->DFlag = Normal;

        }
        // if (Tuple.second.size() == 0)
        //   Mark = true;
        // Follow
        auto FollowState = IndexSet2State.find(i->FollowIndexSet);
        if (FollowState != IndexSet2State.end()){
          NFAStateVec.emplace_back(FollowState->second);
        }
        else{
          NFAStateVec.emplace_back(i);
          IndexSet2State.insert({i->FollowIndexSet, i});
        }
          
      }
      else{
        s->NextStates[REClass.ByteMap[c]] = {DeadState};
        continue;
      }
        
    }
    
    s->NextStates[REClass.ByteMap[c]] = NFAStateVec;
    return NFAStateVec;
  }

  void  FollowAutomaton::DumpState(State* s){
    std::cout << "Follow: ";
    for (auto i : s->FirstSet){
      std::cout << REnodeClass::REnodeToString(i->Ccontinuation) << "\n";
    }
    std::cout << "" << std::endl;
  }

  FollowAutomaton::NFACache* FollowAutomaton::Step2Left(NFACache* DC, int c){
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

  FollowAutomaton::NFACache* FollowAutomaton::Step2Right(NFACache* DC, int c){
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

  void FollowAutomaton::ComputeFullNFA(std::set<State*>& StateSet, std::vector<Transition>& TransitionSet){
    std::queue<State*> StateQueue;
    StateQueue.push(this->NState);
    while (StateQueue.size() != 0){
      auto CurrState = StateQueue.front();
      StateQueue.pop();
      if (StateSet.find(CurrState) == StateSet.end()){
        StateSet.insert(CurrState);
      }
      else
        continue;
      std::set<uint8_t> SymbolSet;
      REClass.ComputeAlphabet(REClass.ByteMap, SymbolSet);
      for (auto i : SymbolSet){
        auto NextStates = StepOneByte(CurrState, i);
        if (NextStates.size() != 0){
          for (auto it : NextStates){
            Transition T;
            T.src = CurrState->Index;
            T.dst = it->Index;
            T.symbol = i;
            TransitionSet.emplace_back(T);
            if (StateSet.find(it) == StateSet.end()){
              StateQueue.push(it);
            }
          }
        }
      }
    }
  }  

} //solverbin
