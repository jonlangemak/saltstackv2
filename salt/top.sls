# This file assumes that you use the words 'master' and 'minion' in your 
# naming convention for your nodes.  If thats not the case, you'll need
# to update these so the proper state files match the proper servers

base:
  '*':
    - baseinstall
  '*minion*':
    - minioninstall
  '*master*':
    - masterinstall
    - pods

