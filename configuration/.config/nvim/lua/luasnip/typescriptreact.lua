-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
-- Define new type
--
-- ls.filetype_extend("typescriptreact")

-- Add snippets
--
ls.add_snippets("typescriptreact", {
  -- available in any file type

  s({
    trig = "log",
    name = "console log",
    desc = "simple console log",
  }, {
    t("console.log("),
    i(1),
    t(")"),
  }),

  -- s({
  -- trig = "logt",
  -- name = "console log type",
  -- desc = "select desired console log type",
  -- }, {
  -- t("console."),
  -- c(1, {
  -- t("log"),
  -- t("error"),
  -- t("warn"),
  -- t("debug"),
  -- }),
  -- t("("),
  -- i(1),
  -- t(")"),
  -- }),
  s(
    {
      trig = "logt",
      name = "console log type",
      desc = "select desired console log type",
    },
    fmt(
      [[
        console.<>(<>)
      ]],
      {
        c(1, {
          t("log"),
          t("error"),
        }),
        i(2),
      },
      { delimiters = "<>" }
    )
  ),

  s({
    trig = "if",
    name = "if (single)",
    desc = "Single if statement",
  }, fmt([[
    if (<>) {
      <>
    }]], {
      i(1)},
      { delimiters = "<>" }
      ),
}, {
  key = "typescriptreact",
})
