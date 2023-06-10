module IDM2021

import Data.Nat
import Data.Vect
import Data.List

import Syntax.PreorderReasoning

import Data.Telescope

{- =========================================================================↓1 -}
{-
                      Equational reasoning and rewriting
   
                               Guillaume Allais, Edwin Brady,
                         Ohad Kammar, Jeremy Yallop, Nathan Corbyn
                         ^^^^^^^^^^^
                   <ohad.kammar@ed.ac.uk>
   
                          Idris Developers Meeting
                                Idris Castle
                                  Scotland
                               April 28, 2021
                               
                               
    Supported by:
     The Royal Society, Alan Turing Institute, 
     Facebook Research Award, EPSRC, VeTTS                                     -}
{- =======================================================================1↑↓2 -}
-- Rewriting: Why?

rev : (0 n : Nat) -> Vect n a -> Vect n a
rev 0     []        = []
rev (S n) (x :: xs) = rewrite plusCommutative 1 n in
                      rev n xs ++ [x]







-- Have: xs ++ [x] : Vect (n + 1) a
-- Goal:             Vect (1 + n) a                                               
{- =======================================================================2↑↓3 -}
-- Rewriting
-- From Idris2/src/Core/Env.idr
revOnto : (xs, vs : List a) -> reverseOnto xs vs = reverse vs ++ xs
revOnto xs [] = Refl
revOnto xs (v :: vs)
    = 
      rewrite revOnto (v :: xs) vs                  in
      rewrite appendAssociative (reverse vs) [v] xs in
      rewrite revOnto [v] vs                        in 
      Refl



-- Main cons:
--            - Readbility: hidden proof state
--
{- =======================================================================3↑↓4 -}
-- Rewriting

proof1 : (x,y,z : Nat) -> (x = y) -> (x + y = z) 
                       -> (x + x = z)
proof1 x y z prf prf1 = rewrite Prelude.cong (x+) prf in 
                        prf1


namespace Reminder

  cong : (0 f : (t -> u)) ->   a =   b 
                          -> f a = f b
  cong _ Refl = Refl

-- Cons:
--            - Indirection: rewrites everywhere
{- =======================================================================4↑↓5 -}
-- Rewriting
proof2 :    (xs, ys : List a) 
         -> (xs = ys) 
         -> reverse xs = reverse ys
proof2 xs ys prf = rewrite prf in
                   Refl
-- vs

proof2' : (n,m : Nat) -> (n = m)
         -> (xs : Vect n a) 
         -> (ys : Vect m a) -> (xs = ys) 
         -> reverse xs = reverse ys
proof2' n m prf0 xs ys prf = 
                       -- rewrite prf in 
                       ?proof2_rhs3
-- Cons:
--            - TODO: rewrite dependent types
{- =======================================================================5↑↓6 -}
-- Alternative: equational reasoning
-- import Syntax.PreorderReasoning -- from contrib
sak : (a,b,c : Nat) -> a + (b + c) = b + (a + c)      
sak a b c = Calc $                                    
  |~ a + (b + c)                                      
  ~~ (a + b) + c ...(plusAssociative a b c          )
  ~~ (b + a) + c ...(cong (+c) $ plusCommutative a b)
  ~~ b + (a + c) ...(sym $ plusAssociative b a c    )  



-- General pattern:
--                                Calc $                
--                                |~ step0              
--                                ~~ step1 ...(reason01)
--                                ~~ step2 ...(reason12)
--                                ~~ step3 ...(reason23)
{- =======================================================================6↑↓7 -}
-- Alternative: equational reasoning

sak' : (a,b,c : Nat) -> a + (b + c) = b + (a + c)      
sak' a b c = Calc $
  |~ a + (b + c)
  ~~ (b + c) + a ...(plusCommutative _ _)
  ~~ b + (c + a) ...(sym $ plusAssociative _ _ _ )
  ~~ b + (a + c) ...(cong (b+) $ plusCommutative _ _)

sak'' : (a,b,c : Nat) -> a + (b + c) = b + (a + c)      
sak'' a b c = rewrite plusCommutative a (b + c)   in
              rewrite sym $ plusAssociative b c a in
              rewrite plusCommutative c a         in
              Refl



{- =======================================================================7↑↓8 -}
-- Equational reasoning in action
revOnto' : (xs, vs : List a)-> 
                               reverseOnto xs vs = reverse vs ++ xs

revOnto' xs [] = Refl

revOnto' xs (v :: vs) = Calc $
  |~ reverseOnto (v :: xs) vs
  ~~ reverseOnto [] vs ++ (v:: xs)  ...(revOnto _ _             )
  ~~ ( reverse vs ) ++ ([v] ++ xs)  ...(Refl  {- readability! -})
  ~~ ((reverse vs ) ++  [v])++ xs   ...(appendAssociative _ _ _ )
  ~~ (reverseOnto [v] vs)   ++ xs   ...(cong (++ xs) $ sym $ 
                                             revOnto _ _        )
-- + Explicate proof state              - inflexible
-- + Document normalisation steps       ± Explicit rewriting position
-- + Allows inference

{- =======================================================================8↑↓9 -}
-- Equational reasoning: implementation

-- Notation
infixl 0  ~~~
prefix 1  |~~
infix  1  ....

