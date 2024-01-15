<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<head>
<META NAME="description" CONTENT="Ohad Kammar's Research">
<META NAME="keywords" CONTENT="ohad kammar, ohad, kammar, research, publications, publication, programming language
semantics, PLT semantics, semantics, category, categories, category theory, logic, computational
effects, effect type systems, type and effect systems, types, effects, effect type system, access control, DCC, CDD, Plotkin, Gordon Plotkin, call by push value, CBPV, call-by-push-value, denotational semantics, continuations, delimited continuations, jump with argument">
<TITLE>Ohad's Research - Foundations for Type-Driven Probabilistic Modelling [POPL'24 TutorialFest]</TITLE>
<link rel="icon" href="favicon.ico" type="image/x-icon" >
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" >
</HEAD>

<h1>
Foundations for type-driven probabilistic modelling
</h1>
<h3>
<a href="https://popl24.sigplan.org/details/POPL-2024-tutorialfest/2/Foundations-of-Type-Driven-Probabilistic-Modelling">POPL’24 TutorialFest, London, England</a>
</h3>
<h4>
<a href="http://www.denotational.co.uk">Ohad Kammar</a> January 15 2024
</h4>
<p>The last few years have seen several breakthroughs in the semantic foundations of probabilistic and statistical modelling. In this tutorial, we will use types to introduce, use, and organise abstractions for probabilistic modelling.</p>
<p>We will do so first for discrete probability, and then more generally with the recently-developed quasi-Borel spaces. The tutorial is accompanied by exercises for self-study, allowing you to develop a working knowledge and hands-on experience after it.</p>
<h3>
Course materials
</h3>
<h4>
Lectures
</h4>
<p>All <a href="tdpm-popl-tutorialfest-2024/popl24-tutorial-fest-tdpm-slides.pdf">lectures</a>.</p>
<p>Planned structure:</p>
<ol type="1">
<li><a href="tdpm-popl-tutorialfest-2024/popl24-tutorial-fest-tdpm-slides-lecture-1a.pdf">Lecture 1a</a>:</li>
</ol>
<ul>
<li>Motivation</li>
<li>Type-driven probability and the discrete model</li>
</ul>
<ol start="2" type="1">
<li><a href="tdpm-popl-tutorialfest-2024/popl24-tutorial-fest-tdpm-slides-lecture-1b.pdf">Lecture 1b</a>:</li>
</ol>
<ul>
<li>type-driven probability and the discrete model (part 2)</li>
<li>events, Borel sets, and measurable spaces</li>
<li>quasi-Borel spaces</li>
</ul>
Relevant exercise sheets:
<ul>
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-borel.pdf">Borel set basics</a>: introductory exercises if you’ve never worked with Borel sets, or looking for a refresher.
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-measurable-spaces.pdf">Measurable spaces and functions</a>: exercises exploring the structure of measurable spaces and measurable functions.
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-cats.pdf">Basic category theory</a>: use these exercises to improve your category theory.
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-aumann.pdf">Aumann’s theorem</a>: consequences of and related concepts to Aumann’s theorem on the inexistence of measurable function-spaces.
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-sequences.pdf">Sequences</a>: examples of higher-order measure theory using sequences.
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-qbs-basics.pdf">Quasi-Borel spaces</a>: first acquaintance with quasi-Borel spaces.
<li/>
Extra-curricular material
<ul>
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-borel-hierarchy.pdf">More on the Borel hierarchy</a>: a guided tour of the proof of Aumann’s theorem.
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-lebesgue-measurability.pdf">Aumann’s theorem for Lebesgue measurablity</a>: extending Aumann’s theorem from Borel measurable functions to Lebesgue measurable functions.
</ul>
</ul>
<ol start="3" type="1">
<li><a href="tdpm-popl-tutorialfest-2024/popl24-tutorial-fest-tdpm-slides-lecture-2a.pdf">Lecture 2a</a>:</li>
</ol>
<ul>
<li>Simple type structure</li>
<li>Dependent-type structure</li>
<li>Standard Borel spaces</li>
</ul>
Relevant exercise sheets:
<ul>
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-qbs-constructions.pdf">Qbs construction</a>: space combinators — you may want to spread these exercises over several sittings.
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-subspaces.pdf">Borel subspaces</a>: measurable subsets in a quasi-Borel space.
<li/>
Measurability by type
<ul>
<li/>
<a href="../tdpm-anu-lss-2023/marseille-notes-exercises-section-qbs-function-spaces.pdf">Function spaces</a>: practice the definition of the function space of two qbses, with the Borel subsets and random element spaces.
</ul>
</ul>
<ol start="3" type="1">
<li><a href="tdpm-popl-tutorialfest-2024/popl24-tutorial-fest-tdpm-slides-lecture-2b.pdf">Lecture 2b</a>: Integration and random variables</li>
</ol>
<h4>
Getting help and reporting mistakes
</h4>
<p>Please never hesitate to get in touch. Approach me directly in person during the summer school or by email. You may prefer to ask a question on the #qbs channel on the SPLS Zulip server: <a href="spls.zulipchat.com" class="uri">spls.zulipchat.com</a> . Others would benefit from your question in that case too!</p>
<h3>
Previous iterations
</h3>
<ul>
<li><a href="../tdpm-anu-lss-2023">ANU Logic Summer School 2023</a>.</li>
<li><a href="../qbs-splv-2022">Scottish PL and Verification Summer School 2022</a></li>
<li><p><a href="https://cirmbox.cirm-math.fr/s/gm7FQRrqsNNjG8p">Logic of Probabilistic Programming 2022</a> invited tutorial:</p>
<ul>
<li>Videos: <a href="https://library.cirm-math.fr/Record.htm?idlist=3&amp;record=19289752124910079349">lecture 1</a>, <a href="https://cirmbox.cirm-math.fr/s/gm7FQRrqsNNjG8p">lecture 2</a></li>
<li><a href="../talks/2022-cirm-higher-order-measure-theory.pdf">Slides</a></li>
</ul></li>
</ul>