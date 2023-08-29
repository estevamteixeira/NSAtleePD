--- 
title: "Nova Scotia Atlee Perinatal Database"
params:
  year1: 2011
  year2: 2020
subtitle: "Report of Indicators: 2011-2020"
author: "Reproductive Care Program of Nova Scotia"
date: "2023-08-29"
knit: bookdown::render_book
site: bookdown::bookdown_site
output: bookdown::bs4_book
documentclass: krantz
monofont: "Source Code Pro"
monofontoptions: "Scale=0.7"
biblio-style: apalike
link-citations: yes
colorlinks: yes
graphics: yes
description: "The data presented in this report are meant to provide a quick reference to the sentinel indicators of perinatal health and care among Nova Scotia residents. We hope this report will assist with the development and monitoring of standards of care and will trigger research questions that can be pursued by researchers and trainees."
github-repo: "https://github.com/estevamteixeira/anomaly-report"
cover-image: "images/Cover2011-2020.pdf"
pdf-cover-image: "images/Cover2011-2020.pdf"
url: http://rcp.nshealth.ca/
---





# Dedication {-}

We would like to dedicate this year's report to Becky Attenborough. The Nova Scotia Atlee Perinatal Database (NSAPD), upon which this report of perinatal indicator is based, has been managed since its inception in 1980 by the Reproductive Care Program (RCP) of Nova Scotia. Rebecca (Becky) Attenborough has managed RCP for the past 30 years. We say good-bye to Becky in this role with sadness but, on the other hand, with the greatest wishes for a well-earned and happy retirement.

Becky's tireless dedication to the role has contributed to the success of the NSAPD in immeasurable ways. On the technical side, Becky shepherded the transition from legacy software into a modern relational database. To do so required the utmost administrative skill to ensure facilities were willing and able to contribute uninterrupted data despite reorganizations and resource reallocation. At the heart of her success is Becky's decade of experience with vulnerable newborns from across the province as a neonatal intensive care nurse and later as head nurse. The knowledge and compassion that she accumulated was incorporated into the development of the NSAPD with substantial influence on the amount and relevance of clinical information captured and incorporating standardized reporting. Most importantly, Becky has been the single biggest user of the NSAPD to guide the planning and management of perinatal care provision, facilitate research, and support the invaluable quality review work that she
and her team of perinatal nurse consultants have undertaken across the province alongside RCP's medical advisors. Her encyclopedic knowledge of the perinatal care provided throughout the province, keen eye for detail, relentless work ethic, and indefatigable good humour have been essential in the survival and success of the NSAPD.

We sincerely thank Becky for her substantial contributions. They have and will continue to benefit all Nova Scotians by ensuring optimal health and well-being of mothers and their newborns.


\begin{center}\includegraphics[width=0.4\linewidth]{images/Becky20} \end{center}

# Acknowledgements {-}

This Nova Scotia Atlee Perinatal Database Report was developed and prepared by members of the Perinatal
Epidemiology Research Unit in collaboration with the Reproductive Care Program (RCP) of Nova Scotia. All
members of RCP provided valuable input, but we would like to especially acknowledge John Fahey (Research Analyst), Becky Attenborough (Manager), Leeanne Lauzon (Perinatal Nurse Consultant), and Irene Gagnon (Clinical Data Coordinator). We would also like to thank Alexa MacDonald, Brian Maguire, and Colleen O'Connell who helped to set up the compilation to allow reports to be generated on an ongoing basis. Of course, all of the health information professionals, health care providers, and administrators at participating hospitals are invaluable to maintaining the high quality data found within the Atlee Perinatal Database.

**Members of the Perinatal Epidemiology Research Unit Departments of Obstetrics & Gynaecology and Pediatrics**

- [Dr. Alexander Allen (deceased)](https://medicine.dal.ca/research/peru/our-people/faculty.html)

- [Azar Mehrabadi, PhD, Assistant Professor](https://medicine.dal.ca/departments/department-sites/pediatrics/our-people/our-faculty/azar-mehrabadi.html)
- [Stefan Kuhle, MD, PhD, Associate Professor](https://www.unimedizin-mainz.de/pe/startseite/team.html)
- [Christy Woolcott, PhD, Director, Associate Professor](https://medicine.dal.ca/departments/department-sites/pediatrics/our-people/our-faculty/christy-woolcott.html)
- [Linda Dodds, PhD, Past Director, Professor](https://medicine.dal.ca/departments/department-sites/pediatrics/our-people/our-faculty/linda-dodds.html)

\begin{figure*}[b]
\centering
\includegraphics[width=0.95\textwidth]{images/3_logos_3.png}
\end{figure*}

# Introduction {-}

## Purpose of Report {-}

The data presented in this Report are meant to provide a quick reference to the sentinel indicators of perinatal health and care among Nova Scotia residents. In addition, we hope that the data in this Report will assist with the development and monitoring of standards of care and will trigger research questions that can be pursued by
researchers and trainees. With the COVID19 pandemic, the results from this report may be particularly invaluable for hypothesis generation.

## Nova Scotia Atlee Perinatal Database {-}

The Nova Scotia Atlee Perinatal Database (NSAPD) is a population-based database that contains detailed
province-wide clinical and demographic information from 1988 onwards. Data are abstracted on-site in Nova Scotia health care facilities by health information professionals and are contributed to the NSAPD by these facilities. The Reproductive Care Program (RCP), a program of the IWK Health Centre, is the NSAPD custodian.

The population in the NSAPD includes all reported liveborn and stillborn infants at a gestational age of at least 20 weeks or having a birth weight of at least 500 g. Every effort is made to ensure that the NSAPD includes perinatal events for all Nova Scotia residents. Events that occurred in Nova Scotia facilities that do not have active maternity services are collected, as are events that occur in New Brunswick facilities where Nova Scotia residents regularly seek care. Home births have been included in the NSAPD since the introduction of regulated
midwifery in 2009.

## Important Notes Regarding Definitions and Figures {-}

A Glossary of all terms can be found at the end of this report.

The term "birth" is differentiated from "delivery". A delivery refers to the completed pregnancy, regardless of the number of infants born. Birth refers to the live born or stillborn infant. For example, when a woman delivers twins, one delivery and two births are represented.

The definition of gestational age, which is detailed in the Glossary, incorporates information on ultrasound measurements, as well as last menstrual period date and clinical estimate of gestational age.

It is important to note the scale that is used in the Figures. In some instances, the rate of a particular indicator will appear to vary greatly from year to year, but the apparent variation may be due to a narrow range for the scale.

## Future Reports {-}

We plan to produce similar reports on a regular basis. Updated reports will be posted on the RCP web site [(http://rcp.nshealth.ca)](http://rcp.nshealth.ca). As always, we welcome comments and suggestions for additional indicators to be included in these future reports [(peru@dal.ca)](peru@dal.ca).
