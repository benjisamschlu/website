
# RUN THIS CODE TO CREATE A POST #
##################################

library(distill)

# Don't put ¨ on the u --> creates bug
create_post(
        "Reproducibility in data-centric analysis", # mandatory
        author = "Benjamin Schluter",
        date = Sys.Date(),
        date_prefix = Sys.Date(),
        edit = interactive()
)
