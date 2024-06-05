<h1 align="center">Nvim R</h1>

<div align="center" style="margin-bottom: 10px">
  <img alt="Neovim" src="https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white"/>
  <img alt="Lua" src="https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white"/>
  <a href="https://github.com/rezafikkri/Nvim-R">
    <img alt="Repo Size" src="https://img.shields.io/github/repo-size/rezafikkri/Nvim-R?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
  </a>
</div>

### Demo
<img alt="dashboard" src="img/nvim-r2.png"/>
<img alt="home" src="img/nvim-r1.png"/>

## Requirements
1. Neovim >= [v0.10.0](https://github.com/neovim/neovim/releases/latest)
2. [Nerd font](https://www.nerdfonts.com/)
3. C compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)

## Install
- Remove old config or make backup
```bash
# remove old
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# make backup
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```
- Clone nvim-r
```bash
git clone https://github.com/rezafikkri/Nvim-R.git ~/.config/nvim
```
- Remove `.git` folder
```bash
rm -rf ~/.config/nvim/.git
```
- Start neovim
```bash
nvim
```

### Uninstall
```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

## Configuration
This is simple, you can directly edit config that you have clone. If you have a question or problem, you can create issue, but before it, make sure you have search related issue.

## Keymaps
Info:
- `<leader>` is space
- `<C>` is Ctrl, so if `<C-a>` then `Ctrl+a`
- `<S>` is Shift, so if `<S-a>` then `Shift+a`
- `<A>` is Alt, so if `<A-a>` then `Alt+a`
- To show general keymaps, press `<leader>` (show up after 300ms)

### Window
| Key | Description | Mode |
| --- | --- | --- |
| `<C-h>` | Move the cursor to left window | Normal |
| `<C-j>` | Move the cursor to bottom window | Normal |
| `<C-k>` | Move the cursor to top window | Normal |
| `<C-l>` | Move the cursor to right window | Normal |
| `<C-Up>` | Decrease window size (horizontal) | Normal |
| `<C-Down>` | Increase window size (horizontal) | Normal |
| `<C-Left>` | Descrease window size (vertical) | Normal |
| `<C-Right>` | Increase window size (vertical) | Normal |

### Terminal
| Key | Description | Mode |
| --- | --- | --- |
| `<C-\>` | Toggle (last) float terminal | Normal, Terminal |

Tip:
- Open multiple terminal: `[num] <C-\>` (in normal mode), ex. `1 <C-\>` for open first terminal, `2 <C-\>` for open second terminal, etc.
- If you has open second terminal and want to back first terminal, simple, press `1 <C-\>` again (in normal mode).

### Editing
| Key | Description | Mode |
| --- | --- | --- |
| `<A-j>` | Move text to down | Normal, Visual |
| `<A-k>` | Move text to up | Normal, Visual |
| `<Tab>` | Increase indentation repeatedly | Visual |
| `<S-Tab>` | Decrease indentation repeatedly | Visual |
| `<leader>h` | Clear highlight (ex. highlight after search) | Normal |
| `<leader>t` | Comment line | Normal |

### Exproler
| Key | Description | Mode |
| --- | --- | --- |
| `<leader>e` | Toggle side file explorer | Normal |
| `<leader>a` | Add new file | In file explorer window |
| `<leader>d` | Trash file | In file explorer window |
| `<leader>D` | Delete file | In file explorer window |

Info:
- To see more keymaps for explorer, press `g?`, to back explorer again, press `q`
- Different of *trash* dan *delete* in above keymaps: *trash* is move file or folder to trash (so, file or older can be restore), while *delete* is delete file or folder permanently

### Lazygit
| Key | Description | Mode |
| --- | --- | --- |
| `<leader>g` | Open lazygit | Normal |
| `q` | Close lazygit | In lazygit window |

Info:
- For more keymaps in lazygit, see [here](https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings)
- ex. For close lazygit: if you have press `a` then `c` for commit, and want to cancel, you can press `<Esc>` first and than press `q` for close lazygit

### Buffers
| Key | Description | Mode |
| --- | --- | --- |
| `<leader>c` | Close current buffer | Normal |
| `\]` | Navigate to next buffer | Normal |
| `\[` | Navigate to prev buffer | Normal |
| `<leader>ba` | Close all buffers | Normal |
| `<leader>bn` | Move current buffer to next | Normal |
| `<leader>bp` | Move current buffer to prev | Normal |

### Teloscope
| Key | Description | Mode |
| --- | --- | --- |
| `<leader>ff` | Find files | Normal |
| `<leader>fg` | Live grap (search for a string in your current working directory and get results live as you type.) | Normal |
