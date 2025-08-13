dnl $Id$
changequote([, ])dnl
define([VERSION], [esyscmd([grep VERSION ../include/common.h | egrep -o '".+"$' | xargs printf])])dnl
define([_DOC_REPEAT], [ifelse(eval($1 < $2), 1, [_DOC_REPEAT(incr($1), $2, $3)$3])])dnl
define([DOC_REPEAT], [_DOC_REPEAT(0, $1, $2)])dnl
define([DOC_LINE], [
DOC_REPEAT(39, [=-])=
])dnl
define([DOC_INDENT2], [dnl
patsubst(DOC_REPEAT($1, [X]), [X], [ ])dnl
$3[]dnl
patsubst(DOC_REPEAT(eval($2 - len($3)), [X]), [X], [ ])dnl
$4])dnl
define([DOC_INDENT], [
patsubst($2, [^], patsubst(DOC_REPEAT($1, [X]), [X], [ ]))
])dnl
