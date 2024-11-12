## Documentación de Atajos de Teclado

**Índice**

* [Atajos Generales](#general-keybindings)
* [Atajos de Harpoon](#harpoon-keybindings)
* [Atajos de DAP](#dap-keybindings)
* [Atajos de Ventana](#window-keybindings)
* [Atajos de Telescope](#telescope-keybindings)
* [Atajos de LSP](#lsp-keybindings)
* [Atajos de Gitsigns](#gitsigns-keybindings)
* [Atajos de CMP](#cmp-keybindings)


---

### Atajos Generales <a id="general-keybindings"></a>

* `<C-s>`: Guardar el archivo actual (modo normal)
* `<leader>ww`: Alternar ajuste de línea (modo normal)
* `<leader>qq`: Cerrar todas las ventanas (modo normal)
* `<leader>wd`: Cerrar la ventana actual (modo normal)
* `<leader>;`: Agregar un punto y coma al final de la línea (modo normal)
* `<C-h>`: Mover a la ventana izquierda (modo normal)
* `<C-l>`: Mover a la ventana derecha (modo normal)
* `<C-j>`: Mover a la ventana inferior (modo normal)
* `<C-k>`: Mover a la ventana superior (modo normal)
* `<Esc>`: Limpiar resaltado de búsqueda (modo normal); Salir del modo terminal (modo terminal)
* `<Up>`: Aumentar altura de la ventana (modo normal)
* `<Down>`: Disminuir altura de la ventana (modo normal)
* `<Left>`: Disminuir ancho de la ventana (modo normal)
* `<Right>`: Aumentar ancho de la ventana (modo normal)
* `<leader>bd`: Cerrar buffer (modo normal)
* `<A-n>`: Crear nueva pestaña (modo normal)
* `<A-l>`: Siguiente pestaña. Nota: Se superpone con Harpoon. (modo normal)
* `<A-h>`: Pestaña anterior. Nota: Se superpone con Harpoon. (modo normal)
* `<A-w>`: Cerrar pestaña (modo normal)
* `<A-1>` - `<A-9>`: Ir a la pestaña 1 a la 9 (modo normal, después del evento `TabEnter`)
* `<leader>fc`: Formatear usando Conform (modo normal)
* `<`: Disminuir indentación en modo visual
* `>`: Aumentar indentación en modo visual



### Atajos de Harpoon <a id="harpoon-keybindings"></a>

* `<leader>hm`: Agregar archivo a Harpoon (modo normal)
* `<leader>hh`: Alternar menú rápido de Harpoon (modo normal)
* `<A-h>`: Navegar al archivo 1 en Harpoon. Nota: Se superpone con pestañas. (modo normal)
* `<A-j>`: Navegar al archivo 2 en Harpoon (modo normal)
* `<A-k>`: Navegar al archivo 3 en Harpoon (modo normal)
* `<A-l>`: Navegar al archivo 4 en Harpoon. Nota: Se superpone con pestañas. (modo normal)
* `<leader>th>`: Ir a la terminal 1 en Harpoon (modo normal)
* `<leader>tj>`: Ir a la terminal 2 en Harpoon (modo normal)
* `<leader>tk>`: Ir a la terminal 3 en Harpoon (modo normal)
* `<leader>tl>`: Ir a la terminal 4 en Harpoon (modo normal)


### Atajos de DAP <a id="dap-keybindings"></a>

* `<leader>db`: Alternar punto de interrupción (modo normal)
* `<leader>dc`: Continuar depuración (modo normal)
* `<leader>ds`: Entrar en función (modo normal)
* `<leader>dr`: Abrir REPL (modo normal)
* `<F5>`: Iniciar/Continuar depuración (modo normal)
* `<F1>`: Entrar en función (modo normal)
* `<F2>`: Pasar por encima (modo normal)
* `<F3>`: Salir de función (modo normal)
* `<leader>B`: Establecer punto de interrupción con condición (modo normal)
* `<F7>`: Mostrar último resultado de la sesión (modo normal)


### Atajos de Ventana <a id="window-keybindings"></a>

* `<leader>-`: Dividir ventana abajo (modo normal)
* `<leader>|`: Dividir ventana a la derecha (modo normal)



### Atajos de Telescope <a id="telescope-keybindings"></a>

* `<leader>ff`: Buscar archivos (modo normal)
* `<leader>fg`: Buscar con expresiones regulares en vivo (modo normal)
* `<leader>gg`: Buscar archivos Git (modo normal)
* `<leader>,`: Buscar buffers (modo normal)
* `<leader>fh`: Etiquetas de ayuda (modo normal)
* `<leader>fs`: Lista de posesiones de Harpoon (modo normal)
* `<leader>hs`: Marcas de Harpoon (modo normal)



### Atajos de LSP <a id="lsp-keybindings"></a>

* `gd`: Ir a la definición (modo normal, buffer con LSP)
* `gr`: Ir a las referencias (modo normal, buffer con LSP)
* `gI`: Ir a la implementación (modo normal, buffer con LSP)
* `<leader>dd`: Ir a la definición de tipo (modo normal, buffer con LSP)
* `<leader>ds`: Símbolos del documento (modo normal, buffer con LSP)
* `<leader>ws`: Símbolos del espacio de trabajo (modo normal, buffer con LSP)
* `<leader>rn`: Renombrar símbolo (modo normal, buffer con LSP)
* `<leader>ca`: Acción de código (modo normal, buffer con LSP)
* `gD`: Ir a la declaración (modo normal, buffer con LSP)
* `K`:  Mostrar documentación flotante (modo normal, buffer con LSP)
* `<leader>cs`: Ejecutar CodeLens (modo normal, buffer con LSP)
* `<leader>cc`: Refrescar CodeLens (modo normal, buffer con LSP)
* `<leader>cd`: Diagnósticos de línea (modo normal, buffer con LSP)
* `]d`: Siguiente diagnóstico (modo normal, buffer con LSP)
* `[d`: Diagnóstico anterior (modo normal, buffer con LSP)
* `]e`: Siguiente error (modo normal, buffer con LSP)
* `[e`: Error anterior (modo normal, buffer con LSP)
* `]w`: Siguiente advertencia (modo normal, buffer con LSP)
* `[w`: Advertencia anterior (modo normal, buffer con LSP)
* `<leader>th`: Alternar sugerencias en línea (modo normal, si el LSP lo soporta)




### Atajos de Gitsigns <a id="gitsigns-keybindings"></a>

* `]h`: Siguiente fragmento (hunk) (modo normal, buffer con Gitsigns)
* `[h`: Fragmento anterior (hunk) (modo normal, buffer con Gitsigns)
* `<leader>ghs`: Preparar fragmento (stage hunk) (modos normal y visual, buffer con Gitsigns)
* `<leader>ghr`: Revertir fragmento (reset hunk) (modos normal y visual, buffer con Gitsigns)
* `<leader>ghS`: Preparar buffer (stage buffer) (modo normal, buffer con Gitsigns)
* `<leader>ghu`: Deshacer preparación de fragmento (modo normal, buffer con Gitsigns)
* `<leader>ghR`: Revertir buffer (reset buffer) (modo normal, buffer con Gitsigns)
* `<leader>ghp`: Previsualizar fragmento en línea (modo normal, buffer con Gitsigns)
* `<leader>ghb`: Mostrar autor de la línea (blame line) (modo normal, buffer con Gitsigns)
* `<leader>ghd`: Comparar con la versión guardada (diff this) (modo normal, buffer con Gitsigns)
* `<leader>ghD`: Comparar con la versión anterior guardada (diff this ~) (modo normal, buffer con Gitsigns)
* `ih`: Seleccionar fragmento (modos operador y visual, buffer con Gitsigns)


### Atajos de CMP <a id="cmp-keybindings"></a>

* `<C-k>`: Seleccionar elemento de autocompletado anterior (modo inserción)
* `<C-j>`: Seleccionar elemento de autocompletado siguiente (modo inserción)
* `<Tab>`: Siguiente elemento de autocompletado / expandir snippet (modos inserción y selección)
* `<S-Tab>`: Elemento de autocompletado anterior / retroceder en snippet (modos inserción y selección)
* `<C-u>`: Desplazarse hacia arriba en la documentación de autocompletado (modo inserción)
* `<C-d>`: Desplazarse hacia abajo en la documentación de autocompletado (modo inserción)
* `<C-Space>`: Mostrar menú de autocompletado (modo inserción)
* `<C-c>`: Cancelar autocompletado (modo inserción)
* `<CR>`: Confirmar autocompletado (modo inserción)
