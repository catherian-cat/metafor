dfround <- function(x, digits) {

   mstyle <- .get.mstyle("crayon" %in% .packages())

   #if (inherits(x, "matrix"))
   #   x <- data.frame(x)

   if (!inherits(x, "data.frame"))
      stop(mstyle$stop("Argument 'x' must be a data frame."))

   p <- ncol(x)

   if (missing(digits))
      digits <- 0

   if (length(digits) == 1L)
      digits <- rep(digits, p)

   if (p != length(digits))
      stop(mstyle$stop(paste0("Number of columns in 'x' (", p, ") does not match length of 'digits' (", length(digits), ").")))

   if (!is.numeric(digits))
      stop(mstyle$stop("Argument 'digits' must be a numeric vector."))

   for (i in 1:p) {
      if (!is.numeric(x[[i]]))
         next
      x[[i]] <- round(x[[i]], digits[i])
   }

   return(x)

}
