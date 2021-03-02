airtemps <- c(212, 30, 3, 78, 32)

# Could write this for each value
celsius1 <- (airtemps[1] -32) * (5/9)

# Instead we can write a function
# Can use shortcut "Code", "Extract Function"
# Can use "Code", "Insert Skelleton" to annotate

farh_to_cel <- function(airtemps) {
  celsius <- (airtemps -32) * (5/9)
  return(celsius)
  
  #' Title
  #'
  #' @param airtemps 
  #'
  #' @return celsius
  #' @export
  #'
  #' @examples
}

cel_temp <- farh_to_cel(airtemps)

# Now we write a function to do C to F
farh1 <- (cel_temp[1] * (9/5)) + 32 

cel_to_far <- function(cel_temp) {
  farh <- (cel_temp * (9/5)) + 32 
  return(farh)
}

farh_temp <- cel_to_far(cel_temp)

convert_temps <- function(farh) {
  celsius <- (farh -32) * (5/9)
  kelvin <- celsius + 275.15
  
  return(list(farh = farh, celsius = celsius, kelvin = kelvin))
  
}

temps_df <- data.frame(convert_temps(seq(-100, 100, 10)))

custom_theme <- function(base_size = 9) {
  ggplot2::theme(
    axis.ticks       = ggplot2::element_blank(),
    text             = ggplot2::element_text(family = 'Helvetica', color = 'gray30', size = base_size),
    plot.title       = ggplot2::element_text(size = ggplot2::rel(1.25), hjust = 0.5, face = 'bold'),
    panel.background = ggplot2::element_blank(),
    legend.position  = 'right',
    panel.border     = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_line(colour = 'grey90', size = .25),
    legend.key       = ggplot2::element_rect(colour = NA, fill = NA),
    axis.line        = ggplot2::element_blank()
  )
}

ggplot(temps_df, mapping=aes(x=farh, y=celsius, color=kelvin)) +
  geom_point() +
  custom_theme(10)
