# Use the usethis package
library(usethis)
setwd("/home/ronaldoj/Dropbox/Stanford/Projects/P5/VarSleuth")

# Set your Git username
usethis::use_git_config(user.name = "ronaldosfjunior")

# Set your Git email
usethis::use_git_config(user.email = "ronaldoj@stanford.edu")


# Initiate a Git repository
use_git()

# Create a new GitHub repository and connect to it
#use_github()

usethis::edit_r_environ()
usethis::git_sitrep()

# usethis::use_github_token("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")
# Use the usethis package
library(usethis)

#######
# Create a README.Rmd file
#######

use_readme_rmd()

# Install the knitr package if you haven't already
if (!require(knitr)) {
  install.packages("knitr")
}

# Render the README.Rmd to a Markdown file
knitr::knit("README.Rmd")

# Read the .md file into a character vector
lines <- readLines("README.md")

# Find the lines to exclude
exclude <- grep("title|output", lines)

# Remove the excluded lines
lines <- lines[-exclude]

# Write the lines back to the .md file
writeLines(lines, "README.md")


# Load the git2r package
if (!require(git2r)) {
  install.packages("git2r")
}

library(git2r)
repo <- git2r::repository(".")
git2r::add(repo, "README.Rmd")
git2r::commit(repo, "Update README.Rmd")
# Delete the existing remote
git2r::remote_remove(repo, "origin")

# Add the remote back with the correct SSH URL
git2r::remote_add(repo, "origin", "git@github.com:ronaldosfjunior/VarSleuth.git")


git2r::push(repo, "origin", "master")  # replace 'master' with your branch name if different
remotes(repo)
