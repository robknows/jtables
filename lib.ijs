projects_home=:> (<1 1){UserFolders_j_
load projects_home,'/jtables/tables.ijs'
load projects_home,'/jtables/datetime.ijs'
load 'tables/dsv'

system=:2!:0
type=:3!:0
read=:1!:1
getenv=:2!:5
iread=:1!:11
split=:([ E. ,) (}.;.1) ,
splitAny=:]
filesize=:1!:4
apply=:128!:2
time=:6!:0

readDsv=: 4 : 0
  'delim columnNames types'=:x
  'csv'=:y

  boxes=:delim readdsv csv
  'S N X'=:]`".`0:
  typeGerund=:". }: ; (,&';')"0 types
  parseCol=:3 : '((y&{) typeGerund)`:6 S:0 (y&{)"1 boxes'
  ncols=:#@:(0&{) boxes
  columns=:parseCol L:0 (<"0) i. ncols
  (columnNames ,. columns) delColIdxs (types I.@:e. 'X')
)