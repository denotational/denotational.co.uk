$if(it.talk)$
$it:verboseFormat(title=it.talk; desc="Talk given at the "+it.forum)$
$elseif(it.publication)$
$it:verbosePubFormat(title=it.publication; desc="Appears in the ["+it.inLong+"]("+ it.url+")")$
$elseif(it.preprint)$
$it:verbosePubFormat(title=it.preprint; desc="Preprint")$
$elseif(it.report)$
$it:verboseFormat(title=it.report; desc="Internal Report: "+it.kind)$
$endif$ 
