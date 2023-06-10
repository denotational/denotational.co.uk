- $if(it.talk)$$if(it.filename)$[$it.talk$]($it.filename$)$if(it.video)$ ([video]($it.video$))$endif$,
    $else$$it.talk$,
    $endif$ $it.forum$, $it.date:date()$.
	$elseif(it.publication)$[$it.publication$]($it.filename$),
                [$it.in$]($it.url$)$if(it.video)$ ([video]($it.video$))$endif$$if(it.other)$, $it.other$$endif$.
  $elseif(it.preprint)$[$it.preprint$]($it.filename$),
                Preprint$if(it.other)$, $it.other$$endif$.
  $elseif(it.report)$[$it.report$]($it.filename$), $it.kind$, $it.date:date()$.
  $else$
  $if(it.visit)$Visiting $it.visit$, $it.start:date()$ to $it.date:date()$.
  $else$$if(it.meeting)$Attending [$it.meeting$]($it.url$) $if(it.location)$ in $it.location$ $endif$,
            $if(it.start)$ $it.start:date()$ to $endif$ $it.date:date()$.
           $else$
             $if(it.nowhere)$Visiting nowhere at the moment. Feel free to invite me over!
             $endif$
           $endif$
    $endif$
  $endif$ 

$if(it.cite)$
     $it.by$. $it.cite$$if(it.arxiv)$, [arXiv:$it.arxiv$](https://arxiv.org/abs/$it.arxiv$)$endif$$if(it.doi)$, [DOI: $it.doi$](https://doi.org/$it.doi$)$endif$.
     
$endif$
