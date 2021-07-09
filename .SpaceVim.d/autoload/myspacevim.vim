function! myspacevim#before() abort
  # Basic
  let g:spacevim_colorscheme = 'base16-' . $BASE16_THEME
  iunmap jk

  # Go
  let g:go_gopls_enabled = 0
  let g:go_fmt_command = "goimports"
endfunction

function! myspacevim#after() abort
  set clipboard=unnamed
  iunmap jk
endfunction
