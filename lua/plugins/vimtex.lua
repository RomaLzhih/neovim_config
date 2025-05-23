return {
  "lervag/vimtex",
  ft = { "tex", "bib" },
  config = function()
    local uname = vim.loop.os_uname()

    _G.OS = uname.sysname
    _G.IS_MAC = OS == "Darwin"
    _G.IS_LINUX = OS == "Linux"
    _G.IS_WINDOWS = OS:find("Windows") and true or false
    _G.IS_WSL = IS_LINUX and uname.release:find("Microsoft") and true or false

    if _G.IS_LINUX then
      vim.g.vimtex_view_method = "zathura"
    elseif _G.IS_MAC then
      vim.g.vimtex_view_method = "skim"
    else
      -- vim.g.vimtex_view_method = "sioyek"
    end
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.tex_use_latexmk = 0
    vim.api.nvim_exec(
      [[
        let s:pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode ' .
              \ '-halt-on-error -synctex=1 -output-directory=%:h %'
        let s:latexmk = 'latexmk -pdf -output-directory=%:h %'

        function! s:TexToggleLatexmk() abort
          if g:tex_use_latexmk
            let g:tex_use_latexmk = 0
          else
            let g:tex_use_latexmk = 1
          endif
          call s:TexSetMakePrg()
        endfunction

        function! s:TexSetMakePrg() abort
          if g:tex_use_latexmk
            let &l:makeprg = expand(s:latexmk)
          else
            let &l:makeprg = expand(s:pdflatex)
          endif
        endfunction

        nmap <localleader>tl <Plug>TexToggleLatexmk
        nnoremap <script> <Plug>TexToggleLatexmk <SID>TexToggleLatexmk
        nnoremap <SID>TexToggleLatexmk :call <SID>TexToggleLatexmk()<CR>
        ]],
      false
    )
    -- vim.g.vimtex_compiler_method = "pdflatex"
  end,
}
