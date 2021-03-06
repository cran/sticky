## Sticky: Persistent Attributes

<!--- [![License](https://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](https://www.gnu.org/licenses/gpl-2.0.html) --> 
[![CRAN_Status_Badge](https://r-pkg.org/badges/version/sticky)](https://cran.r-project.org/package=sticky)
[![Downloads](https://cranlogs.r-pkg.org/badges/sticky?color=brightgreen)](https://r-pkg.org/pkg/sticky)
[![](http://cranlogs.r-pkg.org/badges/grand-total/sticky)](https://CRAN.R-project.org/package=sticky)
[![software impact](http://depsy.org/api/package/r/sticky/badge.svg)](http://depsy.org/package/r/sticky)
<!-- badges: start -->
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
<!-- badges: end -->

In base R, objects lose attributes in many common operations such as: subset, [, [[<-, append, etc. or when inserted into or extracted from recursive (list-like) objects such as data frames or data tables. Marking objects 'sticky', make attributes resilient to these operations. In essence, sticky makes object behave more like objects in other languages whose attributes are preserved. There isn't much to the package. `sticky`/`unstick`and `sticky_all` are the only interfaces to the package.


## Key Functions

 - `sticky`: make an objects attributes persist across data operations
 
 - `unstick`: remove the stickiness of an object; attributes will no longer 
   persist during common data operations

 - `sticky_all` : make all elements of a recursive object (e.g list, data frames, etc.) sticky.
 

## Example

Here is an simple example of a sticky attribute in action. Under base R, 
attributes do not survive a slice/subset/`[` operation: 

    x <- 1:5
    attr(x, 'foo') <- 'bar'
    attr(x[1:3],'foo')        # NULL -- attribute removed 

To ensure that they get preserved, simply declare the object as `sticky`:

    x <- sticky(x)
    attr(x[1:3],'foo')        # 'bar' -- attribute preserved    

`sticky()` works for vectors inside table-like objects ( i.e. data.frames 
and data.tables), preserving their attributes during table operations.

    df <- data.frame( 
      sticky   = sticky( structure(1:5, foo="bar") ),
      nonstick = structure( letters[1:5], foo="baz" )
    )
    attr( df[2:3,"nonstick"], 'foo' )  # NULL
    attr( df[2:3,"sticky"], 'foo' )    # bar
    
    
If all elements of a list or a data.frame need to behave in a sticky manner, 
use `sticky_all`. 

    df <- sticky_all(df)
    attr( df[2:3,"nonstick"], 'foo' )  # Now 'baz'



## Installation 

### Stable Version: CRAN (coming soon)

    install.packages('sticky')

### Development Version: Github

    library(devtools)
    lnstall_github('decisionpatterns/sticky')


## Use Cases

There are a number of things that can be done with `sticky`:

 * Preserve attributes of atomic or recursive objects
 * Ensure that attributes of vectors in data.[frame|table] are preserved
 * Build a basic class system.


## References

The issue of attribute resilience has been often asked and debated. Here are a 
few of the most prevalent discussions.

- [loss-of-attributes-despite-attempts-to-preserve-them](https://stackoverflow.com/questions/23991060/loss-of-attributes-despite-attempts-to-preserve-them)
- [how-to-delete-a-row-from-a-data-frame-without-losing-the-attributes](https://stackoverflow.com/questions/10404224/how-to-delete-a-row-from-a-data-frame-without-losing-the-attributes)
- [approaches-to-preserving-objects-attributes-during-extract-replace-operations](https://stackoverflow.com/questions/23841387/approaches-to-preserving-objects-attributes-during-extract-replace-operations)
- [indexing-operation-removes-attributes](https://stackoverflow.com/questions/13432519/indexing-operation-removes-attributes)
