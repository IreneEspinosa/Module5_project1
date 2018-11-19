# create table summary for ages
tb1 <- sdat %>%
  select(age) %>%
  table() %>%
  prop.table() * 100
# create table summary for gender
tb2 <- sdat %>%
  select(female) %>%
  table() %>%
  prop.table() * 100
# create table summary for income
tb3 <- sdat %>%
  select(hhold_income) %>%
  table() %>%
  prop.table() * 100

# merge and convert tables to data frame
dt1 <- as.data.frame(tb1)
dt2 <- as.data.frame(tb2)
dt3 <- as.data.frame(tb3)[-6,]
dt <- merge(dt1,dt2, by = 0, all= TRUE)[-1]
dt <- merge (dt, dt3,  by = 0, all = TRUE)[-1]

# use kable from knitr package to make table and use kable styling from kableExtra package
knitr::kable(dt, format = "html",
             col.names = c("Category", "%","Category", "%","Category", "%"),
             digits = 2,
             caption = "Demographics of Survey Respondents") %>%
  kableExtra::kable_styling(bootstrap_options = "striped", full_width = FALSE) %>%
  kableExtra::add_header_above( c( "Age" = 2, "Gender" = 2, "Income" = 2))
