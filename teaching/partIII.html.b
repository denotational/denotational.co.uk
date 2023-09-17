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
<ul>
<li>See the <a href="https://dpmt.inf.ed.ac.uk/msc">Degree Project Management Tool</a> page for this year’s proposals.</li>
</ul>
<p>Please contact me even if only parts of the project sound interesting to you, and perhaps we could find a different project. You’re also encouraged to suggest your own projects!</p>
<h2 id="research-prospects">Research prospects</h2>
<p>The short duration of an MSc dissertation means you will likely not do enough research for a publication in a top-tier venue in my area. Such venues usually require 1-3 years of work, even with experienced researchers. If you are interested in a more extensive Masters-level research degree, consider out <a href="https://www.ed.ac.uk/informatics/postgraduate/research-degrees/mphil">MPhil</a> programme.</p>
<h1 id="past-projects">Past projects</h1>
<p>Below are some of my past project suggestions and how they turned out. Please contact me even if only parts of the project sound interesting to you, and perhaps we could find a different project. You’re also encouraged to suggest your own projects!</p>
<h2 id="dependently-typed-regex-matchers-in-idris">Dependently-typed regex matchers in Idris</h2>
<p>Student: Katarzyna Marek</p>
<h3 id="note">Note</h3>
<p>Katarzyna stayed for another 6 months as a research associate to complete this project into a publication:</p>
<ul>
<li>Kammar, Ohad, and Katarzyna Marek. “Idris TyRE: a dependently typed regex parser.” arXiv preprint arXiv:2305.04480 (2023).</li>
</ul>
<p>and additional follow-up work.</p>
<h2 id="description">Description</h2>
<p>In <em>type-driven development</em> we use advanced type-level programming which help us write more flexible programs. In this project you’ll be using type-driven development to implement regular expression matchers and lexers. By translating different regexes into different types, you can take advantage of the compiler’s runtime and memory allocation routines to implement Thompson’s construction and its analogues. The project can extend depending on your skills and interests: you can verify the correctness of your construction, or you can look into type-driven nested-word automata and lexers.</p>
<ul>
<li><p>Edwin Brady. Type-driven Development with Idris. Manning Publications. 2017.</p></li>
<li><p>Typed parsing and unparsing for untyped regular expression engines (http://dx.doi.org/10.1145/3294032.3294082)</p></li>
<li><p>R. Alur and P. Madhusudan. Adding nesting structure to words. In DLT’06, pages 1–13.</p></li>
</ul>
<p>Difficulty: Very hard</p>
<h3 id="completion-criteria">Completion criteria</h3>
<ul>
<li>Basic</li>
</ul>
<ol type="1">
<li>Type-driven implementation of Thompson’s construction 2a. Verify the construction; or 2b. Implement a typed-regex parser on top of this matcher.</li>
</ol>
<ul>
<li>Extension</li>
</ul>
<ol type="1">
<li>Type-driven implementation of a nested-word regex matcher</li>
<li>Performance evaluation and identification of bottlenecks</li>
</ol>
<h2 id="modular-probabilistic-programming-with-algebraic-effects">Modular probabilistic programming with algebraic effects</h2>
<p>Student: <a href="https://www.cs.ox.ac.uk/people/oliver.goldstein/">Oliver Goldstein</a></p>
<p>Follow-up poster: * Eff-Bayes: ProbProg with built-in effect handlers. Oliver Goldstein, Žiga Lukšič, Matija Pretnar, Daan Leijen, Ohad Kammar, and Adam Ścibior. Poster accepted at the Probabilistic Programming Conference 2020.</p>
<h3 id="abstract">Abstract</h3>
<p>Probabilistic programming languages, which exist in abundance, are languages that allow users to calculate probability distributions implicit in probabilistic programs, by using inference algorithms. Inference algorithms calculate probability distributions implicit in the programs. However, the underlying inference algorithms are not implemented in a modular fashion, though, the algorithms are presented as a composition of other inference components. This discordance between the theory and the practice of Bayesian machine learning, means that reasoning about the correctness of probabilistic programs is more difficult, and composing inference algorithms together in code may not necessarily produce correct compound inference algorithms. In this dissertation, I create a modular probabilistic programming library, already a nice property as its not a standalone language, called Koka Bayes, that is based off of both the modular design of Monad Bayes – a probabilistic programming language developed in Haskell – and its semantic validation. The library is embedded in a recently created programming language, Koka, that supports algebraic effect handlers and expressive effect types – novel programming abstractions that support modular programming. Effects are generalizations of computational side-effects, and it turns out that fundamental operations in probabilistic programming such as probabilistic choice and conditioning are instances of effects.</p>
<h2 id="on-the-expressive-power-of-monadic-reflection-and-effect-handlers">On the expressive power of monadic reflection and effect handlers</h2>
<p>Student: <a href="https://yforster.github.io/">Yannick Forster</a></p>
<p>Yannick’s <a href="https://ps.uni-saarland.de/~forster/master.php">dissertation page</a>.</p>
<p>Resulted, after additional research, in these publications:</p>
<ul>
<li><p>Yannick Forster, Ohad Kammar, Sam Lindley and Matija Pretnar, 2019. <a href="https://doi.org/10.1017/S0956796819000121">On the expressive power of user-defined effects: Effect handlers, monadic reflection, delimited control, Journal of Functional Programming</a>, volume 29, p. e15.</p></li>
<li><p>Yannick Forster, Ohad Kammar, Sam Lindley and Matija Pretnar, 2017. <a href="https://doi.org/10.1145/3110257">On the expressive power of user-defined effects: effect handlers, monadic reflection, delimited control</a>, Proceedings of the ACM on Programming Languages, volume 1, issue ICFP, pp. 13:1–13:29.</p></li>
</ul>
<h2 id="a-meta-theory-for-effectful-optimisations">A meta-theory for effectful optimisations</h2>
<p>Student: Jan Polášek</p>
<p>Optimising compilers may employ <a href="http://www.cs.ucla.edu/~palsberg/tba/papers/nielson-nielson-csd99.pdf">type-and-effect systems</a> to justify code transformations involving computational effects, such as memory accesses, I/O interaction, and probabilistic computation. For example, it is incorrect to remove code duplication in a block of code that reads and writes to memory, but if the duplicated code only writes to memory, we may only run it once:</p>
<pre><code>let x = M in                      let x = M in
let y = M in  is equivalent to    let y = x in
N                                 N</code></pre>
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