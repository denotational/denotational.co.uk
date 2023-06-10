{- =========================================================================↓1 -}
--
--                   Frex: indexing-modulo-equations
--                                   with
--                             free extensions
--
--
--                    Guillaume Allais, Edwin Brady,
--                      Ohad Kammar, Jeremy Yallop
--                      ^^^^^^^^^^^
--                <ohad.kammar@ed.ac.uk>
--
--
--
--         Seminar za temelje matematike in teoretično računalništvo
--                  Fakulteta za matematiko in fiziko
--                          Univerza v Ljubljani
--                            October 15, 2020
--
--
--
--
-- Supported by:
--  The Royal Society, Alan Turing Institute, 
--  Facebook Research Award, EPSRC
--
{- =======================================================================1↑↓2 -}
-- Indexing with computations
-- and why it's a bad idea

--Z_2, bits with arithmetic modulo 2
mod_2 : Nat -> Fin 2
mod_2        Z  = 0
mod_2 (    S Z) = 1
mod_2 (S $ S n) = mod_2 n

-- Overload (+) and (*)
Num (Fin 2) where
  x + y = mod_2 $ (finToNat x) + (finToNat y)
  x * y = mod_2 $ (finToNat x) * (finToNat y)
  fromInteger x = mod_2 (Prelude.fromInteger x) 


Example1a : Fin 2
Example1a = 1 + 1*0 + 1 + 1

-- Main difference
Example1b : (Nat      , Fin 2   )
Example1b = (0 + ?nat , 0 + ?bit)


{- =======================================================================2↑↓3 -}
-- Indexing with computations
-- and why it's a bad idea

-- Alternating types
Choose : (even,odd : Type) -> Fin 2 -> Type
Choose even odd 0 = even
Choose even odd 1 = odd

-- Alternating list
--
data Alt : (even,odd : Type) 
        -> (start, parity : Fin 2) -> Type where
  Nil  : Alt even odd start 0
  (::) : (x  : Choose even odd start)
      -> (xs : Alt even odd (1 + start)      parity )
      ->       Alt even odd      start  (1 + parity)


Example2 : Alt Bool String 0 0
Example2 = [True, "PLUG", False, "Idris2"]
-- 




{- =======================================================================3↑↓4 -}
-- Indexing with computations
-- and why it's a bad idea
{-
(++) : Alt even odd  start          left
    -> Alt even odd (start + left)         right
    -> Alt even odd  start         (left + right)

Example3 : Alt Bool String 0 0
Example3 = [True, "Shameless"] ++ Example2 
-}

-- We want to define

[]        ++ ys = ys
(x :: xs) ++ ys = x :: (xs ++ ys)  










{- =======================================================================4↑↓5 -}
-- Indexing with computations
-- and why it's a bad idea

-- (Fin 2, 0, (+)) a commutative monoid 
Lft_neutral : (x     : Fin 2) -> 0 + x = x
Rgt_neutral : (x     : Fin 2) -> x + 0 = x
Associative : (x,y,z : Fin 2) -> (x + y) + z = x + (y + z)  
Commutative : (x, y : Fin 2)  -> x + y = y + x
 -- We'll also need
Lemma : (x,y : Fin 2) -> x + (1 + y) = (1 + x) + y

(++) {right} {start} [] ys
  = rewrite sym (Rgt_neutral start) in
    rewrite      Lft_neutral right  in
    ys

(++) {even=e} {odd=o} {start} {right}
     ((::) {parity} x xs) ys = 
  let zs : Alt e o ((1 + start) + parity) right
      zs = rewrite sym (Lemma start parity)      in ys
      ws : Alt e o start (1 + (parity + right))
      ws =                                          x :: (xs ++ zs)
      vs : Alt e o start ((1 + parity) + right)
      vs = rewrite Associative 1 parity right    in ws
  in vs 
{- =======================================================================5↑↓6 -}


-- What happened?



-- 1. Computations with open terms get stuck
--    (0 + x  ~>  mod_2 (finToNat x) )
--                       ↑  
-- 2. Stuck computations *  unlike open values (S n) 
--    jam unification

-- 
-- 3. Some equations more important
--    in theory, not practice

-- 4. Syntactic and reasoning noise ('green slime')







{- =======================================================================6↑↓7 -}

