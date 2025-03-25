#include "parser.h"
#include "../Solver/solver.h"
#include <cmath>
#include <map>
#include <list>
#include <bitset>
#include <ostream>
#include <string.h>
namespace solverbin {

  void Parser::AddStarID(REnode* e1, unsigned int id){
      switch (e1->KindReturn())
      {
      case Kind::REGEXP_NONE:{
        e1->StarIDs.insert(id);
        break;
      }
      case Kind::REGEXP_RUNE:{
        e1->StarIDs.insert(id);
        break;
      }
      case Kind::REGEXP_CONCAT:{
        e1->StarIDs.insert(id);
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          AddStarID(e1->Children[i], id);
        }
        break;
      }
      case Kind::REGEXP_UNION:{
        e1->StarIDs.insert(id);
        for (long unsigned int i = 0; i < e1->Children.size(); i++){
          AddStarID(e1->Children[i], id);
        }
        break;
      }
      case Kind::REGEXP_STAR:{
        e1->StarIDs.insert(id);
        AddStarID(e1->Children[0], id);
        break;
      }
      case Kind::REGEXP_PLUS:{
        e1->StarIDs.insert(id);
        AddStarID(e1->Children[0], id);
        break;
      }
      case Kind::REGEXP_OPT:{
        e1->StarIDs.insert(id);
        AddStarID(e1->Children[0], id);
        break;
      }
      case Kind::REGEXP_CHARCLASS:{
        e1->StarIDs.insert(id);
        break;
      }
      case Kind::REGEXP_DIFF:
        break;
      case Kind::REGEXP_COMPLEMENT:
        break;
      case Kind::REGEXP_STRING:
        break;
      case Kind::REGEXP_LOOP:{
        e1->StarIDs.insert(id);
        AddStarID(e1->Children[0], id);
        break;
      } 
      case Kind::REGEXP_REPEAT:{
        e1->StarIDs.insert(id);
        AddStarID(e1->Children[0], id);
        break;
      }
      case Kind::REGEXP_Lookahead:{
        e1->StarIDs.insert(id);
        AddStarID(e1->Children[0], id);
        break;
      }    
      default:
        break;
      }
    }


}