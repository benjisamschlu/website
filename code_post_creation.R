
# RUN THIS CODE TO CREATE A POST #
##################################

# Don't put ¨ on the u --> creates bug
create_post(
        "Temporal smoother with Bayes", # mandatory
        author = "Benjamin Schluter",
        date = Sys.Date(),
        date_prefix = Sys.Date(),
        edit = interactive()
)
