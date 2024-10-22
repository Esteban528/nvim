# Keyboard Shortcuts

1. [Keyboard Shortcuts](#keyboard-shortcuts)  
   1.1. [Leader Key](#leader-key)  
   1.2. [Save File](#save-file)  
   1.3. [Toggle Neotree](#toggle-neotree)  
   1.4. [Close Windows](#close-windows)  
   1.5. [Window Navigation](#window-navigation)  
   1.6. [Resize Window](#resize-window)  
   1.7. [Clear Highlight](#clear-highlight)

2. [Buffer Mappings (Barbar)](#buffer-mappings-barbar)  
   2.1. [Previous and Next Buffers](#previous-and-next-buffers)  
   2.2. [Reorder Buffers](#reorder-buffers)  
   2.3. [Buffer Selection and Closing](#buffer-selection-and-closing)

3. [Debugging (DAP)](#debugging-dap)  
   3.1. [Breakpoints and Execution](#breakpoints-and-execution)  
   3.2. [Open REPL](#open-repl)

4. [Terminal](#terminal)  
   4.1. [Toggle Terminal](#toggle-terminal)

5. [Windows](#windows)  
   5.1. [Horizontal and Vertical Splits](#horizontal-and-vertical-splits)

6. [nvim-cmp Configuration](#nvim-cmp-configuration)  
   6.1. [Insert Mode Shortcuts](#insert-mode-shortcuts)  
   6.2. [Additional Behavior](#additional-behavior)

7. [DAP Debugging](#dap-debugging)

8. [LSP](#lsp)  
   8.1. [LSP Navigation](#lsp-navigation)  
   8.2. [LSP Editing](#lsp-editing)  
   8.3. [Declaration and Documentation](#declaration-and-documentation)

9. [Multi-cursor](#multi-cursor)

10. [Telescope](#telescope)  
    10.1. [File and Text Search](#file-and-text-search)  
    10.2. [Testing](#testing)

11. [Neo-tree](#neo-tree)  
    11.1. [Navigation and Selection](#navigation-and-selection)

12. [Editing Styles](#editing-styles)

13. [Other Shortcuts](#other-shortcuts)

- **Leader Key**:  
  `space`

- **Save File**:  
  `Ctrl + s`  
  `:w<CR>`

- **Toggle Neotree**:  
  `<leader> n`  
  `Neotree toggle`

- **Close All Windows**:  
  `<leader> qq`  
  `:Neotree toggle<CR>:qa!<CR>`

- **Close Current Window**:  
  `<leader> wd`  
  `:q<CR>`

- **Add Semicolon at the End of Line**:  
  `<leader>;`  
  `"$a;<ESC>"`

- **Window Navigation**:

  - `Ctrl + h`: Move to the left window
  - `Ctrl + j`: Move to the bottom window
  - `Ctrl + k`: Move to the top window
  - `Ctrl + l`: Move to the right window

- **Clear Highlight**:  
  `Esc`  
  `:nohl<CR>`

- **Resize Window**:
  - `Up Arrow`: Increase height
  - `Down Arrow`: Decrease height
  - `Left Arrow`: Decrease width
  - `Right Arrow`: Increase width

## Buffer Mappings (Barbar)

- **Go to Previous Buffer**:  
  `H`  
  `<Cmd>BufferPrevious<CR>`

- **Go to Next Buffer**:  
  `L`  
  `<Cmd>BufferNext<CR>`

- **Reorder Buffers**:

  - `Alt + <`: Move buffer left
  - `Alt + >`: Move buffer right

- **Go to Buffer at Position**:

  - `Alt + 1`: `<Cmd>BufferGoto 1<CR>`
  - `Alt + 2`: `<Cmd>BufferGoto 2<CR>`
  - `Alt + 3`: `<Cmd>BufferGoto 3<CR>`
  - `Alt + 4`: `<Cmd>BufferGoto 4<CR>`
  - `Alt + 5`: `<Cmd>BufferGoto 5<CR>`
  - `Alt + 6`: `<Cmd>BufferGoto 6<CR>`
  - `Alt + 7`: `<Cmd>BufferGoto 7<CR>`
  - `Alt + 8`: `<Cmd>BufferGoto 8<CR>`
  - `Alt + 9`: `<Cmd>BufferGoto 9<CR>`
  - `Alt + 0`: `<Cmd>BufferLast<CR>`

- **Pin/Unpin Buffer**:  
  `Alt + p`  
  `<Cmd>BufferPin<CR>`

- **Close Buffer**:  
  `<Leader> bd`  
  `<Cmd>BufferClose<CR>`

- **Close All Buffers Except Current or Pinned**:  
  `<Alt + W>`  
  `<Cmd>BufferCloseAllButCurrentOrPinned<CR>`

- **Magic Buffer Selection Mode**:  
  `Ctrl + p`  
  `<Cmd>BufferPick<CR>`

- **Sort Automatically By**:
  - `<Space> bb`: Sort by buffer number
  - `<Space> bl`: Sort by language
  - `<Space> bw`: Sort by window number

## Debugging (DAP)

- **Toggle Breakpoint**:  
  `<leader> db`  
  `:lua require'dap'.toggle_breakpoint()<CR>`

- **Continue**:  
  `<leader> dc`  
  `:lua require'dap'.continue()<CR>`

- **Step Into**:  
  `<leader> ds`  
  `:lua require'dap'.step_into()<CR>`

- **Open REPL**:  
  `<leader> dr`  
  `:lua require'dap'.repl.open()<CR>`

## Terminal

- **Toggle Terminal**:  
  `<leader> ft`  
  `:ToggleTerm<CR>`

## Windows

- **Split Window Horizontally**:  
  `<leader> -`  
  `<C-W>s`

- **Split Window Vertically**:  
  `<leader> |`  
  `<C-W>v`

# Keyboard Shortcuts for nvim-cmp Configuration

## Insert Mode Shortcuts

- **`<S-k>`**: Select the previous item in the completion menu.
- **`<S-j>`**: Select the next item in the completion menu.
- **`<Tab>`**:
  - If the completion menu is visible, select the next item.
  - If a snippet can be expanded or jumped, expand or jump.
  - Otherwise, perform the default action.
- **`<S-Tab>`**:
  - If the completion menu is visible, select the previous item.
  - If a snippet jump is possible in reverse, jump backward.
  - Otherwise, perform the default action.
- **`<C-u>`**: Scroll the completion documentation up 4 lines.
- **`<C-d>`**: Scroll the completion documentation down 4 lines.
- **`<C-Space>`**: Manually trigger completion.
- **`<C-c>`**: Abort the completion process.
- **`<CR>` (Enter)**: Confirm the selected completion item (even if not highlighted).

### Additional Behavior

- The `Tab` and `Shift-Tab` keys are context-sensitive:
  - They work with snippets (`luasnip`) to allow expansion or navigation through placeholders.
  - They also handle item selection in the completion list when it is open.

## DAP DEBUGGING

- **`<F5>`**: Start/Continue debugging.
- **`<F1>`**: Step into the next instruction.
- **`<F2>`**: Step over to the next instruction.
- **`<F3>`**: Step out of the current instruction.
- **`<leader>db`**: Toggle a breakpoint.
- **`<leader>B`**: Set a conditional breakpoint.
- **`<F7>`**: Show results from the last debugging session.

# LSP

## LSP Navigation

- `gd`: Go to the definition of the word under the cursor.
- `gr`: Find references of the word under the cursor.
- `gI`: Go to the implementation of the word under the cursor.
- `<leader>D`: Go to the type of the word under the cursor.
- `<leader>ds`: Search all symbols in the current document.
- `<leader>ws`: Search all symbols in the current workspace.

## LSP Editing

- `<leader>rn`: Rename the variable under the cursor.
- `<leader>ca`: Execute a code action.

## Declaration and Documentation

- `gD`: Go to the declaration of the word under the cursor.

## Other Shortcuts

- `<leader>th`: Toggle "inlay hints" in the code (if supported by the server).

## Multi-cursor

- `<C-n>`

# Telescope

- **Find Files**:

  - **Command:** `Telescope find files`
  - **Shortcut:** `<leader>ff`

- **Text Search**:

  - **Command:** `Telescope live grep`
  - **Shortcut:** `<leader>fg`

- **List Open Buffers**:

  - **Command:** `Telescope buffers`
  - **Shortcut:** `<leader>,`

- **Neovim Help**:
  - **Command:** `Telescope help tags`
  - **Shortcut:** `<leader>fh`

### Run Tests

- `tn`: Run the nearest test.
- `tN`: Run all tests in the current file.

### Navigate Tests

- `tp`: Navigate to the previous test.
- `tn`: Navigate to the next test.

### Test Results

- `tR`: Show test results.
- `tS`: Stop running tests.

### Other Commands

- `to`: Open test output.
- `tl`: Show the last test result.

### Configuration

- `tC`: Configure Neotest options.

# Neo-tree

## Navigation and Selection

Within the tree:

- `<space>`: Toggle node
- `<2-LeftMouse>`: Open
- `<cr>`: Open
- `l`: Open
- `<esc>`: Cancel (close preview or floating window of neo-tree)
- `P`: Toggle preview
- `S`: Open in horizontal split
- `V`: Open in vertical split
- `i`: Show file information
- `r`: Rename
- `d`: Delete
- `y`: Copy path
- `x`: Cut path
- `p`: Paste
- `o`: Open as
- `m`: Show action menu
- `R`: Reload
- `a`: Create new file
- `D`: Delete directory
- `g`: Open in Git

## Navigation Mappings

- **Navigation in the tree structure**:
  - `h`: Go to the parent folder
  - `l`: Go to the child folder

# Editing Styles

- **Inline Editing Mode**:  
  `E` or `ee`

- **Block Editing Mode**:  
  `B` or `bb`

- **Queue Editing Mode**:  
  `Q` or `qq`

# Other Shortcuts

- `F11`: Full screen.
- `F12`: Exit full screen.
