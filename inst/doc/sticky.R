## ---- echo=FALSE, warning=FALSE, cache=FALSE, results='hide', message=FALSE----
library(magrittr)
# library(sticky)

## ---- echo=FALSE, warning=FALSE, message=FALSE---------------------------
   library(sticky)

## ---- results='hide'-----------------------------------------------------
x <- 1:5
attr(x, 'foo') <- 'bar'
attr(x[1:3],'foo')        # NULL -- attribute was lost by the subset

## ---- results='hide'-----------------------------------------------------
x <- sticky(x)
attr(x[1:3],'foo')        # 'bar' -- attribute preserved during subset

