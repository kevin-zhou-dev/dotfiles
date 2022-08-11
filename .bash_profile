# bash conditional expressions 
# -f True if file exists and is a regular file 
# -r True if file exists and is a readable file.

# when .bash_profile is executed (loginshell), so is .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
