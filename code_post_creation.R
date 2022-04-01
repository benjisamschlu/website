
# RUN THIS CODE TO CREATE A POST #
##################################

library(distill)

# Don't put ¨ on the u --> creates bug
create_post(
        "Years and ages aggregation: a solution to life table computation at small scale?", # mandatory
        author = "Benjamin Schluter",
        date = Sys.Date(),
        date_prefix = Sys.Date(),
        edit = interactive()
)
