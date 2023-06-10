<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<head>
<META NAME="description" CONTENT="Ohad Kammar's Research">
<META NAME="keywords" CONTENT="ohad kammar, ohad, kammar, research, publications, publication, programming language
semantics, PLT semantics, semantics, category, categories, category theory, logic, computational
effects, effect type systems, type and effect systems, types, effects, effect type system, access control, DCC, CDD, Plotkin, Gordon Plotkin, call by push value, CBPV, call-by-push-value, denotational semantics, continuations, delimited continuations, jump with argument">
<TITLE>Ohad's Research - Part III/MPhil Project Suggestions</TITLE>
<link rel="icon" href="favicon.ico" type="image/x-icon" >
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" >
</HEAD>

<h1 id="part-iiimphil-projects-suggestions">Part III/MPhil Projects Suggestions</h1>
<p>I believe in supervising cutting edge research projects I’m also passionate about. While the project is entirely in the responsibility of the student, I believe the student can develop core research skills with close contact, meeting weekly or more often as the project requires. The transition from undergraduate studies to a research project is challenging, so as long as the student is willing to put in the effort, I provide support in terms of guidance, explanations, and reading material.</p>
<p>Below are some suggestions for possible projects, a non-exhaustive list. I am happy to discuss variations of extensions of these projects (or other projects in my research interests) in person. As usual, some projects require further reading on advanced topics, but always with close guidance and supervision.</p>
<h2 id="a-meta-theory-for-effectful-optimisations">A meta-theory for effectful optimisations</h2>
<p>Optimising compilers may employ <a href="http://www.cs.ucla.edu/~palsberg/tba/papers/nielson-nielson-csd99.pdf">type-and-effect systems</a> to justify code transformations involving computational effects, such as memory accesses, I/O interaction, and probabilistic computation. For example, it is incorrect to remove code duplication in a block of code that reads and writes to memory, but if the duplicated code only writes to memory, we may only run it once:</p>
<pre><code>let x = M in                      let x = M in
let y = M in  is equivalent to    let y = x in
N                                 N </code></pre>
<p>There is embarassingly little work on formally justifying these compiler optimisations, as establishing the contextual equivalence of two program phrases using operational semantics is difficult. Denotational semantics are particularly compelling for this task: to validate an optimisation, show both pieces of code have the same denotation.</p>
<p>The starting point in this project is the <a href="http://www.cl.cam.ac.uk/~ok259/publications/kammar-plotkin-algebraic-foundations-for-effect-dependent-optimisations.pdf" title="Ohad Kammar and Gordon D. Plotkin, Algebraic foundations for effect-dependent optimisations, Proceedings of the 39th annual ACM SIGPLAN-SIGACT symposium on Principles of programming languages (New York, NY, USA), POPL ’12, ACM, 2012, pp. 349–360.">observation</a> that these optimisations arise as appropriate algebraic laws underlying the language’s denotational semantics. For example, the validity of the optimisation above is equivalent to a generalised idempotency law, more specifically, generalising the unary idempotency law</p>
<pre><code>f(f(x)) = f(x)</code></pre>
<p>to n-ary terms:</p>
<pre><code>f(f(x11, x12, ..., x1n),        f(x11,
  f(x21, x22, ..., x2n),          x22,
  ...,                      =     ...,
  f(xn1, xn2, ..., xnn))          xnn)</code></pre>
<p>This project aims to establish the meta-theory of effect-dependent source-to-source global compiler optimisations. Such a meta-theory will enable:</p>
<ul>
<li><p>a characterisation of which optimisations have such algebraic descriptions;</p></li>
<li><p>an elegeant unification of many existing and tedious proofs for the semantic characterisation of these optimisations;</p></li>
<li><p>a formulation of practically useful meta-properties of these optimisations; and</p></li>
<li><p>modular computational models for establishing sound and complete decision procedures within optimising compilers.</p></li>
</ul>
<p>This challenging project requires the student to obtain knowledge of categorical semantics of programming languages, the algebraic approach to semantics, and dependently-typed programming.</p>
<p><strong>Pre-requisite knowledge:</strong> <a href="http://www.cl.cam.ac.uk/teaching/1314/DenotSem/">denotational semantics</a>, and <a href="http://www.cl.cam.ac.uk/teaching/1314/L108/">category theory and logic</a>.</p>
<p><strong>Recommended knowledge:</strong> <a href="http://www.cl.cam.ac.uk/teaching/1314/Types">types</a> (for the dependently-typed programming), <a href="http://www.cl.cam.ac.uk/teaching/1314/OptComp/">optimising compilers</a> (for the high-level picture of the application area).</p>
<h2 id="an-algebraic-presentation-of-higher-order-store">An algebraic presentation of higher-order store</h2>
<p><strong>Pre-requisite knowledge:</strong> <a href="http://www.cl.cam.ac.uk/teaching/1314/DenotSem/">denotational semantics</a>, <a href="http://www.cl.cam.ac.uk/teaching/1314/L108/">category theory and logic</a>.</p>