-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
local colorizer = require 'colorizer'

colorizer.setup {
  'css';
  'javascript';
  html = {
    mode = 'foreground';
  }
}
