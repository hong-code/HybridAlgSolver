#include "regexp_symbolic.h"
#include "../solver.h"

#include <cmath>
#include <map>
#include <list>
#include <bitset>



using namespace solverbin;



namespace solverbin{
  std::map<REnode*, REnode*> REnodeClass::FirstNode(REnode* e1){
  // BuildBytemapToString(this->ByteMap);
  // std::cout << REnodeToString(e1) << std::endl;
  std::map<REnode*, REnode*> RSVec;
  switch (e1->KindReturn()){
    case Kind::REGEXP_NONE:{
      e1->Status = NODE_STATUS::NODE_NULLABLE;
      break;
    }
    case Kind::REGEXP_RUNE:{
      if (e1->FiretSeq.empty()){
        e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        REnode* e2 = initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
        e1->FiretSeq.insert(std::make_pair(e1, e2));
        RSVec = e1->FiretSeq;
        break;
      }
      else {
        return e1->FiretSeq;
      }
    }
    case Kind::REGEXP_CONCAT:{
      if (e1->FiretSeq.empty()){
        e1->Status = NODE_STATUS::NODE_NULLABLE;
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          auto RS1 = FirstNode(e1->Children[i]);
          if (RS1.size() != 0){
            for (auto it : RS1){
              REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
              if (it.second->KindReturn() == Kind::REGEXP_NONE){
                if (i == e1->Children.size() - 1)
                  e2 = it.second;
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
                  e2 = it.second;
                else{
                  e2->Children.emplace_back(it.second);
                  e2->Children.insert(e2->Children.end(), e1->Children.begin() + i + 1, e1->Children.end());
                }
              }
              RSVec.insert(std::make_pair(it.first, e2));
            }
          }
          if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE_NOT){
            e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
            break;
          }
        }
        e1->FiretSeq = RSVec;
      }
      else 
        return e1->FiretSeq;
      break;
    }
      
