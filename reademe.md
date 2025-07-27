# How to manage dotfiles with Stow

From [free article from Medium](https://medium.com/quick-programming/managing-dotfiles-with-gnu-stow-9b04c155ebad)

## Modo de uso


1. Create new folder for dotfiles into home folder
2. Get into home folder and after that, for each configuration we want to preserve, we create a new folder. Ex.:

```bash
mkdir dotfiles
cd dotfiles
mkdir kanata
cd kanta

```

3. Inside `kanata` folder we are goint to create the same folder structure view from home folder that kept the configuration files for `kanata`. Ex.:

```bash
cd kanata
mkdir .config
cd .config
mkdir kanata
cd kanata
cp ~/.config/kanata/home-row-mod.kbd .
```

4. Create links with stow. For that we are goint to do:

```bash
cd ~/dotfiles
stow kanata
```





