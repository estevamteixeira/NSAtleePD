##---------- PDF ---------

plot_line_pdf <- function(
    data,
    var,
    palt = "Dark2",
    ylab = NULL,
    yacc = 0.1){
  
  require(dplyr)
  require(ggplot2)
  require(ggrepel)
  require(plotly)
  require(RColorBrewer)
  
  # gets dataset
  dta <- data
  var <- unlist(var)
  
  # transform the categories variable into factor
  dta[["cat"]] <- factor(dta[["cat"]])
  
  # get number of different factor levels for color
  nfac <- length(levels(dta[["cat"]]))
  
  # assign colors to factors automatically
  # for name options please visit: https://colorbrewer2.org
  
  if(nfac < 2){
    pal <- c("#008D8B")
  } else if(nfac < 3){
    
    pal <- c("#008D8B",
             "#FE5D26")
  } else {
    if(any(tolower(dta[["cat"]]) %in% c("stillbirth"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Stillbirth" = colors[1],
               "Early neonatal mortality" = colors[2],
               "Total perinatal mortality" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("postneonatal mortality"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Neonatal mortality" = colors[1],
               "Postneonatal mortality" = colors[2],
               "Total infant mortality" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("age < 20"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("age < 20" = colors[1],
               "20 \u2264 age < 35" = colors[2],
               "age \u2265 35" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("0"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("0" = colors[1],
               "1" = colors[2],
               "\u2265 2" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("quit"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Quit" = colors[1],
               "Reduced" = colors[2],
               "No change or increased" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("underweight"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Underweight" = colors[1],
               "Normal weight" = colors[2],
               "Overweight" = colors[3],
               "Obese" = colors[4])
    } else if(any(tolower(dta[["cat"]]) %in% c("obese i (30 \u2264 bmi < 35)"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Obese I (30 \u2264 BMI < 35)" = colors[1],
               "Obese II (35 \u2264 BMI < 40)" = colors[2],
               "Obese III (BMI \u2265 40)" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("inadequate"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Inadequate" = colors[1],
               "Adequate" = colors[2],
               "Excessive" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("loss > 1 kg"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Loss > 1 kg" = colors[1],
               "Within 1 kg" = colors[2],
               "1 kg < Gain < 5 kg" = colors[3],
               "Gain \u2265 5 kg" = colors[4])
    } else if(any(tolower(dta[["cat"]]) %in% c("\u2265 3"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("None" = colors[1],
               "1" = colors[2],
               "2" = colors[3],
               "\u2265 3" = colors[4])
    } else if(any(tolower(dta[["cat"]]) %in% c("exclusive"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("No" = colors[1],
               "Exclusive" = colors[2],
               "Non-exclusive" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("post dates"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Post dates" = colors[1],
               "Hypertensive disease" = colors[2],
               "PRoM without chorioamnionitis" = colors[3],
               "Other medical reason" = colors[4],
               "Other or unspecified" = colors[5])
    } else if(any(tolower(dta[["cat"]]) %in% c("spontaneous vaginal"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Spontaneous vaginal" = colors[1],
               "Assisted vaginal" = colors[2],
               "Caesarean section" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("no labour"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("No labour" = colors[1],
               "1\u02e2\u1d57 stage" = colors[2],
               "2\u207f\u1d48 stage" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("previous caesarean"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Previous caesarean" = colors[1],
               "Breech or other malpresentation" = colors[2],
               "Labour dystocia" = colors[3],
               "Fetal distress" = colors[4],
               "Maternal conditions" = colors[5],
               "Fetal conditions" = colors[6],
               "Placenta or cord related" = colors[7],
               "Other" = colors[8])
    } else if(any(tolower(dta[["cat"]]) %in% c("10"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("1" = colors[1],
               "2" = colors[2],
               "3" = colors[3],
               "4" = colors[4],
               "5" = colors[5],
               "6-7" = colors[6],
               "8" = colors[7],
               "10" = colors[8])
    } else if(any(tolower(dta[["cat"]]) %in% c("gh-total"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("GH-total" = colors[1],
               "GH-no sig proteinuria" = colors[2],
               "GH-sig proteinuria" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("weight < 1000 g"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("weight < 1000 g" = colors[1],
               "weight < 1500 g" = colors[2],
               "weight < 2500 g" = colors[3]
               # "weight \u2265 2500 g" = colors[4]
               )
    } else if(any(tolower(dta[["cat"]]) %in% c("< 28 weeks"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("< 28 weeks" = colors[1],
               "< 32 weeks" = colors[2],
               "< 34 weeks" = colors[3],
               "< 37 weeks" = colors[4]
      )
    } else if(any(tolower(dta[["cat"]]) %in% c("mild"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Mild" = colors[1],
               "Moderate" = colors[2],
               "Severe" = colors[3],
               "TTN" = colors[4],
               "Unknown severity" = colors[5]
      )
    }
  }
  
  plot <- ggplot(dta,
                 aes(x = BrthYear,
                     y = dta[[var]],
                     group = dta[["cat"]])) + 
    geom_point(aes(color = dta[["cat"]],
                   fill = dta[["cat"]],
                   shape = dta[["cat"]]),
               # alpha = 0.65,
               size = 3) + 
    geom_line(aes(color = dta[["cat"]]),
              alpha = 0.65) + 
    scale_color_manual(name='',
                       values = pal,
                       limits = names(pal)) +
    scale_fill_manual(name = "",
                      values = pal,
                      limits = names(pal)) +
    scale_shape_manual(name = "",
                       values = c(21,3,22,4,23,24,25,1,2,4)) +
    theme_classic() +
    theme(strip.text.x = element_text( face = "bold", size = 12),
          strip.background = element_blank(),
          axis.title.x = element_text(face="bold", size = 12),
          axis.title.y = element_text(face="bold", size = 12),
          axis.text.x = element_text(face="bold", size = 10, color = "black"),
          axis.text.y = element_text(face="bold", size = 10, color = "black"),
          title = element_text(face="bold", size = 12, hjust = 0.5),
          plot.title = element_text(hjust = 0.5),
          # legend
          legend.position = ifelse(nfac > 1,
                                   "bottom",
                                   "none"),
          legend.text = element_text(face="bold", size = 8),
          legend.title = element_blank(),
          legend.justification = "center") + 
    scale_y_continuous(labels = ifelse(
      !tolower(var) %in% "prop",
      scales::comma_format(
      accuracy = yacc),
      scales::percent_format(
        accuracy = yacc)),
                       breaks = pretty,
                       limits = c(0,NA)) +
    scale_x_continuous(#trans = 'log2',
      breaks = pretty) +
    labs(y = ylab,
         x = "Year") +
    guides(color = guide_legend(ncol = ifelse(nfac > 3, 
                                               2, 1)),
           shape = guide_legend(ncol = ifelse(nfac > 3, 
                                             2, 1)),
           linetype = guide_legend(ncol = ifelse(nfac > 3, 
                                             2, 1)))
  
  return(plot)
}

## HTML -----

plot_line <- function(
    data,
    var,
    palt = "Dark2",
    ylab = NULL,
    yacc = 0.1){
  
  require(dplyr)
  require(ggplot2)
  require(plotly)
  require(RColorBrewer)
  
  # gets dataset
  dta <- data
  var <- unlist(var)
  
  # transform the categories variable into factor
  dta[["cat"]] <- factor(dta[["cat"]])
  
  # get number of different factor levels for color
  nfac <- length(levels(dta[["cat"]]))
  
  # assign colors to factors automatically
  # for name options please visit: https://colorbrewer2.org
  
  if(nfac < 2){
    pal <- c("#008D8B")
  } else if(nfac < 3){
    
    pal <- c("#008D8B",
             "#FE5D26")
  } else {
    if(any(tolower(dta[["cat"]]) %in% c("stillbirth"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Stillbirth" = colors[1],
               "Early neonatal mortality" = colors[2],
               "Total perinatal mortality" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("postneonatal mortality"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Neonatal mortality" = colors[1],
               "Postneonatal mortality" = colors[2],
               "Total infant mortality" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("age < 20"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("age < 20" = colors[1],
               "20 \u2264 age < 35" = colors[2],
               "age \u2265 35" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("0"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("0" = colors[1],
               "1" = colors[2],
               "\u2265 2" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("quit"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Quit" = colors[1],
               "Reduced" = colors[2],
               "No change or increased" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("underweight"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Underweight" = colors[1],
               "Normal weight" = colors[2],
               "Overweight" = colors[3],
               "Obese" = colors[4])
    } else if(any(tolower(dta[["cat"]]) %in% c("obese i (30 \u2264 bmi < 35)"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Obese I (30 \u2264 BMI < 35)" = colors[1],
               "Obese II (35 \u2264 BMI < 40)" = colors[2],
               "Obese III (BMI \u2265 40)" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("inadequate"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Inadequate" = colors[1],
               "Adequate" = colors[2],
               "Excessive" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("loss > 1 kg"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Loss > 1 kg" = colors[1],
               "Within 1 kg" = colors[2],
               "1 kg < Gain < 5 kg" = colors[3],
               "Gain \u2265 5 kg" = colors[4])
    } else if(any(tolower(dta[["cat"]]) %in% c("\u2265 3"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("None" = colors[1],
               "1" = colors[2],
               "2" = colors[3],
               "\u2265 3" = colors[4])
    } else if(any(tolower(dta[["cat"]]) %in% c("exclusive"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("No" = colors[1],
               "Exclusive" = colors[2],
               "Non-exclusive" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("post dates"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Post dates" = colors[1],
               "Hypertensive disease" = colors[2],
               "PRoM without chorioamnionitis" = colors[3],
               "Other medical reason" = colors[4],
               "Other or unspecified" = colors[5])
    } else if(any(tolower(dta[["cat"]]) %in% c("spontaneous vaginal"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Spontaneous vaginal" = colors[1],
               "Assisted vaginal" = colors[2],
               "Caesarean section" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("no labour"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("No labour" = colors[1],
               "1\u02e2\u1d57 stage" = colors[2],
               "2\u207f\u1d48 stage" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("previous caesarean"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Previous caesarean" = colors[1],
               "Breech or other malpresentation" = colors[2],
               "Labour dystocia" = colors[3],
               "Fetal distress" = colors[4],
               "Maternal conditions" = colors[5],
               "Fetal conditions" = colors[6],
               "Placenta or cord related" = colors[7],
               "Other" = colors[8])
    } else if(any(tolower(dta[["cat"]]) %in% c("10"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("1" = colors[1],
               "2" = colors[2],
               "3" = colors[3],
               "4" = colors[4],
               "5" = colors[5],
               "6-7" = colors[6],
               "8" = colors[7],
               "10" = colors[8])
    } else if(any(tolower(dta[["cat"]]) %in% c("gh-total"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("GH-total" = colors[1],
               "GH-no sig proteinuria" = colors[2],
               "GH-sig proteinuria" = colors[3])
    } else if(any(tolower(dta[["cat"]]) %in% c("weight < 1000 g"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("weight < 1000 g" = colors[1],
               "weight < 1500 g" = colors[2],
               "weight < 2500 g" = colors[3]
               # "weight \u2265 2500 g" = colors[4]
               )
    } else if(any(tolower(dta[["cat"]]) %in% c("< 28 weeks"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("< 28 weeks" = colors[1],
               "< 32 weeks" = colors[2],
               "< 34 weeks" = colors[3],
               "< 37 weeks" = colors[4]
      )
    } else if(any(tolower(dta[["cat"]]) %in% c("mild"))){
      colors <- brewer.pal(n = nfac,
                           name = palt)
      pal <- c("Mild" = colors[1],
               "Moderate" = colors[2],
               "Severe" = colors[3],
               "TTN" = colors[4],
               "Unknown severity" = colors[5]
      )
    }
  }
  
    plotly::plot_ly(data = dta[order(BrthYear)],
                  x = ~BrthYear,
                  y = ~dta[[var]],
                  type = "scatter",
                  mode = "lines",
                  # linetype = ~cat,
                  color = ~cat,
                  colors = pal,
                  symbol = ~cat,
                  hovertemplate = ~paste0(
                    "<b>", paste(cat, "-", BrthYear), "</b>",
                    "<br>Total births: ", 
                    scales::comma(dlv, accuracy = 1),
                    "<br>",ylab,": ",
                    if (tolower(var) %in% "prop"){
                      as.character(
                        scales::percent(
                          dta[[var]],
                          accuracy = yacc))
                    } else if (tolower(var) %in% "dlv" &&
                               dta[[var]] < 5){
                      "< 5"
                    } else {
                      as.character(
                        scales::comma(
                          dta[[var]],
                          accuracy = yacc))
                    },
                    "<extra></extra>" # removes the trace name from the hover text
                  ),
                  line = list(color = pal,
                              opacity = 0.65),
                  marker = list(col = pal,
                                size = 9)
  ) %>%
    plotly::style(hoverlabel = list(
      bgcolor  = "black",
      bordercolor = "transparent",
      font = list(
        color = "white",
        size = 14,
        face = "bold"
      )
    )) %>%
    plotly::layout(
      showlegend = ifelse(nfac > 1,
                          TRUE, FALSE),
      legend = list(
        orientation = "h",
        y = -0.35, x = 0.5,
        yanchor = "middle", xanchor = "center",
        font = list(
          size = 12,
          face = "bold"
        )
      ),
      xaxis = list(
        title = list(
          text = "Year",
          face = "bold",
          size = 14
        ),
        tickfonts = list(
          face = "bold",
          size = 12
        )
      ),
      yaxis = list(
        title = list(
          text = ylab,
          face = "bold",
          size = 14
        ),
        tickfonts = list(
          face = "bold",
          size = 12
        ),
        rangemode = "tozero",
        tickformat = ifelse(
          tolower(var) %in% "prop", "p",
          ifelse(!tolower(var) %in% "prop" &
                   dta[[var]] < 1, ".2f", "d"))
      )
    )
}