    case Kind::REGEXP_UNION:{
      e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
      if (e1->FiretSeq.empty()){
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          auto RS1 = FirstNode(e1->Children[i]);
          if (RS1.size() != 0){
            for (auto it : RS1){
              RSVec.insert(it);
            }
          }
          if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE)
            e1->Status = NODE_STATUS::NODE_NULLABLE;
        }
        e1->FiretSeq = RSVec;
      }
      else 
        return e1->FiretSeq;
      break;
    }
    case Kind::REGEXP_INTER:{
      // TODO
      break;
    }  
    case Kind::REGEXP_STAR:{
      e1->Status = NODE_STATUS::NODE_NULLABLE;
      if (e1->FiretSeq.empty()){
          auto RS1 = FirstNode(e1->Children[0]);
          if (RS1.size() != 0){
            for (auto it : RS1){
              if (it.second->KindReturn() == Kind::REGEXP_NONE){
                RSVec.insert(std::make_pair(it.first, e1));
              }
              else{
                REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
                e2->Children.emplace_back(it.second);
                e2->Children.emplace_back(e1);
                RSVec.insert(std::make_pair(it.first, e2));
              }
            }
          }
          e1->FiretSeq = RSVec;
        }
        else 
          return e1->FiretSeq;
      break;
    }
    case Kind::REGEXP_PLUS:{
      e1->Status = NODE_STATUS::NODE_NULLABLE;
      if (e1->FiretSeq.empty()){
        e1->kind = Kind::REGEXP_CONCAT;
        if (e1->UnfoldNode == nullptr)
          e1->UnfoldNode = CopyREnode(e1->Children[0]);
        REnode* e3 = initREnode(Kind::REGEXP_STAR, RuneClass(0, 0));  
        e3->Children = e1->Children;
        e1->Children.pop_back();
        e1->Children.insert(e1->Children.begin(), e3);
        e1->Children.insert(e1->Children.begin(), e1->UnfoldNode);
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          auto RS1 = FirstNode(e1->Children[i]);
          if (RS1.size() != 0){
            for (auto it : RS1){
              REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
              if (it.second->KindReturn() == Kind::REGEXP_NONE){
                if (i == e1->Children.size() - 1)
                  e2 = it.second;
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
                  e2 = it.second;
                else{
                  e2->Children.emplace_back(it.second);
                  e2->Children.insert(e2->Children.end(), e1->Children.begin() + i + 1, e1->Children.end());
                }
              }
              RSVec.insert(std::make_pair(it.first, e2));
            }
          }
          if (e1->Children[i]->Status == NODE_STATUS::NODE_NULLABLE_NOT){
            e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
            break;
          }
        }
        e1->FiretSeq = RSVec;
      }
      else 
        return e1->FiretSeq;
      break;
    }
    case Kind::REGEXP_OPT:{
      e1->Status = NODE_STATUS::NODE_NULLABLE;
      if (e1->FiretSeq.empty()){
        auto RS1 = FirstNode(e1->Children[0]);
        if (RS1.size() != 0){
          RSVec = RS1;
        }
        e1->FiretSeq = RSVec;
      }
      else 
        return e1->FiretSeq;
      break;
    }
    case Kind::REGEXP_CHARCLASS:{
      e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
      if (e1->FiretSeq.empty()){
        REnode* e2 = initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
        e1->FiretSeq.insert(std::make_pair(e1, e2));
        RSVec = e1->FiretSeq;
        break;
      }
      else {
        return e1->FiretSeq;
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
      int min = e1->Counting.min;
      int max = e1->Counting.max;
      if (e1->FiretSeq.empty()){
        int iteration = 1;
        if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE_UNKNOWN){
          isNullable(e1->Children[0]);
        }
        if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE){
          iteration = e1->Counting.max;
        }
        else
          iteration = 1;
        if (e1->Counting.min == 0 || e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE)  
          e1->Status = NODE_STATUS::NODE_NULLABLE;
        else
          e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        for(int i = 0; i < iteration; i++){
          auto RS1 = FirstNode(CopyREnode(e1->Children[0]));
          if (RS1.size() != 0){
            auto e3 = initREnode(Kind::REGEXP_LOOP, RuneClass(0, 0)); // e1 : r{d, d} e3 : r{d-1, d-1}
            e3->Children = e1->Children;
            if (e1->Counting.min > 0){
              min--;
              max--;
              e3->Counting = RuneClass(min, max);
            }
            else{
              max--;
              e3->Counting = RuneClass(0, max);
            }
            if (e3->Counting.max == 0){
              e3->kind = Kind::REGEXP_NONE;
            }
            for (auto it : RS1){
              if (it.second->KindReturn() == Kind::REGEXP_NONE){
                RSVec.insert(std::make_pair(it.first, e3));
              }
              else{
                if (e3->kind == Kind::REGEXP_NONE){
                  REnode* e2 =  it.second;
                  RSVec.insert(std::make_pair(it.first, e2));
                }
                else{
                  REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
                  e2->Children.emplace_back(it.second);
                  e2->Children.emplace_back(e3);
                  RSVec.insert(std::make_pair(it.first, e2));
                }
              }
            }
          }
        }
        if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE || e1->Counting.min == 0)
          e1->Status = NODE_STATUS::NODE_NULLABLE;
        else
          e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
        e1->FiretSeq = RSVec;
      }
      else 
        return e1->FiretSeq;
      break;
    }
    case Kind::REGEXP_REPEAT:{
      int min = e1->Counting.min;
      int max = e1->Counting.max;
      if (e1->FiretSeq.empty()){
        int iteration = 1;
        if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE_UNKNOWN){
          isNullable(e1->Children[0]);
        }
        if (e1->Children[0]->Status == NODE_STATUS::NODE_NULLABLE){
          e1->Status = NODE_STATUS::NODE_NULLABLE;
          iteration = e1->Counting.max;
        }
        else{
          iteration = 1;}
        if (iteration == 1){
          e1->Status = NODE_STATUS::NODE_NULLABLE_NOT;
          auto RS1 = FirstNode(CopyREnode(e1->Children[0]));
          if (RS1.size() != 0){
            auto e3 = initREnode(Kind::REGEXP_REPEAT, RuneClass(0, 0)); // e1 : r{d, d} e3 : r{d-1, d-1}
            e3->Children = e1->Children;
            min--;  max--;
            e3->Counting = RuneClass(min, max);
            if (e3->Counting.min == 0){
              e3->kind = Kind::REGEXP_NONE;
            }
            for (auto it : RS1){
              if (it.second->KindReturn() == Kind::REGEXP_NONE){
                RSVec.insert(std::make_pair(it.first, e3));
              }
              else{
                if (e3->kind == Kind::REGEXP_NONE){
                  REnode* e2 = it.second;
                  RSVec.insert(std::make_pair(it.first, e2));
                }
                else{
                  REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
                  e2->Children.emplace_back(it.second);
                  e2->Children.emplace_back(e3);
                  RSVec.insert(std::make_pair(it.first, e2));
                }
              }
            }  
          }    
          break;
        }
        else{
          for(int i = 0; i < (iteration-1); i++){
            e1->Children.emplace_back(CopyREnode(e1->Children[0]));
          }
          e1->kind = Kind::REGEXP_CONCAT;
          e1->Status = NODE_STATUS::NODE_NULLABLE;
          for (long unsigned int i = 0; i < e1->Children.size(); i++){
            auto RS1 = FirstNode(e1->Children[i]);
            if (RS1.size() != 0){
              for (auto it : RS1){
                REnode* e2 = initREnode(Kind::REGEXP_CONCAT, RuneClass(0, 0));
                if (it.second->KindReturn() == Kind::REGEXP_NONE){
                  if (i == e1->Children.size() - 1)
                    e2 = it.second;
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
                    e2 = it.second;
                  else{
                    e2->Children.emplace_back(it.second);
                    e2->Children.insert(e2->Children.end(), e1->Children.begin() + i + 1, e1->Children.end());
                  }
                }
                RSVec.insert(std::make_pair(it.first, e2));
              }
            }
          }
        }
        e1->FiretSeq =  RSVec;
      }
      else 
        return e1->FiretSeq;
      break;   
    }
    default: break;
  }
  return RSVec;
}

  void  RegExpSymbolic::FollowAtomata::DumpState(NFAState* s){
    std::cout << "Follow: ";
    for (auto i : s->NodeSequence){
      std::cout << i.first << ":" << REnodeClass::REnodeToString(i.first) << " ";
    }
    std::cout << "" << std::endl;
  }

  RegExpSymbolic::FollowAtomata::NFACache* RegExpSymbolic::FollowAtomata::Step2Left(NFACache* DC, int c){
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

  RegExpSymbolic::FollowAtomata::NFACache* RegExpSymbolic::FollowAtomata::Step2Right(NFACache* DC, int c){
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

  RegExpSymbolic::FollowAtomata::NFAState* RegExpSymbolic::FollowAtomata::FindInNFACache(NFACache* DC, NFAState* s){
    int BeginiIndex = 0;
    for (auto i : s->IndexSequence){
      if (i - BeginiIndex > 1){
        DC = Step2Left(DC, i - BeginiIndex - 1);
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
  RegExpSymbolic::FollowAtomata::FollowAtomata(){}
  RegExpSymbolic::FollowAtomata::FollowAtomata(Node e){
    REClass = REnodeClass("");
    REClass.REnodeToString(REClass.Renode);
    // REClass.FirstNode(REClass.Renode);
    // NState->NodeSequence = REClass.FirstNode(Renode1);
    NState = new NFAState(Begin, REClass.FirstNode(REClass.Renode));
    DumpState(NState);
    auto BeginNode = REClass.initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
    NState->Node2Continuation = std::pair(BeginNode, REClass.Renode);
    if (REClass.Renode->Status == NODE_STATUS::NODE_NULLABLE){
      NState->NFlag = Match;
    }else
      NState->NFlag = Begin;
    for (auto it : NState->NodeSequence){
      auto itc = Node2Index.find(it.first);
      if (itc != Node2Index.end()){
        NState->IndexSequence.insert(itc->second);
      }
      else{
        IndexMax++;
        Node2Index.insert(std::make_pair(it.first, IndexMax));
        NState->IndexSequence.insert(IndexMax);
      }
    }
    Node2NFAState.insert(std::make_pair(NState->Node2Continuation.first, NState));
    auto mm = StepOneByte(NState, 224);
    for (auto i : mm){
      std::cout << REClass.REnodeToString(i->Node2Continuation.second) << std::endl;
      DumpState(i);
    }
    
  }
  RegExpSymbolic::FollowAtomata::FollowAtomata(REnodeClass e){
    REClass = e;
    NState = new NFAState(Begin, REClass.FirstNode(REClass.Renode));
    auto BeginNode = REClass.initREnode(Kind::REGEXP_NONE, RuneClass(0, 0));
    NState->Node2Continuation = std::pair(BeginNode, REClass.Renode);
    if (REClass.Renode->Status == NODE_STATUS::NODE_NULLABLE){
      NState->NFlag = Match;
    }else
      NState->NFlag = Begin;
    for (auto it : NState->NodeSequence){
      auto itc = Node2Index.find(it.first);
      if (itc != Node2Index.end()){
        NState->IndexSequence.insert(itc->second);
      }
      else{
        IndexMax++;
        Node2Index.insert(std::make_pair(it.first, IndexMax));
        NState->IndexSequence.insert(IndexMax);
      }
    }
    Node2NFAState.insert(std::make_pair(NState->Node2Continuation.first, NState));
  }

  void RegExpSymbolic::FollowAtomata::CheckingFollow(std::set<RegExpSymbolic::FollowAtomata::NFAState*> &NFAStateVec){
    std::set<RegExpSymbolic::FollowAtomata::NFAState*> NFAStates = NFAStateVec;
    while (!NFAStates.empty()){
      auto node = *NFAStates.begin();
      NFAStates.erase(node);
      for (auto Tnode : NFAStates){
        bool mark = true; 
        if (node->NodeSequence.size() != Tnode->NodeSequence.size())
          mark = false;
        for (auto First : node->NodeSequence){
          if (!mark)
            break;
          if (Tnode->NodeSequence.find(First.first) != Tnode->NodeSequence.end())
            continue;
          else {
            mark = false;
            break;
          }
        }
        if (mark){
          NFAStates.erase(Tnode);
          NFAStateVec.erase(Tnode);
        }    
      }
    }
  }

  std::set<RegExpSymbolic::FollowAtomata::NFAState*> RegExpSymbolic::FollowAtomata::StepOneByte(NFAState* s, uint8_t c){
    std::set<RegExpSymbolic::FollowAtomata::NFAState*> NFAStateVec;
    auto itc = s->Next.find(REClass.ByteMap[c]);
    if (itc != s->Next.end()){
      NFAStateVec = itc->second;
      return NFAStateVec;
    }
    for (auto i : s->NodeSequence){
      if (c >= i.first->Rune_Class.min && c <= i.first->Rune_Class.max){
        if (i.second->KindReturn() == Kind::REGEXP_NONE){
          NFAState* nfastate = new NFAState(Normal, REClass.FirstNode(i.second));
          nfastate->Node2Continuation = std::make_pair(i.first, i.second);
          nfastate->NFlag = Match;
          NFAStateVec.insert(nfastate);
          Node2NFAState.insert(std::make_pair(i.first, nfastate));
          continue;
        }
        auto ns = Node2NFAState.find(i.first);
        if (ns != Node2NFAState.end()){
          NFAStateVec.insert(ns->second);
          continue;
        }
        NFAState* nfastate = new NFAState(Normal, REClass.FirstNode(i.second));
        nfastate->Node2Continuation = std::make_pair(i.first, i.second);
        if (i.second->Status == NODE_STATUS::NODE_NULLABLE){
          nfastate->NFlag = Match;
        }else
          nfastate->NFlag = Normal;
        NFAStateVec.insert(nfastate);
        Node2NFAState.insert(std::make_pair(i.first, nfastate));
      }
      else
        continue;
      
    }
    CheckingFollow(NFAStateVec);
    s->Next.insert(std::make_pair(REClass.ByteMap[c], NFAStateVec));
    return NFAStateVec;
  }

} //solverbin
