module ENFA where

import Data.Set ( Set )

-- | A non-deterministic finite automaton with epsilon transitions.
data ENFA state symbol =
  ENFA { states     :: Set state                     --  States
       , symbols    :: Set symbol                    --  Input symbols
       , delta      :: state -> symbol -> Set state  --  Transition function
       , start      :: state                         --  Start state
       , accepting  :: Set state                     --  Accepting states
       }
