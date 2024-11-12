## Keybindings and Shortcuts Documentation

This document lists the keybindings and shortcuts defined in the provided Lua configuration files.

**Índice**

* [General Keybindings](#general-keybindings)
* [Harpoon Keybindings](#harpoon-keybindings)
* [DAP Keybindings](#dap-keybindings)
* [Window Keybindings](#window-keybindings)
* [Telescope Keybindings](#telescope-keybindings)
* [LSP Keybindings](#lsp-keybindings)
* [Gitsigns Keybindings](#gitsigns-keybindings)
* [CMP Keybindings](#cmp-keybindings)


---

### General Keybindings <a id="general-keybindings"></a>

* `<C-s>`: Save the current file (normal mode)
* `<leader>ww`: Toggle word wrap (normal mode)
* `<leader>qq`: Quit all windows (normal mode)
* `<leader>wd`: Close the current window (normal mode)
* `<leader>;`: Add a semicolon at the end of the line (normal mode)
* `<C-h>`: Move to the window to the left (normal mode)
* `<C-l>`: Move to the window to the right (normal mode)
* `<C-j>`: Move to the window below (normal mode)
* `<C-k>`: Move to the window above (normal mode)
* `<Esc>`: Clear search highlighting (normal mode); Exit terminal mode (terminal mode)
* `<Up>`: Increase window height (normal mode)
* `<Down>`: Decrease window height (normal mode)
* `<Left>`: Decrease window width (normal mode)
* `<Right>`: Increase window width (normal mode)
* `<leader>bd`: Close buffer (normal mode)
* `<A-n>`: Create new tab (normal mode)
* `<A-l>`: Next tab. Note: Overlaps with Harpoon. (normal mode)
* `<A-h>`: Previous tab. Note: Overlaps with Harpoon. (normal mode)
* `<A-w>`: Close tab (normal mode)
* `<A-1>` - `<A-9>`: Go to tab 1 through 9 (normal mode, after `TabEnter` event)
* `<leader>fc`: Format using Conform (normal mode)
* `<`: Decrease indent in visual mode
* `>`: Increase indent in visual mode



### Harpoon Keybindings <a id="harpoon-keybindings"></a>

* `<leader>hm`: Add file to Harpoon (normal mode)
* `<leader>hh`: Toggle Harpoon quick menu (normal mode)
* `<A-h>`: Navigate to Harpoon file 1. Note: Overlaps with tabs. (normal mode)
* `<A-j>`: Navigate to Harpoon file 2 (normal mode)
* `<A-k>`: Navigate to Harpoon file 3 (normal mode)
* `<A-l>`: Navigate to Harpoon file 4. Note: Overlaps with tabs. (normal mode)
* `<leader>th>`: Go to Harpoon terminal 1 (normal mode)
* `<leader>tj>`: Go to Harpoon terminal 2 (normal mode)
* `<leader>tk>`: Go to Harpoon terminal 3 (normal mode)
* `<leader>tl>`: Go to Harpoon terminal 4 (normal mode)


### DAP Keybindings <a id="dap-keybindings"></a>

* `<leader>db`: Toggle breakpoint (normal mode)
* `<leader>dc`: Continue debugging (normal mode)
* `<leader>ds`: Step into (normal mode)
* `<leader>dr`: Open REPL (normal mode)
* `<F5>`: Start/Continue debugging (normal mode)
* `<F1>`: Step into (normal mode)
* `<F2>`: Step over (normal mode)
* `<F3>`: Step out (normal mode)
* `<leader>B`: Set breakpoint with condition (normal mode)
* `<F7>`: Toggle last session result (normal mode)


### Window Keybindings <a id="window-keybindings"></a>

* `<leader>-`: Split window below (normal mode)
* `<leader>|`: Split window right (normal mode)



### Telescope Keybindings <a id="telescope-keybindings"></a>

* `<leader>ff`: Find files (normal mode)
* `<leader>fg`: Live grep (normal mode)
* `<leader>gg`: Find Git files (normal mode)
* `<leader>,`: Find buffers (normal mode)
* `<leader>fh`: Help tags (normal mode)
* `<leader>fs`: Harpoon possession list (normal mode)
* `<leader>hs`: Harpoon marks (normal mode)



### LSP Keybindings <a id="lsp-keybindings"></a>

* `gd`: Go to definition (normal mode, buffer with LSP)
* `gr`: Go to references (normal mode, buffer with LSP)
* `gI`: Go to implementation (normal mode, buffer with LSP)
* `<leader>dd`: Go to type definition (normal mode, buffer with LSP)
* `<leader>ds`: Document symbols (normal mode, buffer with LSP)
* `<leader>ws`: Workspace symbols (normal mode, buffer with LSP)
* `<leader>rn`: Rename symbol (normal mode, buffer with LSP)
* `<leader>ca`: Code action (normal mode, buffer with LSP)
* `gD`: Go to declaration (normal mode, buffer with LSP)
* `K`:  Hover documentation (normal mode, buffer with LSP)
* `<leader>cs`: Run codelens (normal mode, buffer with LSP)
* `<leader>cc`: Refresh codelens (normal mode, buffer with LSP)
* `<leader>cd`: Line diagnostics (normal mode, buffer with LSP)
* `]d`: Next diagnostic (normal mode, buffer with LSP)
* `[d`: Previous diagnostic (normal mode, buffer with LSP)
* `]e`: Next error (normal mode, buffer with LSP)
* `[e`: Previous error (normal mode, buffer with LSP)
* `]w`: Next warning (normal mode, buffer with LSP)
* `[w`: Previous warning (normal mode, buffer with LSP)
* `<leader>th`: Toggle inlay hints (normal mode, if supported by LSP)




### Gitsigns Keybindings <a id="gitsigns-keybindings"></a>

* `]h`: Next hunk (normal mode, buffer with Gitsigns)
* `[h`: Previous hunk (normal mode, buffer with Gitsigns)
* `<leader>ghs`: Stage hunk (normal & visual modes, buffer with Gitsigns)
* `<leader>ghr`: Reset hunk (normal & visual modes, buffer with Gitsigns)
* `<leader>ghS`: Stage buffer (normal mode, buffer with Gitsigns)
* `<leader>ghu`: Undo stage hunk (normal mode, buffer with Gitsigns)
* `<leader>ghR`: Reset buffer (normal mode, buffer with Gitsigns)
* `<leader>ghp`: Preview hunk inline (normal mode, buffer with Gitsigns)
* `<leader>ghb`: Blame line (normal mode, buffer with Gitsigns)
* `<leader>ghd`: Diff this (normal mode, buffer with Gitsigns)
* `<leader>ghD`: Diff this ~ (normal mode, buffer with Gitsigns)
* `ih`: Select hunk (operator & visual modes, buffer with Gitsigns)


### CMP Keybindings <a id="cmp-keybindings"></a>

* `<C-k>`: Select previous completion item (insert mode)
* `<C-j>`: Select next completion item (insert mode)
* `<Tab>`: Next completion item / expand snippet (insert & select modes)
* `<S-Tab>`: Previous completion item / jump back in snippet (insert & select modes)
* `<C-u>`: Scroll up in completion documentation (insert mode)
* `<C-d>`: Scroll down in completion documentation (insert mode)
* `<C-Space>`: Show completion menu (insert mode)
* `<C-c>`: Abort completion (insert mode)
* `<CR>`: Confirm completion (insert mode)
