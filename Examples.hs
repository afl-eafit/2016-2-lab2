module Examples where

import Data.Set (Set, fromList, singleton, empty)
import RegEx
import ENFA

type RE = RegExp Char

_0, _1 :: RE
_0 = Symbol '0'
_1 = Symbol '1'
_e = Symbol 'e' --Epsilon

universe1, universe2 :: RE
universe1 = Star (Plus _0 _1)
universe2 = Star (Plus _1 _0)

s, r :: RE
s = universe1 `Dot` _1
r = Plus (Plus _0 _1) universe1

--The regular expression r yields an e-nfa like this using 1st
--simplification

m1 :: ENFA Int Char
m1 = ENFA (fromList [0, 1, 2, 3])
        (fromList ['0','1','e'])
        deltaM
        (0)
        (singleton 3)
    where
      deltaM :: Int -> Char -> Set Int
      deltaM 0  'e' = fromList [1, 3]
      deltaM 0  '0' = singleton 3
      deltaM 0  '1' = singleton 3
      deltaM 1  '0' = singleton 2
      deltaM 1  '1' = singleton 2
      deltaM 2  'e' = fromList [1,3]
      deltaM  _  _  = empty

--The regular expression s yields an e-nfa like this using 2nd
--simplifcation

m2 :: ENFA Int Char
m2 = ENFA (fromList [0, 1, 2, 3, 4, 5, 6, 7, 8])
        (fromList ['0','1','e'])
        deltaM
        (0)
        (singleton 8)
    where
      deltaM :: Int -> Char -> Set Int
      deltaM 0 'e' = singleton 1
      deltaM 1 'e' = fromList [2,3,7]
      deltaM 2 '0' = singleton 5
      deltaM 3 '1' = singleton 4
      deltaM 4 'e' = singleton 6
      deltaM 5 'e' = singleton 6
      deltaM 6 'e' = singleton 7
      deltaM 7 'e' = singleton 1
      deltaM 7 '1' = singleton 8
      deltaM _  _  = empty

--The regular expression s yields an e-nfa like this using 3rd
--simplifcation

m3 :: ENFA Int Char
m3 = ENFA (fromList [0, 1, 2, 3, 4, 5, 6, 7])
        (fromList ['0','1','e'])
        deltaM
        (0)
        (singleton 8)
    where
      deltaM :: Int -> Char -> Set Int
      deltaM 0 'e' = fromList [1, 2, 7]
      deltaM 1 '1' = singleton 1
      deltaM 2 'e' = singleton 5
      deltaM 3 '0' = singleton 4
      deltaM 4 'e' = singleton 5
      deltaM 5 'e' = fromList [0, 6]
      deltaM 6 '1' = singleton 7
      deltaM  _  _  = empty