module SPLS2021

import Frex
import Frexlet.Monoid
import Frexlet.Monoid.Notation.Additive
import Data.Vect
import Notation.Hints

----------------------------
import Data.String

import Frexlet.Monoid.Commutative
import Frexlet.Monoid.Notation.Multiplicative

import Frex.Axiom
import Frex.Free.Construction
import Frex.Free.Construction.Combinators
import Frex.Free.Construction.Linear

import Data.Fin
import Decidable.Equality
import Data.Either.Extra
import Data.Setoid.Vect.Inductive
import Text.PrettyPrint.Prettyprinter

import System.File

import Frexlet.Monoid.Involutive
import Frexlet.Monoid.Involutive.Notation
import Frexlet.Monoid.Notation.Multiplicative


[BORING] Show a where
  show _ = "boring"

FrexNat : {0 x : Type} -> Frex Commutative.Nat.Additive (irrelevantCast x)
FrexNat = Frex.Construction.Frex Commutative.Nat.Additive (irrelevantCast x)

Sta' : {0 x : Type} -> Nat -> U ((FrexNat {x}).Data.Model)
Sta' = (FrexNat).Data.Embed.H.H

Dyn' : {0 x : Type} -> x -> U (FrexNat {x}).Data.Model
Dyn' = (FrexNat {x}).Data.Var.H

namespace Printer
  infix 0 ~~
  public export
  0 (~~) : (lhs, rhs : Term (EvaluationSig (CommutativeMonoidTheory).signature Nat)
                            vars) -> Type
  (~~) = (FrexNat).Data.Model.rel

  %hint public export
  notation : {x : Type} -> Action2 Nat (U (FrexNat {x}).Data.Model)
  notation = NatAction2 (FrexNat {x}).Data.Model

Show (Fin n) where
  show = show . cast {to = Nat}


inv : Term (Frexlet.Monoid.Involutive.Theory.Signature) a ->
  Term (Frexlet.Monoid.Involutive.Theory.Signature) a
inv x = Call (MkOp Involution) [x]


{- ========================================================================↓1

                   Frex: dependently-typed algebraic simplification


                           Guillaume Allais, Edwin Brady,
                                  Nathan Corbyn,
                              Ohad Kammar, Jeremy Yallop
                              ^^^^^^^^^^^
                       <ohad.kammar@ed.ac.uk>



                       Scottish Programming Languages Seminar
                              University of St Andrews
                                   October 20, 2021




        Supported by:
         The Royal Society, Alan Turing Institute,
         Facebook Research Award, EPSRC

   ======================================================================1↑↓2 -}
reverse : Vect n a -> Vect n a
reverse {n} xs =

                                        rewrite sym $ plusZeroRightNeutral n in
                                        xs.reverseOnto []

  where
    (.reverseOnto) : (xs : Vect k a) -> (acc : Vect m a) -> Vect (k + m) a
    [       ].reverseOnto acc = acc
    (x :: xs).reverseOnto acc
      {k = S k, m}            =

                      rewrite plusSuccRightSucc k m in
                      xs.reverseOnto (x :: acc)

