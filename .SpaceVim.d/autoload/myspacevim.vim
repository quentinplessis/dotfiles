function! myspacevim#before() abort
  let g:spacevim_colorscheme = 'base16-' . $BASE16_THEME
  set clipboard=unnamed
endfunction

function! myspacevim#after() abort
endfunction
