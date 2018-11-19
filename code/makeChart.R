## @knitr makeCharts

ggplot(sdat,
       aes(x = weather_source, fill = female)) +
  geom_bar(position = "dodge", colour="black") +
  ggtitle(paste0("Weather source by Gender: ",
                 params$region," Region")) +
  xlab("Weather Source Preference") + 
  ylab("Number of Respondents") +
  scale_fill_manual(values=c("skyblue", "palevioletred"),
                    name="Gender", 
                    breaks=c(FALSE,TRUE),
                    labels=c("Male", "Female")) +
  coord_flip() +
  theme_fivethirtyeight()