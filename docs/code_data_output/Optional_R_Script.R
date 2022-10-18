# alternative (Option 3) for creating a dataset with all category combos
nflx_tmp <- pivot_wider(nflx_tv_plot2, names_from = min_age, values_from = total)
nflx_tv_plot2 <- pivot_longer(nflx_tmp, cols=c("13","17","0","7"), 
                              names_to = "min_age", 
                              values_to = "total") |>
  # convert age to a factor
  mutate(min_ageF = factor(min_age, levels=c(0,7,13,17))) |> 
  glimpse()

# convert missing values to zeros
nflx_tv_plot2[is.na(nflx_tv_plot2)] <- 0