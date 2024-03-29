# Notes
## TODO
* Remove code folding
* Learn fugitive
* Learn gitv
* Learn simple-db
* Learn unite
* Learn neocomplcache
* Look into snippets
* Make sure JSHint is working

## Vim
### Find and replace
Select word 'foo' using ```#```. Then use the Ex command: ```:%s//bar/g``` to replace all occurances of 'foo' with 'bar'.

### [Surround](https://github.com/tpope/vim-surround)
* |ds| and |cs| take a target as their first argument.* 
* The targets **b**, **B**, **r**, and **a** are aliases for **)**, **}**, **]**, and **>**.
* Three quote marks, **'**, **"**, **`**, represent themselves, in pairs.
* A **t** is a pair of HTML or XML tags.
* There is also **yS** and **ySS** which indent the surrounded text and place it
on a line of its own.
* A **p** represents a |paragraph|.
* The letters **w**, **W**, and **s** correspond to a |word|, a |WORD|, and a |sentence|,
respectively.

|Mappings|Old text|Command|New text|
|
|Delete surroundings|(123+4\*56)/2|ds)|123+456/2|
|Change surroundings|"Hello \*world!"|cs"<q>|\<q>Hello world!\</q>|
|Add a surrounding to word|Hello w\*orld!|ysiw)|Hello (world)!|
|Add a surrounding to line|Hello w*orld!|yssB|{Hello world!}| 

### [Sparkup](https://github.com/rstacruz/sparkup)
Expand markup ```<C-e>```

Jump to next empty tag/attribute ```<C-n>```

```
html > body > header + article#main > ul > li*3.linkItem-$ > a[href=index.html]{A link} < < < footer
```

```
<html>
  <body>
    <header></header>
    <article id='main'>
      <ul>
        <li class='linkItem-1'>
          <a href='index.html'>A link</a>
        </li>
        <li class='linkItem-2'>
          <a href='index.html'>A link</a>
        </li>
        <li class='linkItem-3'>
          <a href='index.html'>A link</a>
        </li>
      </ul>
    </article>
    <footer></footer>
  </body>
</html>
```

### [Fugitive](https://github.com/tpope/vim-fugitive/blob/master/doc/fugitive.txt)

## Unix
### Open file in an app from command-line
```open -a Mou filename.md```

## Install
### Brew
* node
* ctags
* tmux
* rbenv
* ack
* git
* ruby-build

### Apps
* Mou
* Pocket
* Evernote
* Chrome
* Anvil
* Colloquy
* iTerm
* RescueTime
* Alfred

setup
  install vim
    brew install vim --with-lua --override-system-vim
  powerline
    ? brew install python
    ? brew link python
    pip install --user git+git://github.com/Lokaltog/powerline
  fonts
    https://github.com/Lokaltog/powerline-fonts/blob/master/Meslo/Meslo%20LG%20S%20DZ%20Regular%20for%20Powerline.otf
  vundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +bundleinstall +qall
  link dotfiles
    ln -s /vim/.vim .vim
    ln -s /vim/.vimrc .vimrc
    ln -s /vim/.vimrc.bundles .vimrc.bundles
  the silver searcher
    brew install the_silver_searcher
  tagbar
    brew install ctags
  jshint
    brew install node
    sudo npm install -g jshint
    ln -s /jshintrc .jshintrc


todo
setup unite for
  <leader>ub - open buffers
  <leader>uf - filename search
  <leader>ua - file content search
split .vimrc into multiple files
make brew vim default
switch to neobundleinstall
check vimproc https://github.com/shougo/vimproc.vim
check neosnippets https://github.com/shougo/neosnippet
check out context-filetype https://github.com/shougo/context_filetype.vim

