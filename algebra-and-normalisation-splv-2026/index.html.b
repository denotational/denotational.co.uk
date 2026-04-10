<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<head>
<META NAME="description" CONTENT="Ohad Kammar's Research">
<META NAME="keywords" CONTENT="ohad kammar, ohad, kammar, research, publications, publication, programming language
semantics, PLT semantics, semantics, category, categories, category theory, logic, computational
effects, effect type systems, type and effect systems, types, effects, effect type system, access control, DCC, CDD, Plotkin, Gordon Plotkin, call by push value, CBPV, call-by-push-value, denotational semantics, continuations, delimited continuations, jump with argument">
<TITLE>Ohad's Research - SPLV 2026: Algebra and Normalisation</TITLE>
<link rel="icon" href="favicon.ico" type="image/x-icon" >
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" >
</HEAD>

<h1>
Algebra and Normalisation
</h1>
<h3>
<a href="https://spli.scot/splv/2026-glasgow/">Scottish Programming
Languages and Verification Summer School</a> Contributed Course
</h3>
<h4>
<a href="http://www.denotational.co.uk">Ohad Kammar</a> 3-7 August 2026
</h4>
<p>Normalisation concerns specifying a representative in each
equivalence class. It comes up whenever we want to guarantee robustness
up-to the equivalence relation. For example, a normalising optimising
compiler will produce the same object code when you refactor your source
code using the equivalence it normalises by. Advanced type-checkers may
accept or reject programs by normalising fragments of their types.
Modern partial evaluators take incorporate equational laws before
extracting a residual program. The hallmark of modern algebra is
representation theorems: characterising a structure such as the set of
polynomials as the universal structure among a class of structures of
interest.</p>
<p>In this course, we will explore the relationship between
normalisation and modern algebra. We will start with algebraic
expressions and universal algebra, and relate them to normalisation and
partial evaluation using multi-sorted equational logic. In the second
part of the course, we will turn to normalisation of open-programs
through the more advanced second-order algebraic structures.</p>
<h3>
Course materials
</h3>
<h4>
Lectures
</h4>
<p>All <a
href="algebra-and-normalisation-splv-2026/algebra-and-normalisation-splv2026.pdf">lectures</a>.</p>
<p>Planned structure:</p>
<ol type="1">
<li>Lecture 1</li>
</ol>
<ul>
<li>Motivation</li>
<li>Normalising monoids</li>
<li>Signatures and algebras</li>
<li>Terms and equations</li>
<li>Evaluation</li>
</ul>
<ol start="2" type="1">
<li>Lecture 2</li>
</ol>
<ul>
<li></li>
</ul>
Relevant exercise sheets:
<ul>
<li/>
TBD
</ul>
<h4>
Getting help and reporting mistakes
</h4>
<p>Please never hesitate to get in touch. Approach me directly in person
during the summer school or by email. You may prefer to ask a question
on the #<strong>Normalisation and algebra</strong> channel on the SPLS
Zulip server: <a href="spls.zulipchat.com">spls.zulipchat.com</a> .
Others would benefit from your question in that case too!</p>
<h3>
Previous iterations
</h3>
<ul>
<li><a href="https://typesig.pl/triple2026/">Theory, Related
Interdisciplinary &amp; Programming Languages at Edinburgh (TRIPLE)
(TRIPLE 2026)</a> <a
href="https://denotational.co.uk/talks/algebra-and-normalisation-triple2026.pdf">slides</a>
(parts of Lecture 1)</li>
</ul>