-- Best practice: 
--                      Avoid the green slime! 
--                      Index by values!

--   * calculate inductive representations of the quotient

--   * put the variables in the right place:
--
--                 Vect (1 + n) a     vs      Vect (n + 1) a





-- But... can't index perfectly:

-- * Prototyping and exploration
--
-- * Conflicting indexing requirements





{- =======================================================================7↑↓8 -}
-- Mitigation 


--                     this work (in progress)
--                    ------combines-------
--                  ╱                      ╲
--                 ╱                        ╲
--          Fording                          Frex 
--          [McBride'96,'99]                 [Yallop, von Glehn, Kammar '18]
-- 
--        improved                           interface + spec
--    2-way equational                       for algebraic solvers
-- dialogue with type-checker              
--                                           frexlets: pre-packaged solvers











{- =======================================================================8↑↓9 -}
-- Talk structure



--                 * Fording
                
--                 * Frex

--                 * Break
                                
--                 * Evaluation

--                 * Discussion














{- ======================================================================9↑↓10 -}
-- Fording [McBride'99] in Idris2


data Alt : (even,odd : Type) 
        -> (start, parity : Fin 2) -> Type where
        
  Nil  : Alt even odd start 0
  
  (::) : (x  : Choose even odd start)
      -> (xs : Alt    even odd start' parity)         --'any color
      -> {auto 0 ford_start  : start'  = 1 + start}   --  so long as it's black'
      --       ↑                                                    -- Henry Ford
      --       quantity annotation: runtime irrelevant 
      -> {auto 0 ford_parity : parity' = 1 + parity}               
      --  ↑
      --  automatic proof search
      -> Alt even odd start parity'


-- `auto` implicits: type-checker will try to insert Refl automatically

-- `0` quantity: fording argument has no runtime penalty


{- =====================================================================10↑↓11 -}
-- No regression

--                 Fording   =>   type-checker works less
--
--                   Goal: programmer works less too


-- Want:
-- 
--    pre-packaged solver library

--    uniform interface

--    extensible

--    Desirable: completeness, generality


--                ==> Frex


-- Small print: There's no magic. Frex only automates the tedious rearranging
--              of terms that we hate doing by rewriting, and love making our
--              students do. We still need other kinds of equational proofs.

{- =====================================================================11↑↓12 -}
-- Commutative monoids frexlet

-- Fin 2 is a commutative monoid:
Fin2_CMonoid : Model CMonoid_Th
Fin2_CMonoid = Check CMonoid_structure Valid
  where    
    Ops : Algebra_Structure CMonoid_Sig (Fin 2)
    Ops  op env with (CMonoids.Axioms.Which_op op)
     Ops _ []    | Zero = FZ
     Ops _ [x,y] | Plus = x + y
    
    CMonoid_structure : Algebra CMonoid_Sig
    CMonoid_structure = The (Fin 2) Ops

    Valid : Validates CMonoid_Th CMonoid_structure
    Valid  ax env with (CMonoids.Axioms.Which_ax ax) 
     Valid _  [x, y]    |     Commutative = Commutative x y
     Valid _  [x]       | Mon Lft_neutral = Lft_neutral x
     Valid _  [x]       | Mon Rgt_neutral = Rgt_neutral x
     Valid _  [x, y, z] | Mon Associative = Associative x y z

-- Use the built-in commutative monoid frex
frexFin2 : {n : Nat} -> Free_extender CMonoid_Th Fin2_CMonoid (Fin n)
frexFin2 {n} = (CMonoids.Frex.Frex Fin2_CMonoid n)

{- =====================================================================12↑↓13 -}
-- Frex in action

cushion : Alt even odd start parity 
      -> {auto 0 ford_start  : start'  = start}
      -> {auto 0 ford_parity : parity' = parity}
      -> Alt even odd start' parity'
cushion xs 
  {ford_start = Refl} {ford_parity = Refl} = xs

(++) : Alt even odd start parity_left
    -> Alt even odd start' parity_right 
    -> {auto 0 ford_start  : start'  = start + parity_left}
    -> {auto 0 ford_parity : parity' = parity_left + parity_right}
    -> Alt even odd start parity'

-- base case
(++) {parity_right} {start} [] ys {ford_start = Refl} {ford_parity = Refl} = 
  cushion ys
    {ford_start  = Frexify frexFin2 [start] 
                   (var 0 =-=                 -- Rgt_neutral
                    var 0 :+: sta 0 )}
    {ford_parity = Frexify frexFin2 [parity_right] 
                   (sta 0 :+: var 0           -- Lft_neutral
                          =-= var 0 )}

{- =====================================================================13↑↓14 -}


-- Inductive step
(++)                             {start}               {parity_right} 
     ((::)                                             {parity} 
       x xs                      {ford_start = Refl}   {ford_parity = Refl}
     ) 
     ys                          {ford_start = Refl}   {ford_parity = Refl}
  = (::) x ((++) xs ys 
                 {ford_start = Frexify frexFin2
                       [start, parity] 
                       (var 0 :+: (sta 1 :+: var 1)   
                          =-=
                       (sta 1 :+: var 0) :+: var 1)
                       {prf = Refl } })
                       
         {ford_parity = Frexify frexFin2
                         [parity, parity_right] $
                         (sta 1 :+: var 0) :+: var 1 
                               =-= 
                         sta 1 :+: (var 0 :+: var 1)}




{- =====================================================================14↑↓15 -}
-- Under the hood: CMonoids

             (FS FZ, [1, 1]) = (FS FZ, [1, 1])     =: ⟦1 + 1·x + 1·y⟧

--                 proof-by-reflection / normal form of

                        x + (1 + y) = (1 + x) + y


-- Generally:

-- Given commutative monoid A = (U A, 0, +)
--  -------------------------------------------------------------------------
-- |_free extension_ (frex)         A[Fin n] = ((U A, Vect n Nat), O, .+.)  |
-- -------------------------------------------------------------------------

-- Idea:   
            (a, [k₁, ..., kₙ])    =: ⟦a + k₁·x₁ + ... + kₙ·xₙ⟧
-- commutative monoid structure:    
       O := (0, replicate n 0)         ⟦0   + 0·x₁ + ... + 0·xₙ⟧

      (a  , [k₁   , ..., kₙ   ])       ⟦a   + k₁·x₁      + ... + kₙ·xₙ    ⟧
   .+.(  b, [   ℓ₁, ...,    ℓₙ])    .+.⟦b   +     ℓ₁·x₁  + ... +    ℓₙ·xₙ ⟧
    = (a+b, [k₁+ℓ₁, ..., kₙ+ℓₙ])    =  ⟦a+b + (k₁+ℓ₁)·x₁ + ... +(kₙ+ℓₙ)·xₙ⟧
{- =====================================================================15↑↓16 -}
-- General situation

   A = (U a, structure) : Model T      (T = (signature, axioms) : Presentation)
 
   X : Type
--
 Frex:    A[X] = (U A[X], structure) : Model T    

          sta : A ->ₕ A[X]         T-homomorphism

          var : X -> U (A[X])      function
-- 
 that are universal:  given            B : Model  T
                                       h : A ->ₕ  B
                                     env : X -> U B

 ∃! [h,env] : A[x] --o B:              sta                      var
                                     A -->ₕ A[X]        U A[X] <-- X
                                   h │ =   ╱  [h,env]       ▏     ╱
                                     │    ╱               ▏ =  ╱ env 
                                     ↓ₕ ↙ₕ               ↓  ↙  
                                     B                    U B
 NB: A[X] = A ⨿ FX, 
--     coproduct the algebra with the free algebra
{- =====================================================================16↑↓17 -}
-- Example: commutative monoids

                                 sta
                      a : U A   |--->ₕ (a, [0, 0, 0])    
                        ╲                  │
                          ↘ₕ               ↓ₕ            
                          h(a) = h(a) + 0·x + 0·y + 0·z


                                    var
                   (0, [0, 1, 0])  <----| FS FZ        =: ⟦y⟧     
                        │               ╱      : Fin 3     : ⟦{x,y,z}⟧
                        ↓             ↙ env   
                        1 · y  =  y                          


 In general:            (a, [k, ℓ, m])
                            _
                            │ [h,env]
                            ↓
                       h(a) + k·x + ℓ·y + m·z   where x = env 0
                                                      y = env 1
                                                      z = env 2

{- =====================================================================17↑↓18 -}
-- Why does this work?

-- Theorem (well-known).     
--
--        A[X]    isomorphic     Term_signature (Either UA X) / axioms + eval
--
-- where eval is given by:
--
        ------------------------------------ (f : n) in signature
        f(Left a₁, ..., Left aₙ) =
                      Left( f (a₁, ..., aₙ))
--
-- ===> A[X]   normalisation-by-evaluation   algorithm for  A-modulo-axioms

                Frexify  frexA [a,b,c]  LHS =-= RHS {prf}

                           given by:
 (FS FZ, [1,1])                                             (FS FZ, [1,1])
      =      e.g.                  prf                    e.g.    =
   ⟦(x+1)+y⟧ <===      A[X]⟦LHS⟧   ===  A[X]⟦RHS⟧          ===> ⟦(1+x)+y⟧
      _                    _                 _                    _
      │                    │    [id, env]    │                    │
      ↓                     ↓                  ↓                     ↓
    (a+1)+b         A⟦LHS⟧[a,b,c] === A⟦RHS⟧[a,b,c]             (1+a)+b

{- =====================================================================18↑↓19 -}
-- Prospects

-- Works for a general notion of 'theory':


-- * Already implemented:   CMonoids (fully) , CSemiring (partially, in progress)


-- * Previous work (non-formal): monoids, distributive lattices,
--                               (abelian) groups, F-algebras


-- * Ongoing work (non-formal): multi-sorted algebras
--                           e.g.: booleans/conditions + a base type ~> BDDs


-- * Conjectured: parameterised algebraic theories








{- =====================================================================19↑↓20 -}
-- Evaluation (wip)


-- 1. Idris's Integer library         (in progress, not today)
--    - Integer (BigNum) primitives
--    - No reduction in open terms:

Example4 : Integer
Example4 = 3 + (2 + ?int)

--    - Can substitute with a fully-formalised Integer library
--    - Large gain: simpler frexlets    build    complex frexlets





-- 2. Indexing binary number representations by their values 
--                                     [Brady-McKinna-Hammond'07]






{- =====================================================================20↑↓21 -}
-- Nat-indexed Binary numbers                       [Brady-McKinna-Hammond'07]
namespace Bin

-- fixed-length bit-sequence
  public export
  data Bit : Nat -> Type where
  O : Bin.Bit 0
  I : Bin.Bit 1

  public export
  data Number : Nat -> Nat -> Type where
    Nil  : Number 0 0
    (::) : Bin.Bit b -> Bin.Number width val 
           -> {auto 0 valueFord : val' = b + val + val}
           -> Number (1 + width)  val'



  public export
  Example5 : (val : Nat ** Bin.Number 6 val)
  Example5 = (_ ** [O, I, O, I, O, I])



{- =====================================================================21↑↓22 -}
-- Nat-indexed Binary numbers                       [Brady-McKinna-Hammond'07]


namespace Bin

  
  -- n-bit + carry
  public export
  data NumCarry : Nat -> Nat -> Type where
    Carrying : (num : Bin.Number width val) -> (carry : Bin.Bit c) 
         -> {auto 0 valueFord : val' = val + (2 `power` width) * c}
         -> NumCarry width val'



commutativeAddNumber :  (l : LE.Number w lft) 
                     -> (r : LE.Number w rgt) 
                     -> (carry : Binary.Bit c)
                     -> addNumber l r carry ~=~ 
                     addNumber r l carry
commutativeAddNumber l r carry = keep $
  Binary.numCarryUniqueForded (addNumber l r carry)
                              (addNumber r l carry)
                  {ford = cong (+c) (plusCommutative lft rgt)} -- or frexify

              
                                          
{- =====================================================================22↑↓23 -}
-- The Good

-- Standard (mathematical) equational reasoning

 {valueFord = 
         Calc $
         |~ (((b_a + val_a) + val_a) + ((b_b + val_b) + val_b)) + c
         -- rearrange terms so we can use `ford` on left summand
         ~~ ((b_a + b_b) + c) + (val_a + val_a + val_b + val_b)
  ...(Frexify frexNat [b_a, b_b, c, val_a, val_b]
     let b_a   = var 0
         b_b   = var 1
         c     = var 2
         val_a = var 3
         val_b = var 4
     in (((b_a :+: val_a) :+: val_a) :+: ((b_b :+: val_b) :+: val_b)) :+: c
         =-=
         ((b_a :+: b_b) :+: c) :+: (((val_a :+: val_a) :+: val_b) :+: val_b)
                 )
         ~~ ((b_s + b_s) + c_s) + (val_a + val_a + val_b + val_b)
   ...(cong (+ (val_a + val_a + val_b + val_b))
            ford)



{- =====================================================================23↑↓24 -}
-- The Bad
-- Types can get _very_ dependent:





...(cong5 (\ c         : Nat 
           , val       : Nat 
           , num       : LE.Number width val
           , carry     : Bit c
           , valueFord : (val' = val + (2 `power` width) * c) =>
                         num `Carrying` carry)
            c_x_eq_c_y
          val_x_eq_val_y
          num_x_eq_num_y
        carry_x_eq_carry_y
        (heterogenousUIP valueFord_x valueFord_y))






{- =====================================================================24↑↓25 -}
-- The Bad
-- Types get _very_ dependent:
   where
      heterogenousUIP : (eq1 : x ~=~ y) -> (eq2 : x ~=~ z) -> eq1 = eq2
      heterogenousUIP Refl Refl = Refl
    
      cong5 : {0 a1 : Type}       
        -> {0 a2 : a1 -> Type}
        -> {0 a3 : (x1 : a1) -> (x2 : a2 x1) -> Type}
        -> {0 a4 : (x1 : a1) -> (x2 : a2 x1) -> (x3 : a3 x1 x2) -> Type}
        -> {0 a5 : (x1 : a1) -> (x2 : a2 x1) -> (x3 : a3 x1 x2) 
                             -> (x4 : a4 x1 x2 x3) -> Type}
        -> {0 p : (z1 : a1) -> (z2 : a2 z1) -> (z3 : a3 z1 z2) 
               -> (z4 : a4 z1 z2 z3) -> (z5 : a5 z1 z2 z3 z4) -> Type}
        -> (f : (z1 : a1) -> (z2 : a2 z1) -> (z3 : a3 z1 z2) 
             -> (z4 : a4 z1 z2 z3) -> (z5 : a5 z1 z2 z3 z4) -> p z1 z2 z3 z4 z5)
        -> {x1,y1 : a1}                 -> x1 ~=~ y1
        -> {x2 : a2 x1} -> {y2 : a2 y1} -> x2 ~=~ y2
        -> {x3 : a3 x1 x2} -> {y3 : a3 y1 y2} -> x3 ~=~ y3
        -> {x4 : a4 x1 x2 x3} -> {y4 : a4 y1 y2 y3} -> x4 ~=~ y4
        -> {x5 : a5 x1 x2 x3 x4} -> {y5 : a5 y1 y2 y3 y4} -> x5 ~=~ y5
        -> f x1 x2 x3 x4 x5 ~=~ f y1 y2 y3 y4 y5
      cong5 _ Refl Refl Refl Refl Refl = Refl
      
-- Mitigation: n-ary metaprogramming [Allais'19]
{- =====================================================================25↑↓26 -}
-- The Ugly (1):  Fording is noisy:



-- We want but can't have:
numCarryUnique 
  (num_x `Carrying` car_x) 
  (num_y `Carrying` car_y) = ...

-- We have:
numCarryUnique 
  (Carrying {c = c_x} {val = v_x} {val'       } num_x car_x {valueFord = ford_x}) 
  (Carrying {c = c_y} {val = v_y} {val' = val'} num_y car_y {valueFord = ford_y}) 
  = ...


-- We could have:
numCarryUnique 
  (num_x `Carrying` car_x 
                   | {c = c_x} {val = v_x} {val'       } {valueFord = ford_x}) 
  (num_y `Carrying` car_y 
                   | {c = c_y} {val = v_y} {val' = val'} {valueFord = ford_y}) 
  = ...


{- =====================================================================26↑↓27 -}
-- The Ugly (2):  pattern-matching with `auto`-implicits 


BEtoLE ((::) bit bits {valueFord = Refl}) = ..


-- Mitigation (?):

-- The 2 functionalities of data declarations            [cf. Johann-Ghani'08,   
--                                                            Johann-Polonsky'19]
-- 1. define inductive types, indices may change:
data GRose : (f : Type -> Type) -> (a : Type) -> Type where
  Node : {f : Type -> Type} -> a -> f (GRose f a) -> GRose f a

-- 2. Extend the enumerated indices to all indices:
data Eq : {a : Type} -> (x : a) -> {b : Type} -> (y : b) -> Type where
   refl : {a : Type} -> (x : a) -> Eq x x

     (a : Type ** x : a)  -----w.f.------> Type
                       │                     ↗
  \(a ** x) =>         │         ⇓ p.m.     ╱ 
    (a ** x ** a ** x) │                   ╱  Eq
                       ↓                  ╱
       (a : Type ** x : a ** b : Type ** y : b)                                
{- =====================================================================27↑↓28 -}
-- The Ugly (3):     Type-with-structure
-- Can define:
interface CMonoid a where
  O   : a
  (.+.) : a -> a -> a

interface CSemiring a where
  Z : a
  I : a
  (:+:) : a -> a -> a
  (:*:) : a -> a -> a
  
-- But not generic interfaces to algebras.

-- Agda has fine-control over record/module renaming
--
     where open Monoid M₁ renaming (_+_ to _+₁_; O to O₁)
           open Monoid M₁ renaming (_+_ to _+₂_; O to O₂)
--
-- but...  repetitive and tedious

-- Type-classes/interfaces struggle with non-coherent instances:
[AdditiveNat]       CMonoid Nat where ...
[MultiplicativeNat] CMonoid Nat where ...
[TropicalNatMax]    CMonoid Nat where ...
-- newtype + smart-constructors  +  reasoning  is difficult
{- =====================================================================28↑↓29 -}
-- The Ugly (4): Frexifying is still tedious



Frexify frexNat [b_a, b_b, c, val_a, val_b]
     let b_a   = var 0
         b_b   = var 1
         c     = var 2
         val_a = var 3
         val_b = var 4
     in (((b_a :+: val_a) :+: val_a) :+: ((b_b :+: val_b) :+: val_b)) :+: c
         =-=
         ((b_a :+: b_b) :+: c) :+: (((val_a :+: val_a) :+: val_b) :+: val_b)



-- No silver bullet.    Try bespoke solutions using reflection

-- Would struggle generally:
               mod_2 (finToNat start)   <~ 0 + start

{- =====================================================================29↑↓30 -}
-- Matching and Unification

Define:   X --A->   Y
          ============
          X ----> A[Y]

 Decision problem is expressible in this vocabulary:

 Matching:                           Unification

   1                               1 --- A --> Y
  │   ╲                            │           │
  │    ╲                           │           │
  A     A                          A           A mgu_Y
  │      ╲                         │        __ │
  ↓       ↘                        ↓       │∃? ↓
  X --A--> Y                       X --- A --> Z
 ∃? match                             mgu_X
--
-- Are there any useful solutions in common instances?
-- E.g., cancellative algebras when X = 1



{- =====================================================================30↑↓31 -}
-- Summary

-- Goal:     enable exploratory dependently-typed programming
--                             by
--             mitigating non-free / inductive indices



-- Two core ingredients:
--          Fording                                   Frex     
--       [McBride'96,'99]                  sound-and-complete, extensible 
--     improved type-checker                 algebraic solver library
--        communication


-- Current support: CMonoid (fully), CSemiring (partial/ongoing)
-- 

-- Use-cases: Integer library , Nat-index bit-vectors


-- The Good, the Bad, and the Ugly: many challenges ahead!





{- =====================================================================31↑↓32 -}
-- References

-- "Constructing Correct Circuits: Verification of Functional Aspects
--  of Hardware Specifications with Dependent Types", by Edwin
--  C. Brady, James McKinna, Kevin Hammond, TFP2007.

-- "Partially-static data as free extension of algebras", J. Yallop,
-- T. von Glehn, and O. Kammar, ICFP'18.

-- "Inverting Inductively Defined Relations in LEGO", C. McBride,
-- TYPES 1996.

-- "Dependently Typed Functional Programs and their Proofs",
-- C. McBride, PhD thesis, 1999.
 
-- "Generic level polymorphic n-ary functions", G. Allais, TyDe@ICFP'19.












{- =======================================================================32↑ -}
