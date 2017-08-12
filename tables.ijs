NB. A table is a list of columns
NB. A column is a 2 element list of boxes.
NB.   The first box contains the column name
NB.   The second box contains the column data (a list)

NB. Creation
tabulate=: ,. ,.

NB. Metadata
colNames=:(0&{)"1
colData=:(1&{)"1
count=:#@:>@:((< 0 1)&{)
colIdx=:colNames@:[ i. ]

NB. Query
selCol=:colIdx { colData@:[
selIdxs=:colNames@:[ ,. (({ L:0) colData)~
valCol=:>@:selCol

NB. Append
append=:(colNames@:[ ,. (colData@:[ (, L:0) ]))
appendTable=:append colData

NB. Helper
t_arg=:>@:(0&{)@:]
col_arg=:(1&{)@:]

NB. Transform
transValCol=: @:(>@:(t_arg valCol col_arg))
transCol=: 1 : '(<@:u transValCol y) (< ((t_arg colIdx col_arg) y),1)} (t_arg y)'

NB. Delete
delCol=:(colNames@:[ -. ]) ,. ([ selCol (colNames@:[ -. ]))
delIdxs=:[ selIdxs (i.@:count@:[ -. ])
delColIdxs=:(i.@:#@:[ -. ]) { [

NB. Filter
filterIdxs=:(I.@:)transValCol
filter =: 1 : '(t_arg y) selIdxs (u filterIdxs y)'
dfilter =: 1 : '(t_arg y) delIdxs (u filterIdxs y)'

NB. Update
updIdxs=:4 : 0
  'col idxs replacements'=:y
  (replacements&(idxs})) transCol x;col
)
