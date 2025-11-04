<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<head>
<META NAME="description" CONTENT="Ohad Kammar's Research">
<META NAME="keywords" CONTENT="ohad kammar, ohad, kammar, research, publications, publication, programming language
semantics, PLT semantics, semantics, category, categories, category theory, logic, computational
effects, effect type systems, type and effect systems, types, effects, effect type system, access control, DCC, CDD, Plotkin, Gordon Plotkin, call by push value, CBPV, call-by-push-value, denotational semantics, continuations, delimited continuations, jump with argument">
<TITLE>Ohad's Research - Advice </TITLE>
<link rel="icon" href="favicon.ico" type="image/x-icon" >
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" >
</HEAD>

<h1 id="advice-on-organising-a-hybrid-seminar">Advice on organising a
hybrid seminar</h1>
<p>I’ve been organising the LFCS seminar in Edinburgh since around 2020,
and in a remote/hybrid fashion since lockdown. We sometimes record the
talks and I sometimes find the time to edit and upload them to our <a
href="https://www.youtube.com/@lfcsseminar9233">YouTube channel</a>. I
collected this advice as part of Gabriel Scherer’s and my efforts in
organising the <a
href="https://www.irif.fr/~scherer/doc/aplus/principles.html">ACM
Programming Language Unofficial Seminar (APLUS)</a>. Below is what seems
to work well-enough to deliver the following spec:</p>
<ul>
<li>Remote participants can follow the talk.</li>
<li>Remote participants can participate.</li>
<li>Relatively minor disruption to in-person attendees.</li>
<li>Organiser can record the talk.</li>
<li>Minor editing suffices to produce a good-enough YouTube video.</li>
</ul>
<p>The best advice I have is to <strong>keep it simple</strong>.</p>
<p>These seminars tend to be specialised scientific talks. The audience
self-selects to attend, and since the alternative is not to attend, they
are willing to make some effort within reason. They are more interested
in the content than the form, and in participating: i.e., asking their
question and receiving a clarification.</p>
<h2 id="time-commitment">Time commitment</h2>
<p>To calibrate expectations, if all goes smoothly you’ll be spending: -
10-15 minutes ahead of the seminar setting up. - 10-15 minutes
afterwards editing and tagging the video. - about 1h processing the
video and sharing it. (You can do something else during this time.)</p>
<p>I recommend the following: - reserve 40 minutes ahead of the seminar
to set-up, if something goes wrong, you’ll thank me for those extra 30
minutes. - if you haven’t done it before, do a test run a couple of
days, preferably a week, ahead of the seminar. Try to mimic the exact
set-up on the day, including the same room. The goal is encounter as
many issues as you can with a couple of days to spare so you can do
something about it. - reserve around 1h for editting. - having separate
in-person and on-line chairs to the session. (on-line chair monitors the
chat, flags issues, takes questions, etc.)</p>
<p>So for a 1h seminar, you’re adding around 30%-100% time to the purely
in-person seminar organisation.</p>
<h2 id="equipment-software-and-settings">Equipment, software, and
settings</h2>
<p>I’ve settled on the following set-up. Mostly because I can get it to
work in any seminar room in my university. If your baseline is
different, you could probably do better.</p>
<p>Equipment - Mic+speakers: Jabra Speak 710
https://www.jabra.com/business/speakerphones/jabra-speak-series/jabra-speak-710/</p>
<p>I also use it for my other meetings. It catches audio from the room
pretty well so remote participants and recording can hear it.</p>
<p>(I do not receive commission from Jabra for this recommendation.)</p>
<ul>
<li><p>Adaptor: you should be able to offer HDMI and whatever ports the
Jabra Speak offers (mine has USB). Your seminar speaker may not have
USB-C port or may not have enough USB ports, so if your adaptor has a
USB outlet, make sure you have a USB to USB C adaptor and the other way
around.</p>
<p>If your speaker has a Mac, it is reasonable to expect them to bring
an adaptor. You can always ask ahead of time.</p></li>
</ul>
<p>Platform:</p>
<ul>
<li>zoom for presentation and recording. Our university has a
subscription and most speakers are comfortable with it by now. It also
records fine.</li>
<li><a href="https://kdenlive.org/">Kdenlive</a> for editing (more
below).</li>
</ul>
<p>Set-up for the speaker: - connects the Jabra Speak to their laptop -
logs into zoom room, sharing video and using Jabra Speak as mic and
speakers - uses laptop camera, if they want. (It is actually not
necessary to show their face, although it sometimes helps participants,
especially to notice something has gone wrong and flag it.) - uses mouse
to point at the slides. This may work better even for in-person
participants, e.g., if there are multiple screens to look at.</p>
<ul>
<li><p>If there is a room mic, it might be too much of a hassle to get
it to broadcast to zoom, unless it is already set-up this way. I don’t
try any more.</p>
<p>Whether or not the room mic connects to zoom, get the speaker to use
it. In-person attendees with hearing difficulty will prefer the mic,
even if other attendees can hear the speaker fine.</p></li>
<li><p>Try to get everything set-up, including screen-share and seminar
speaker unmuted and broadcasting, at least 5 minutes before the talk
starts.</p></li>
<li><p>Start the recording about 1 minute before you start. The speaker
might need to click a button confirming that the talk is being recorded.
Remind them to do it.</p></li>
<li><p>Warn the speaker they may need to repeat questions asked in the
room. Depending on the room set-up, they may need to repeat questions by
remote participants. It’s well worth doing it anyway.</p></li>
</ul>
<h2 id="chairing">Chairing</h2>
<ul>
<li><p>If possible, have a room session-chair and an on-line chair that
monitors the chat.</p></li>
<li><p>The on-line chair may need to intervene in the room, e.g.:</p>
<ul>
<li>fix screen sharing</li>
<li>fix recording</li>
<li>field issues from remote participants</li>
<li>speak on behalf of remote participants</li>
<li>semaphore participants to unmute</li>
<li>remind speaker to repeat questions</li>
</ul></li>
<li><p>If you’re the remote chair, make sure your laptop doesn’t run out
of juice.</p></li>
<li><p>Remind participants (in-person and online) if the talk is
recorded, and may be uploaded to YouTube.</p></li>
<li><p>Try to finish on time. Some remote or in-person participants may
want to ask questions without being recorded. Finishing on time (and
stopping the recording!) allows them to do it.</p></li>
<li><p>Offer to ask questions on behalf of the remote
participants.</p></li>
<li><p>I usually write this in the beginning of the seminar:</p>
<p>If you have a question, please raise your hand and prepare to unmute
when called. We are recording the talk and may upload it to YouTube. If
you do not want your voice recorded, or if you want me to ask on your
behalf, please ask in the chat and I will repeat the question
(anonymously) on your behalf. We will stop the recording at the end of
the talk, so if you want to ask a question informally, please wait until
then.</p></li>
</ul>
<h2 id="remote-participation">Remote participation</h2>
<ul>
<li><p>Make the room password protected. Do not leave the password lying
on the internet. Specialised mailing lists seem to be fine.</p>
<p>You’d be surprised how many bored people are there out there who will
zoom-bomb your meeting.</p></li>
<li><p>It is reasonable to expect remote participants to have their full
names listed. It is reasonable to remove participants who refuse to do
it, especially if the talk is being recorded. Some people will have
other opinions about this.</p></li>
<li><p>Don’t offer to edit people out. People who want that option tend
to be so picky that you’ll come to regret this. Leave it up to them not
to participate.</p></li>
</ul>
<h2 id="editting">Editting</h2>
<ul>
<li><p>I edit minimally. Trimming the few minutes up to the speaker
beginning (including the introduction by the chair). I trim the bit
after the Q&amp;A, but leave the formal Q&amp;A. If there were any
mishaps during the talk that I remember, I find them and edit them
out.</p></li>
<li><p>I don’t watch the full video before rendering it as it would
double or triple the preparation time and mean there are no videos
whatsoever.</p></li>
</ul>