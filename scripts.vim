if did_filetype()
  finish
endif
if getline(1) =~# '^#!.*/bin/env shell-ruby'
  setfiletype ruby
endif
