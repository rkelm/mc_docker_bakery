for i in * ; do  if [ -d $i ] ; then cd $i ; echo ; echo ; echo +++++ $i ++++++ ; echo ; git status ; cd .. ; fi ; done
