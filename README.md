# bash-scripts
My useful bash scripts

## Use

Clone the repo into your HOME

```
cd
git@github.com:AvraamMavridis/bash-scripts.git
```

Add `alias` to your `.bash_profile`

```
alias npminit='sh $HOME/bash-scripts/npminit.sh'
alias npmdep='sh $HOME/bash-scripts/npmdep.sh'
alias npmup='sh $HOME/bash-scripts/npmup.sh'
```


###npmdep

Lists the depedencies with a small description.

![Image](http://s31.postimg.org/eb7ntvdbv/Screen_Shot_2016_04_25_at_20_46_40.png)

###npmdep

Update locally the depedencies to their latest version respecting semver.
The changes are saved in the `package.json`
Then it creates and pushes a branch to the remote repo from which you can create a pull request. 

