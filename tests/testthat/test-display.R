context("display")
knownbug <- function(expr, notes) invisible(NULL)

#### show ####

test_that("show.unitted works", {
  
  # these tests are pretty limited because I don't know how to make regular expressions identify fixed expressions
  expect_that(show(u(1:10,"mice")), prints_text("unitted numeric")) 
  expect_that(show(u(data.frame(x=1:10,y=2:11),c("mice","keyboards"))), prints_text("")) 
  expect_that(show(data.frame(x=u(1:10,"mice"),y=u(2:11,"keyboards"))), prints_text("")) # should this appear unitted?
  expect_that(show(u(matrix(99:106,2,4),c("screens"))), prints_text("unitted matrix")) 
  expect_that(show(u(array(99:106,c(2,4)),c("screens"))), prints_text("unitted matrix"))
  expect_that(show(u(array(99:106,c(2,2,2)),c("screens"))), prints_text("unitted array"))
  
  # printing empty unitted data.frames with complex types
  df <- data.frame(one=letters[c(6,16,26)], two=5:7+0.5, three=as.POSIXlt(Sys.time()+1:3), stringsAsFactors=FALSE)
  units <- c("gene","freq","")
  udf <- u(df, units)
  knownbug(show(udf[F,]), 'should throw error')
  expect_that(udf[F,], equals(u(df[F,],units))) # passes, illustrating that the problem is in the printing, not the unitting
  expect_that(v(udf[F,]), equals(df[F,])) # passes, illustrating that the problem is in the printing, not the unitting
  knownbug(expect_that(show(udf[F,]), equals(show(u(df[F,],units)))), "printing empty unitted df with POSIXlt column (also breaks if POSIXct)")
  
  u(list(a=u(4,"brown"), b=u(5,"jasmine")),"rice") # breaks - only displays 2 of the 3 possible units, and not a logical set of them.
  u(as.list(rnorm(5)),"rice") # breaks - repeated display of one units set, and also gets the units wrong
})


#### print ####

test_that("print.unitted works", {
  
  # these tests are pretty limited because I don't know how to make regular expressions identify fixed expressions
  expect_that(print(u(1:10,"mice")), prints_text("unitted numeric")) 
  expect_that(print(u(data.frame(x=1:10,y=2:11),c("mice","keyboards"))), prints_text("")) 
  expect_that(print(data.frame(x=u(1:10,"mice"),y=u(2:11,"keyboards"))), prints_text("")) # should this appear unitted?
  expect_that(print(u(matrix(99:106,2,4),c("screens"))), prints_text("unitted matrix")) 
  expect_that(print(u(array(99:106,c(2,4)),c("screens"))), prints_text("unitted matrix"))
  expect_that(print(u(array(99:106,c(2,2,2)),c("screens"))), prints_text("unitted array"))
  
  # printing empty unitted data.frames with complex types
  df <- data.frame(one=letters[c(6,16,26)], two=5:7+0.5, three=as.POSIXlt(Sys.time()+1:3), stringsAsFactors=FALSE)
  units <- c("gene","freq","")
  udf <- u(df, units)
  knownbug(print(udf[F,]))
  expect_that(udf[F,], equals(u(df[F,],units))) # passes, illustrating that the problem is in the printing, not the unitting
  expect_that(v(udf[F,]), equals(df[F,])) # passes, illustrating that the problem is in the printing, not the unitting
  knownbug(expect_that(print(udf[F,]), equals(print(u(df[F,],units)))), "printing empty unitted df with POSIXlt column (also breaks if POSIXct)")
})
