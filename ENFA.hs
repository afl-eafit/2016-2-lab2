module ENFA where

import Data.Set ( Set )

-- | A non-deterministic finite automaton with epsilon transitions.
data ENFA = ENFA
            { states     :: Set Int                 --  States
            , symbols    :: Set Char                --  Input symbols
            , delta      :: Int -> Char -> Set Int  --  Transition function
            , start      :: Int                     --  Start state
            , accepting  :: Set Int                 --  Accepting states
            }
