Part III/MPhil Projects Suggestions
===================================

I believe in supervising cutting edge research projects I'm also
passionate about. While the project is entirely in the responsibility
of the student, I believe the student can develop core research skills
with close contact, meeting weekly or more often as the project
requires. The transition from undergraduate studies to a research
project is challenging, so as long as the student is willing to put in
the effort, I provide support in terms of guidance, explanations, and
reading material.

Below are some suggestions for possible projects, a non-exhaustive
list. I am happy to discuss variations of extensions of these projects
(or other projects in my research interests) in person. As usual, some
projects require further reading on advanced topics, but always with
close guidance and supervision.

A meta-theory for effectful optimisations
------------------------------------------

Optimising compilers may employ [type-and-effect
systems](http://www.cs.ucla.edu/~palsberg/tba/papers/nielson-nielson-csd99.pdf)
to justify code transformations involving computational effects, such
as memory accesses, I/O interaction, and probabilistic
computation. For example, it is incorrect to remove code duplication
in a block of code that reads and writes to memory, but if the
duplicated code only writes to memory, we may only run it once:

    let x = M in                      let x = M in
    let y = M in  is equivalent to    let y = x in
    N                                 N 

There is embarassingly little work on formally justifying these
compiler optimisations, as establishing the contextual equivalence of
two program phrases using operational semantics is
difficult. Denotational semantics are particularly compelling for this
task: to validate an optimisation, show both pieces of code have the
same denotation.  

The starting point in this project is the [observation][KP'12] that
these optimisations arise as appropriate algebraic laws underlying the
language's denotational semantics.  For example, the validity of the
optimisation above is equivalent to a generalised idempotency law, 
more specifically, generalising the unary idempotency law

    f(f(x)) = f(x)

to n-ary terms:

    f(f(x11, x12, ..., x1n),        f(x11,
      f(x21, x22, ..., x2n),          x22,
      ...,                      =     ...,
      f(xn1, xn2, ..., xnn))          xnn)

     
This project aims to establish the meta-theory of effect-dependent
source-to-source global compiler optimisations.  Such a meta-theory
will enable:

 * a characterisation of which optimisations have such algebraic
   descriptions;

 * an elegeant unification of many existing and tedious proofs for the
   semantic characterisation of these optimisations;

 * a formulation of practically useful meta-properties of these
   optimisations; and

 * modular computational models for establishing sound and complete
   decision procedures within optimising compilers.


This challenging project requires the student to obtain knowledge of
categorical semantics of programming languages, the algebraic approach
to semantics, and dependently-typed programming.

__Pre-requisite knowledge:__ [denotational
semantics](http://www.cl.cam.ac.uk/teaching/1314/DenotSem/), and
[category theory and
logic](http://www.cl.cam.ac.uk/teaching/1314/L108/).

__Recommended knowledge:__
[types](http://www.cl.cam.ac.uk/teaching/1314/Types) (for the
dependently-typed programming), [optimising
compilers](http://www.cl.cam.ac.uk/teaching/1314/OptComp/) (for the
high-level picture of the application area).




  [KP'12]: http://www.cl.cam.ac.uk/~ok259/publications/kammar-plotkin-algebraic-foundations-for-effect-dependent-optimisations.pdf "Ohad Kammar and Gordon D. Plotkin, Algebraic foundations for
      effect-dependent
      optimisations,
      Proceedings of the 39th annual ACM SIGPLAN-SIGACT symposium on
      Principles of programming languages (New York, NY, USA), POPL
      ’12, ACM, 2012, pp. 349–360."


An algebraic presentation of higher-order store
-----------------------------------------------

__Pre-requisite knowledge:__ [denotational
semantics](http://www.cl.cam.ac.uk/teaching/1314/DenotSem/), [category
theory and logic](http://www.cl.cam.ac.uk/teaching/1314/L108/).

