# Set your Git username
usethis::use_git_config(user.name = "ronaldosfjunior")

# Set your Git email
usethis::use_git_config(user.email = "ronaldoj@stanford.edu")

# Initiate a Git repository
use_git()

# Create a new GitHub repository and connect to it
use_github()

usethis::edit_r_environ()
usethis::git_sitrep()


usethis::use_github_token("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")
gitcreds::gitcreds_set("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")
