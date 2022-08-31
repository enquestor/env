# env
Set up your work environment in seconds.

## Usage
1. [Install ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

2. Clone this repo.
```
git clone git@github.com:Enquestor/env.git
```

3. Create .dotfiles folder that contains all your configs.

Folder structure should be like the following:
```
.dotfiles
├── fish
│   └── config.fish
├── git
│   └── .gitconfig
├── ssh
│   └── config
├── vim
│   └── .vimrc
└── zsh
    ├── .p10k.zsh
    └── .zshrc
```

4. Enable password-less sudo
```
echo $USER # this will show your username

sudo visudo

# add the following line
[your_username]   ALL = (ALL) NOPASSWD: ALL
```

5. Run this playbook

#### localhost
```
ansible-playbook -i ansible_hosts env.yml
```

#### remote
Add an entry in your `~/.ssh/config` and make sure you can ssh to it directly with:
```
ssh <host>
```

Then, remove everything in `ansible_hosts` and add your host to it, so your `ansible_hosts` should look like this:
```
<host>
```

Finally, run the following:
```
ansible-playbook -i ansible_hosts env.yml
```
