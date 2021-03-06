if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'cshtml'
endif

syn include @aspnetAddCS syntax/cs.vim
unlet b:current_syntax

syn include @html syntax/html.vim
unlet b:current_syntax

runtime! syntax/html.vim
unlet b:current_syntax

syn region  csComment		start="@\*"  end="\*@" contains=@csCommentHook,csTodo,@Spell

syn cluster htmlPreProc add=razorBlock,razorLine

syn match razorLine +@[a-zA-Z0-9_\(\)\.]\++ contains=@aspnetAddCS,razorMixedBlock
syn region razorBlock start=+@{+ end=+}+ contains=@aspnetAddCS,@html

syn region razorMixedBlock start="@code" end="}" contains=@aspnetAddCS
syn region razorMixedBlock start="@functions" end="}" contains=@aspnetAddCS

let b:current_syntax = 'cshtml'
