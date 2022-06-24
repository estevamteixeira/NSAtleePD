# Nova Scotia Atlee Perinatal Database

[<img src="images/3_logos_2021-1.png" width="100%"/>](http://rcp.nshealth.ca/)

## Introduction

This repository hosts the code underlying Nova Scotia Atlee Perinatal Database, a report developed and prepared by members of the Perinatal Epidemiology Research Unit (PERU) in collaboration with the Reproductive Care Program (RCP) of Nova Scotia, and meant to provide a quick reference to the sentinel indicators of perinatal health and care among Nova Scotia residents.

The Nova Scotia Atlee Perinatal Database (NSAPD) is a population-based database that contains detailed province-wide clinical and demographic information from 1988 onwards. Data are abstracted on-site in Nova Scotia health care facilities by health information professionals and are contributed to the NSAPD by these facilities. The Reproductive Care Program (RCP), a program of the IWK Health Centre, is the NSAPD custodian.

The population in the NSAPD includes all reported <ins>**liveborn**</ins> and <ins>**stillborn**</ins> infants at a gestational age of at least 20 weeks or having a birth weight of at least 500 g.

## Prerequisites

The report was built in [R markdown](https://rmarkdown.rstudio.com/index.html). Using the [`bookdown` package](https://bookdown.org/).

Users will need to download [R Markdown](https://github.com/rstudio/rmarkdown) and **bookdown** (`install.packages("bookdown")`) in order to run this report.

All the required code and supporting files can be found in this github repository.

## Data input

The Atlee report deals with sensitive data and those were not provided in this repository. If you want to access them, please contact [RCP](https://rcp.nshealth.ca/contact).

## Folder contents

-   **\_book/** contains the generated book files (default).
-   **images/** contains some images used in the book.
-   **lib/** contains the `HTML` libraries used to display the `HTML` files. Automatically generated when previewing the `.Rmd` files individually.
-   **\.Rmd** each **.Rmd** file contains one chapter of the report. They are sequentially numbered because, by default, the `bookdown` package merges all `.Rmd` files by the order of filenames, e.g., `01-Deliveries_births.Rmd` will appear before `02-Perinatal_IM.Rmd`. If there exists an `.Rmd` file named `index.Rmd`, it will always be treated as the first file when merging all `.Rmd` files.

## Running the report

1.  To successfully deploy the reports, all you need to do is run the `bookdown::render_book()`. This is equivalent to `bookdown::render_book("index.Rmd")`.

## Future reports

Updated reports will be posted on the [RCP web site](http://rcp.nshealth.ca). As always, we welcome comments and suggestions for additional indicators to be included in these future reports ([peru\@dal.ca](mailto:peru@dal.ca)).
