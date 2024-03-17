-- Enable completion where available.
-- This setting must be set before ALE is loaded.
vim.g.ale_completion_enabled = 1

-- Custom lint signs
vim.g.ale_sign_error = "✗"
vim.g.ale_sign_warning = "∆" -- ⚠

-- Show signs always in git gutter column
vim.g.ale_sign_column_always = 1

-- Fix file on save
vim.g.ale_fix_on_save = 1

-- ZSH and shellchek
vim.g.ale_sh_shell_default_shell = "zsh"
vim.g.ale_sh_shellcheck_exclusions = ""
vim.g.ale_sh_shellcheck_executable = "shellcheck"
vim.g.ale_sh_shellcheck_options = ""

vim.g.ale_use_neovim_diagnostics_api = 1

-- Add error formatting
vim.g.ale_echo_msg_error_str = "E"
vim.g.ale_echo_msg_warning_str = "W"
vim.g.ale_echo_msg_format = "[%linter%] %s [%severity%]"

-- Define setting with old vim style
vim.cmd(
    [[
        " Define linters
        let g:ale_linters = {
        \  'javascript': ['eslint'],
        \  'typescript': ['eslint'],
        \  'markdown': ['remark-lint'],
        \  'css': ['stylelint'],
        \  'scss': ['stylelint'],
        \  'shell': ['shellcheck'],
        \  'lua': ['luacheck']
        \}

        let g:ale_fixers = {
        \   'javascript': ['prettier'],
        \   'typescript': ['prettier'],
        \   'markdown': ['prettier'],
        \   'css': ['prettier'],
        \   'scss': ['prettier'],
        \   'html': ['prettier'],
        \   'lua': ['luafmt'],
        \}

        " Do not lint or fix minified files.
        let g:ale_pattern_options = {
        \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
        \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
        \}
    ]]
)
