<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<head>
<META NAME="description" CONTENT="Ohad Kammar's Research">
<META NAME="keywords" CONTENT="ohad kammar, ohad, kammar, research, publications, publication, programming language
semantics, PLT semantics, semantics, category, categories, category theory, logic, computational
effects, effect type systems, type and effect systems, types, effects, effect type system, access control, DCC, CDD, Plotkin, Gordon Plotkin, call by push value, CBPV, call-by-push-value, denotational semantics, continuations, delimited continuations, jump with argument">
<TITLE>Ohad's Research - Agda Course 2013</TITLE>
<link rel="icon" href="favicon.ico" type="image/x-icon" >
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" >
</HEAD>

<p><em><a href="http://www.lfcs.inf.ed.ac.uk/">The Logic, Semantics, and
Programming Languages Group</a> at the <a
href="http://www.cam.ac.uk/">University of Cambridge</a>
presents:</em></p>
<h1 id="dependently-typed-metaprogramming-in-agda">Dependently typed
metaprogramming (in Agda)</h1>
<h2 id="conor-mcbride"><a
href="http://www.cis.strath.ac.uk/cis/staff/index.php?uid=conor">Conor
McBride</a></h2>
<p><em><a href="http://www.msp.cis.strath.ac.uk/">MSP</a>, <a
href="http://www.strath.ac.uk/">University of Strathclyde</a></em></p>
<p>Dependently typed functional programming languages such as Agda are
capable of expressing very precise types for data. When those data
themselves encode types, we gain a powerful mechanism for abstracting
generic operations over carefully circumscribed universes. This course
will begin with a rapid depedently-typed programming primer in Agda,
then explore techniques for and consequences of universe constructions.
Of central importance are the “pattern functors” which determine the
node structure of inductive and coinductive datatypes. We shall consider
syntactic presentations of these functors (allowing operations as useful
as symbolic differentiation), and relate them to the more uniform
abstract notion of “container”. We shall expose the double-life
containers lead as “interaction structures” describing systems of
effects. Later, we step up to functors over universes, acquiring the
power of inductive-recursive definitions, and we use that power to build
universes of dependent types.</p>
<p><B>Prerequisites:</B> This class assumes familiarity with typed
functional programming, but will not require prior experience with
depedently-typed programming nor with Agda.</p>
<p>We do, however, recommend dabbling with Agda in advance. Materials
from an introductory Agda course can be found at</p>
<p><a
href="http://www.cl.cam.ac.uk/~ok259/agda-course">http://www.cl.cam.ac.uk/~ok259/agda-course</a>
and</p>
<p><a
href="https://personal.cis.strath.ac.uk/conor.mcbride/pub/dtp">https://personal.cis.strath.ac.uk/conor.mcbride/pub/dtp/</a></p>
<h4 id="location">Location:</h4>
<p>This course was given at the <a
href="http://www.cl.cam.ac.uk/">University of Cambridge Computer
Laboratory</a></p>
<h4 id="course-material">Course Material:</h4>
<p>All course material will be available online.</p>
<ul>
<li><p><a
href="https://github.com/pigworker/MetaprogAgda/blob/master/notes.pdf?raw=true">Lecture
notes</a>.</p></li>
<li><p>Repository: <a
href="https://github.com/pigworker/MetaprogAgda">https://github.com/pigworker/MetaprogAgda</a></p></li>
</ul>
<p>After cloning the initial repository, don’t forget to pull the latest
changes:</p>
<pre><code>git pull origin</code></pre>
<ul>
<li><a
href="http://www.youtube.com/playlist?list=PL_shDsyy0xhKhsBUaVXTJ2uJ78EGBpvQa">Video
captures</a></li>
</ul>
<h4 id="mailing-list">Mailing List:</h4>
<p>Course announcements, discussions and questions are welcome in the
agda-course-2013 mailing list. Non-registrants: you are welcome to join
too, please email Ohad in the address above to join, with some
indication you are not a machine.</p>
<h4 id="schedule">Schedule:</h4>
<p>13:00-14:00: Laboratory</p>
<p>14:00-14:20: Coffee Break</p>
<p>14:20-15:20: Lecture</p>
<p>15:20-15:40: Coffee Break</p>
<p>15:40-16:40: Lecture</p>
<p>16:40-17:00: Coffee Break</p>
<p>17:00-18:00: Laboratory</p>
<p>18:00-…: Pub…</p>
<h4 id="past-lectures">Past Lectures:</h4>
<ol type="1">
<li><p>05 August, 2013: <B>Introduction via Vectors</B><BR> Location:
<B> SW01 </B><BR><a
href="http://youtu.be/08sPfcYbN1c">Video</a></p></li>
<li><p>05 August, 2013: <B>Metaprogramming the Simply-Typed
λ-Calculus</B><BR> Location: <B> SW01 </B><BR><a
href="http://youtu.be/60VGaOujMg8">Video</a></p></li>
<li><p>07 August, 2013: <B>Containers and W-Types</B><BR> Location: <B>
SW01 </B><BR><a href="http://youtu.be/7PpxZf5KFjM">Video</a></p></li>
<li><p>07 August, 2013: <B>Indexed Containers</B><BR> Location: <B> SW01
</B><BR><a href="http://youtu.be/jgSGt3qSfwY">Video</a></p></li>
<li><p>26 August, 2013: <B>Induction-Recursion I</B><BR> Location: <B>
SW01 </B><BR><a href="http://youtu.be/3mYFeUGPTxo">Video</a></p></li>
<li><p>26 August, 2013: <B>Induction-Recursion II</B><BR> Location: <B>
SW01 </B><BR><a href="http://youtu.be/FrqBej4qCgg">Video</a></p></li>
<li><p>28 August, 2013: <B>Observational Equality</B><BR> Location: <B>
SW01 </B><BR><a href="http://youtu.be/s6mhOb0Ggh8">Video</a></p></li>
<li><p>28 August, 2013: <B>Type Theory in Type Theory</B><BR> Location:
<B> SW01 </B><BR><a
href="http://youtu.be/wge7H8DK9zw">Video</a></p></li>
</ol>
<h4 id="acknowledgements">Acknowledgements</h4>
<p>Thanks to <a href="http://www.cl.cam.ac.uk/~am21/">Alan Mycroft</a>
for arranging the funding! And, of course, to Conor for preparing the
course!</p>