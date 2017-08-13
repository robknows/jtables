system=:2!:0
type=:3!:0
read=:1!:1
getenv=:2!:5
iread=:1!:11
split=:E. }.;.1 ]
filesize=:1!:4
apply=:128!:2

farg=:'/home/rob/j64-805-user/projects/jtables/EURGBP_M1_2002.csv'
xarg=:';';('time';'open';'high';'low';'close';'zero');'SNNNNX'
yarg=:('/home/rob/j64-805-user/projects/jtables/EURGBP_M1_2002.csv'&;)@:(971&*)


readCsv=: 4 : 0
  'delim columnNames types'=:x
  'csv chksize'=:y

  bytes=:iread csv;0,chksize
  exploded=:}: (LF E. bytes) ((delim&E. }.;.1 ])@:(delim&,)@:}.);.1 bytes
  'S N X'=:]`".`0:
  typeGerund=:". }: ; (,&';')"0 types
  parseCol=:4 : '((y{typeGerund)`:6) y&{"2 x'
  ncols=:(1&{)@:$ exploded
  columns=:(exploded&parseCol) L:0 (<"0 i. ncols)
  
  columnNames ,. columns
)

