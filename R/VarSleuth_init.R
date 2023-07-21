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

# Load the git2r package
if (!require(git2r)) {
  install.packages("git2r")
}


# Get a reference to your repository
repo <- git2r::repository("../VarSleuth")

# Add the README.Rmd and README.md to the staging area for git
git2r::add(repo, "README.Rmd")
git2r::add(repo, "README.md")

# Commit the changes
git2r::commit(repo, "Added a README")

# Push the changes to GitHub
system("git config --global http.followRedirects true")
Sys.getenv("GITHUB_PAT")
git2r::remotes(repo)
git2r::remote_set_url(repo, "origin", "https://github.com/ronaldosfjunior/VarSleuth.git")
creds <- git2r::cred_token(path.expand("~/.git-credentials"))
git2r::push(repo, credentials = creds, refspec = "refs/heads/main:refs/heads/main")
git2r::push(repo, "origin", "master")
