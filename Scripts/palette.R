# Shared colour palette for the whole book.
#
# Defined once, here, and sourced by every chapter that plots categorical groups, so a
# sample keeps the same colour in every figure from Chapter 13 onwards. Sourcing works
# both when you run chunks interactively in RStudio and when the book is knitted, which
# is why this is not in _common.R: that only runs at knit time.
#
# Five colours for five samples, dark blue through purple, magenta and coral to amber.
# Size the list to the number of groups you have. scale_colour_manual() takes the first
# n values, so a long ramp on a short list hands out colours that sit close together and
# every group ends up a slightly different shade of the same thing.

colour_conditions <- c("#003f5c", "#58508d", "#bc5090", "#ff6361", "#ffa600")

# Drop these into any plot where you would otherwise let ggplot pick colours itself.
custom_colour_manual <- function() {
  ggplot2::scale_colour_manual(values = colour_conditions)
}

custom_fill_manual <- function() {
  ggplot2::scale_fill_manual(values = colour_conditions)
}

# NOTE: these are for CATEGORICAL groups, sample, condition, cluster. Continuous values
# such as marker expression want a continuous scale instead, which is why the marker
# overlays in Chapter 14 use viridis. That is not an inconsistency, it is the right tool
# for a different kind of variable.
