Part II Projects Suggestions
============================

I believe in supervising projects I'm also passionate about, usually
involving concepts that tie to advanced, cutting-edge research. The
projects below mix programming language and computer science theory
with some hacking. In my ideal project, theoretical concepts and
developments would yield code that is clean, simple, and
straightforward.  While the project is entirely your responsibility, I
believe you will best develop with close contact, meeting
weekly during term or more often as the project requires. Great
projects should be challenging, so as long as you are willing
to put in the effort, I provide support in terms of guidance, discussion,
explanations, and reading material.

Below are some project suggestions. Feel free to contact me even if
only parts of the project sound interesting to you, and perhaps we
could find a different project. You're also encouraged to suggest your
own projects!


Handling Transparent Code Migration
-----------------------------------

The details of implementing distributed protocols, algorithms and
programs can be quite hairy, as we need to send code and data between
end-points. _Mobile computation_ is an approach to distributed
programming where a program works by migrating from one host to
another. The migration is called _transparent_ if the execution state
of the program is preserved before and after the
migration. Concretely, we have a "go" statement that lets us switch to
a different machine and continue execution there. For example:

```
for host in network
  go host
  update_dns_table("CL", 128.232.0.20)
```

Two [crucial
components](http://www.cl.cam.ac.uk/~pes20/acute/paper3.pdf) of
transparent code migration are value marshalling (sending values to a
different end-point), and thunkification (reifying computations into
marshallable values).

The goal of this project is to utilise a couple of programming
language techniques, [type-directed partial
evaluation](http://cs.au.dk/~danvy/tdpe-ln.pdf) and [effect
handlers](http://homepages.inf.ed.ac.uk/slindley/papers/handlers.pdf),
to provide a lightweight transparent code-migration library. Then use
the language's existing libraries and features to demonstrate a series
of nifty distributed programs, or a big single distributed
application. One such example would be to extend Kiselyov's [file
server](http://okmij.org/ftp/continuations/zipper.html#zipper-fs) to
a distributed file system.

Little work has been done on extending an existing runtime systems
easily, and this projects builds on [Sumii's
work](http://www.kb.ecei.tohoku.ac.jp/~sumii/) this project builds
which uses [delimited
continuations](http://dl.acm.org/citation.cfm?id=91622). One reason we
might want to write migrating code is to have some computational
effects (state changes, exceptions, I/O) at different hosts, which the
Sumii's approach doesn't deal with, but effect handlers are
well-suited for.

Your profile: eagerness to learn advanced functional programming tools
and techniques (e.g., [Haskell](http://www.haskell.org/), [monads](
http://homepages.inf.ed.ac.uk/wadler/papers/marktoberdorf/baastad.pdf),
delimited continuations, effect handlers,
[type-classes](http://dl.acm.org/citation.cfm?id=75283), [zippers](http://www.st.cs.uni-sb.de/edu/seminare/2005/advanced-fp/docs/huet-zipper.pdf)), and acquire
new programming abstractions and use them in exciting ways.

Related courses that you have taken or will take this year:
[semantics](http://www.cl.cam.ac.uk/teaching/1314/Semantics/),
[types](http://www.cl.cam.ac.uk/teaching/1415/Types/), [concepts in
programming
languages](http://www.cl.cam.ac.uk/teaching/1314/ConceptsPL/), and
[concurrent and distributed
systems](http://www.cl.cam.ac.uk/teaching/1314/part1b.html).


Past projects
=============

These are some previously advertised projects and how they ended up.

Graphical and Polynomial Combinations of Algebraic Theories for Semantics
-------------------------------------------------------------------------

**Outcome:** This project attracted some attention from prospective
 students, I fleshed out a more concrete outline, which made me
 realise this project can be even more fun than I expected. As no
 student ended up choosing this project, I decided to do it myself. I
 will be presenting the
 [webtool](http://www.cl.cam.ac.uk/~ok259/graphtool) I produced at the
 upcoming [3rd ACM SIGPLAN workshop on higher-order porgramming with
 effects](https://www.mpi-sws.org/~neelk/hope2014/), co-located with
 the [19th ACM SIGPLAN international conference on functional
 programming](http://icfpconference.org/icfp2014/).

(Based on [pages 34-38](http://homepages.inf.ed.ac.uk/gdp/publications/Comb_Effects_Jour.pdf#page=34) of Hyland, Plotkin and Power's [Combining Effects: Sum and Tensor](http://homepages.inf.ed.ac.uk/gdp/publications/Comb_Effects_Jour.pdf).)

Defining the meaning of programming languages using _denotational
semantics_ is particularly useful for optimising compiler design. When
constructing denotational semantics for languages with computational
effects (such as state, exceptions, I/O, and non-determinism) two
algebraic operations emerge as useful: the sum of two theories and
their tensor. These operators lead to a description of algebraic
semantics as polynomials in theories. However, choosing the exact
order in which to perform these two operations on the theories at hand
is non-trivial. Arranging the data as a graph leads to a more
intuitive description: each semantic theory corresponds to a vertex,
and two vertices are connected iff the corresponding theories should
commute. The graphical notation is strictly _more_ expressive than the
polynomial notation. _Linear_ polynomials enable an extraction of the
monadic semantics using monad transformers, which are already usable
by functional programmers.

The goal of this challenging project is to provide tools for investigating
algebraic semantics. In particular, studying and implementing Hyland
et al.'s various algorithms:

* deciding whether a given graph description has a corresponding
polynomial description and extracting this polynomial; and
* deciding whether a polynomial is linear and extracting the monad
  transformer stack corresponding to a linear polynomial.

For a successful project, the student would need to understand the
algebraic properties of these polynomials, their connection with the
graphical notation, and the various algorithms involved. The student
would also need to implement graph algorithms and data structures for
syntax.

_(8 October 2013: Check this page later for additional project suggestions...)_