{- NB: similar issues:

     (.reverseOnto') : (xs : Vect k a) -> (acc : Vect m a) -> Vect (m + k) a

                 equational manipulation is necessary                          -}
{- =======================================================================2↑↓3 -}
{- Algebraic simplifiers     (a.k.a. solvers)

1. Tactics (Coq, Lean, Isabell/HOL)
E.g. (Coq)
                           1 goal

                             ============================
                             forall a b c : Z,
                             (a + b + c) ^ 2 = a * a + b ^ 2 + c * c
                                             + 2 * a * b + 2 * a * c
                                             + 2 * b * c

                       intros; ring.
                           No more goals.

2. Proof-reflection, e.g., Agda:                           <--   THIS TALK
          2 + x + (x + (1 + x) * k + r)
             ≡⟨ solve 3 (λ x r k → con 2 :+ x :+ (x :+ (con 1 :+ x) :* k :+ r)
                                     :=
                                   r :+ (con 1 :+ x) :* (con 2 :+ k))
                        refl x r k ⟩
           r + (1 + x) * (2 + k)                                              -}
{- =======================================================================3↑↓4 -}
{- Frex
                  Experiment: specifying algebraic simplifiers

   Core library formalising

      universal algebra                 free algebras  and   free extensions
       Frex.Signature,Algebra,etc.        Frex.Free             Frex.Frex

   Suite of simplifiers:

     Frexlet.Monoid            \
     Frexlet.Monoid.Commutative|
     Frexlet.Monoid.Involutive  > .Theory,Free,Frex
                               |
     Frexlet.YourSolverHere    /

   Frex offers:                                          (Talk structure-ish)
   + Uniform interface      + Extensibility     + Certification
   + Sound & complete       + Modularity        + Reactive performance
     simplification         + Proof extraction  + Reflection (wip)

   Today also:
   + Limitations     + Effect on idris2    + Frex Agda Augmentation (fragment) -}
{- =======================================================================4↑↓5 -}
-- Uniform interface: Universal algebra and related notation
MonoidTheory : Presentation
MonoidTheory = MkPresentation Monoid.Theory.Signature Monoid.Theory.Axiom $
  \case
    LftNeutrality => lftNeutrality Neutral Product
    RgtNeutrality => rgtNeutrality Neutral Product
    Associativity => associativity Product

parameters (A : Monoid)
  %hint
  monoidNotation : NotationHint A Additive1
  monoidNotation = (A).notationHint Additive1 (A).Additive1

  infix 0 ~~
  0 (~~) : (lhs, rhs : U A) -> Type
  (~~) = (A).equivalence.relation


  Ex1 : (a : U A) -> (O1 .+. (a .+. O1)) .+. O1 ~~ a
  Ex1 a = solve 1 (FreeMonoidOver _) $
          (O1 .+. (X 0 .+. O1)) .+. O1 =-= X 0


{- =======================================================================5↑↓6 -}
{- Sound and complete simplifiers

   1. Free algebra simplifier                              Frex.Free.solve

      Proves _all_ equations true in _all_ algebras

   2. Free extension simplifier                                 Frex.solve

      Proves _all_ equations involving:
        a. free variables dyn x                ; and
        b. constants      sta a
      using:
      1. axioms
      2. evaluation: f(Sta a1, ..., Sta an) = Sta f(a1, ..., an)
   Universal properties: For every other algebra B and env (+ homo. embedding)
          var                             dyn               sta
       X ------> Free X               X ------> Frex A X  <----- A
         \         |                    \         |             /
      env \   =    | U h             env \   =    | U h  =     / embed
           \       V                      \       V           /
            -----> B                       -----> B <---------

  for a unique homomorphism h : Fre(e/x A) X -> B                             -}
{- =======================================================================6↑↓7 -}
-- Under the hood: commutative monoids fral

0 Free_Commutative_Monoid_Over_Fin : Nat -> Type
Free_Commutative_Monoid_Over_Fin n
  = U (Frexlet.Monoid.Commutative.Free.Free {n}).Data.Model



uth1 : Free_Commutative_Monoid_Over_Fin n === Vect n Nat
uth1 = Refl



-- Idea: reify [k0, ..., kn-1] = k1 * X 0 + ... + kn-1 * X n-1


-- extensible: if it type-checks, ship it!

{- =======================================================================6↑↓7 -}
-- Under the hood: commutative monoids frex

0 (.Free_Extension_By_Fin) : CommutativeMonoid -> Nat -> Type
a.Free_Extension_By_Fin n
  = U (Frexlet.Monoid.Commutative.Frex a {n}).Data.Model

uth2 : a.Free_Extension_By_Fin n === (U a, Vect n Nat)
uth2 = Refl

-- Idea: reify (u, [k0, ..., kn-1]) = u + k1 * X 0 + ... + kn-1 * X n-1


-- Reason:
0 Coproduct_Carrier : (a,b : CommutativeMonoid) -> Type
Coproduct_Carrier a b =
  U (Frexlet.Monoid.Commutative.Coproduct.CoproductCospan a b).Data.Sink

uth3 : Coproduct_Carrier a b = (U a, U b)
uth3 = Refl

{- =====================================================================7↑↓8 -}
-- Proof extraction and certification



extractedProof : ((Dyn' 0 :+: Sta' 3) :+: Sta' 2 ~~ Sta' 5 :+: Dyn' 0)
                 {vars = Fin 1}
extractedProof = Frex.prove _ (Monoid.Commutative.Frex Nat.Additive)
                 {prf = %search}
               $ ((Dyn 0 |+| Sta 3) |+| Sta 2 =-= Sta 5 |+| Dyn 0)

displayProof : IO Unit
displayProof = do
  let separator : String := replicate 72 '-'
  let banner = \ str => unlines [separator, "-- " ++ str, separator]
  let printer = MkPrinter "CommutativeMonoidTheory" (Eval @{Words})
              $ withNesting $ withEvaluation $ withNames generic
  putStrLn $ banner "Commutative Monoid Theory"
  printLn  $ display CommutativeMonoidTheory
           $ MkPrinter "CommutativeMonoidTheory" Words $ withParens generic
  putStrLn $ banner "Simple proof"
  printLn  $ Proof.display unicode printer @{BORING} extractedProof



{- ======================================================================8↑↓9 -}
-- Under the hood: extraction using the quotient fral/frex
0 QuotientFree : Free pres x
QuotientFree = Frex.Free.Construction.Free pres x

ut4 : U (QuotientFree {pres} {x}).Data.Model
    === Term pres.signature (U x)
ut4 = Refl


0 QuotientFrex : (a : Model pres) -> Frex a x
QuotientFrex a = Frex.Construction.Frex a x


ut5 : U (QuotientFrex {pres} a {x}).Data.Model
    === Term (EvaluationSig pres.signature (U a)) (U x)
ut5 = Refl

{-       Free pres x           Frex a x
          |                      |
       ~= |                   ~= |
          v                      v
      QuotientFree          QuotientFrex a                   -}
{- =====================================================================9↑↓10 -}
{- Reflection (wip)

   FAQ: can elaborator reflection extract goals automatically?

   A: Yes, sometimes                                                       -}

shuffle : {a, b, c : Nat} -> a + (b + c) = c + (a + b)
shuffle = ?holeShuffle --%runElab frexMagic Monoid.Commutative.Frex Nat.Additive

{- Under the hood:
   1. Reify the goal and the semantics of operators
   2. Search for abstract names of operators relevant to the current algebra
   3. Match goal fragments against refied operations
   4. Try to reflect a simplifier call

   Incredibly subtle, easy to trip over.                                  -}







{- =====================================================================10↑↓11 -}
{- Limitations


1. Single-sorted algebraic theories

2. Higher bar: sound _and_ complete.

3. Streamline programming style

4. Slow type-errors




                                                                               -}
{- =====================================================================11↑↓12 -}
{- Performance evaluation (wip)

  + Compilation:

    fral simplifier      equation count        time
    --------------------------------------------------------
    monoids          726 (max depth 3)     50s  ( 60msec/eq)
    commutative     1407 (max depth 3)    160s  (110msec/eq)
    monoid

    (Caveat: Parsing overhead dominates, eg. 62s for the comm. monoid )

  + Time as number of varialbes increases:

    vars    time (s)
    ----------------
     20       1.8
     40       5.5
     60      16.4
     80      38.3
    100      77.0
    120     143.5
    140     258.9
    160     411.2

    (Is 60+ variables realistic requirement?)
-}
{- =====================================================================12↑↓13 -}
{- Effect on Idris2

  Frex requires significant type-level computation

  aim: <  1sec response times
       > 10sec response time is considered a bug

  Lessons learned:

                 no evaluation   >   fast evaluation

  so:
    + preserving sharing in subterms,
    + careful unification data structures
    + utilise the typical structure of unification/conversion problems.



  Also, stress-testing the language ~> Idris2 CI includes Frex

-}

{- =====================================================================13↑↓14 -}
{- Fragment: Frex Agda Augmentation
             ^^   ^^      ^^^^

  Reproduce the Frex design in Agda, comparison (wip):

  1. Idris2 is _fast_
  2. Reflection is different in both languages

    Agda: direct access to the guts of the type-checker,
    + tight control on low-level operations such as unification and normalisation
    - an unwieldy user-experience
    - breaking changes.

    Idris2 Philosophy: a small set of primitives hiding the underlying implementation
    + resilient
    + pleasant user-experience
    - interface is wip

   ~> different challenges:

     Idris2: recognise closed applications of type constructors hard
     Agda: output terms trip up unification

     and benefits:

     Idris2: Retain user-level syntactic sugar
     Agda: close to underlying type-theory, straightforward tree-traversals
-}
{- =====================================================================14↑↓15 -}
-- Summary
{- Frex
                  Experiment: specifying algebraic simplifiers

   Core library formalising

      universal algebra                 free algebras  and   free extensions
       Frex.Signature,Algebra,etc.        Frex.Free             Frex.Frex

   Suite of simplifiers:

     Frexlet.Monoid            \
     Frexlet.Monoid.Commutative|
     Frexlet.Monoid.Involutive  > .Theory,Free,Frex
                               |
     Frexlet.YourSolverHere    /

   Frex offers:                                          (Talk structure-ish)
   + Uniform interface      + Extensibility     + Certification
   + Sound & complete       + Modularity        + Reactive performance
     simplification         + Proof extraction  + Reflection (wip)           -}
{- =====================================================================15↑↓16 -}





-- Equational manipulation is necessary


mergeBy : (isLT: a -> a -> Bool) ->
  (xs : Vect n a) -> (ys : Vect m a) -> Vect (n + m) a
mergeBy     _ [] ys = ys
mergeBy {n} _ xs [] = rewrite plusZeroRightNeutral n in xs
  where plusZeroRightNeutral : (n : Nat) -> n + 0 = n
mergeBy {n = S n} {m = S m}
  isLT xs'@(x :: xs) ys'@(y :: ys) =
  if isLT x y
  then x :: mergeBy isLT xs ys'
  else rewrite sym (plusSuccRightSucc n m) in
       y :: mergeBy isLT xs' ys
  where plusSuccRightSucc : (n,m : Nat) -> S (n + m) = n + S m


{- =====================================================================16↑↓17 -}
