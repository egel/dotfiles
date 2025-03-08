-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s( -- Link {{{
    {
      trig = "link",
      name = "markdown_link",
      dscr = "Create markdown link [txt](url).\nSelect link, press C-s, type link.",
    },
    fmt([[[{}]({})]], {
      ls.i(1),
      ls.i(2),
    })
  ), --}}}

  s( -- Table 2x2
    {
      trig = "table",
      name = "table 2x2",
      dscr = "Create markdown table 2 rows x 2 columns.",
    },
    fmt(
      [[| {} | {} |
| --- | --- |
| {} | {} |]],
      {
        ls.i(1),
        ls.i(2),
        ls.i(3),
        ls.i(4),
      }
    )
  ),

  s( -- Image
    {
      trig = "image",
      name = "HTML image",
      dscr = "Create HTML image element",
    },
    fmt(
      [[
<figure>
  <img src="{}"
       alt="{}">
  <figcaption>{}</figcaption>
</figure>]],
      {
        ls.i(1),
        ls.i(2),
        ls.i(3),
      }
    )
  ),

  s( -- Video
    {
      trig = "video",
      name = "HTML video",
      dscr = "Create HTML video element",
    },
    fmt(
      [[
<figure class="video-container">
  <video controls="true" allowfullscreen="true">
    <source src="{}" type="{}">
  </video>
</figure>]],
      {
        ls.i(1),
        ls.i(2, "video/mp4"),
      }
    )
  ),

  s( -- Code block
    {
      trig = "code",
      name = "Markdown code block",
      dscr = "Create markdown code block",
    },
    fmt(
      [[
```{}
{}
```]],
      {
        ls.i(1, "bash"),
        ls.i(2),
      }
    )
  ),
}