data Step' : a -> b -> Type where
  (....) : (0 y : a) -> (0 step : x ~=~ y) -> Step' x y

data Derivation : (x : a) -> (y : b) -> Type where
  (|~~) : (0 x : a) -> Derivation x x
  (~~~) : Derivation x y -> (step : Step' y z) -> Derivation x z

Calc' : {0 x : a} -> {0 y : b} -> Derivation x y -> x ~=~ y
Calc' (|~~ x) = Refl
Calc' ((~~~) der (_ ....(Refl))) = Calc' der
{- =======================================================================9↑↓10 -}
{- Non-implementation
       cf. Agda / Idris1:
                               begin
                               step0  ==< reason01 >==
                               step1  ==< reason12 >==
                               step2  ==< reason23 >==
                               step3               QED

       Can lead to 5x slow-down                               (see PR #316)
                        
       Previous slide is Agda's representation
      
       But! Agda also has syntax patterns:
                     syntax     step-≡  x y∼z x≡y     =      x ≡⟨ x≡y ⟩ y∼z
                     
       => we need built-in support                              (Volunteers?)  -}
{- ======================================================================10↑↓11-}
-- Tooling: N-ary dependent cong for Dependent rewriting 
depCong4 : {p0   :                                           Type} 
 -> {0 a0, b0 : p0} 
 -> {0 p1 : (x0 : p0)                                    -> Type} 
 -> {0 a1 : p1 a0}    -> {0 b1 : p1 b0} 
 -> {0 p2 : (x0 : p0) -> (x1: p1 x0)                     -> Type}
 -> {0 a2 : p2 a0 a1} -> {0 b2 : p2 b0 b1}
 -> {0 p3 : (x0 : p0) -> (x1 : p1 x0) -> (x2 : p2 x0 x1) -> Type}
 -> {0 a3 : p3 a0 a1 a2}  -> {0 b3 : p3 b0 b1 b2}
 -> {0 ty : (x0 : p0) -> (x1 : p1 x0) -> (x2 : p2 x0 x1) -> (x3 : p3 x0 x1 x2)  
                                                         -> Type}
 -> (0 ctxt : (x0 : p0) -> (x1 : p1 x0) -> (x2 : p2 x0 x1) -> (x3 : p3 x0 x1 x2) 
             -> ty x0 x1 x2 x3)
  -> a0 = b0 -> a1 = b1 -> a2 = b2  -> a3 = b3
  -> ctxt a0 a1 a2 a3 = ctxt b0 b1 b2 b3
depCong4 ctxt Refl Refl Refl Refl = Refl
{- ======================================================================11↑↓12-}
-- Tooling: N-ary dependent cong
-- Data.Telescope.Congruence.cong
-- Recall:
proof2'' : (n,m : Nat) -> (n = m)
         -> (xs : Vect n a) -> (ys : Vect m a) -> (xs = ys) 
         -> reverse xs = reverse ys
proof2'' {a} n m prf0 xs ys prf = 
  Data.Telescope.Congruence.cong                 -- from contrib, wip with Allais
        {n = 2, delta = [ const Nat              -- Need explicit type
                        , \(_ ** k) => Vect k a]
        , sy = \k,zs => Vect k a}
        context prf0 prf 
  where
    context : ?
    context = \k, zs => the (Vect k a) (reverse zs)
{- ======================================================================12↑↓13-}
-- Tooling: reasoning in context
-- Agda PR #1158: Holey reasoning

sak''' : (a,b,c : Nat) -> a + (b + c) = b + (a + c) 
{- Wish for:
sak' a b c = Calc $                                    
  |~ a + (b + c)                                      
  
  ~~ (a + b) + c ...(plusAssociative _ _ _)         
  ~~ [b + a] + c .::(plusCommutative _ _)  
     -- instead of  ...(cong (+c) $ plusCommutative a b)
     
  ~~ b + (a + c) ...(sym $ plusAssociative _ _ _) 
-}

-- Needs: elab. reflection, metaprogramming, dependent zipper
{- ======================================================================13↑↓14-}
-- Tooling: algebraic solvers
-- Frex               [TyDe'20, PEPM'20]
0 
proof3 : (a,b,c : Nat) -> c + 2*b + a = (a + b) + (b + c) 
{-
proof3 a b c = Frexify frexNat [a,b,c] 
                  (let x,y,z : Terms {n = 3}
                       x = var 0
                       y = var 1
                       z = var 2 in
                   ((z :+: (2 *: y )) :+: x
                       =-=
                    (x :+: y) :+: (y :+: z)))
                    { prf = ?hole' }
-}
-- + Copy/paste equation et voila!                - wip                          
-- + Complete w.r.t. evaluation and equations:    - still klunky                 
--      commutative monoid (Nat, +, 0)            - slow type-checking (for now!)
{- ======================================================================14↑↓15-}
{-
   Summary: equational reasoning 
  
   Why?      Readability, direct and finer control
  
   How?      Currently: contrib/Syntax.PreorderReasoning         
             Wanted: built-in support                            (volunteers?)
  
   Tooling:
             N-ary congruence for dependent rewriting            [wip]
             Holey reasoning                                     (volunteers?)
             Algebraic solvers: Frex                             [wip]
  
  
                                Thank you!                                     -}
{- ======================================================================15↑↓16-}
