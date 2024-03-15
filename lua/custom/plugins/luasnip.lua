return {
  {
    'L3MON4D3/LuaSnip',
    config = function()
      local ls = require 'luasnip'
      local fmt = require('luasnip.extras.fmt').fmt
      local rep = require('luasnip.extras').rep

      -- some shorthands...
      local snip = ls.snippet
      local node = ls.snippet_node
      local text = ls.text_node
      local insert = ls.insert_node
      local func = ls.function_node
      local choice = ls.choice_node
      local dynamicn = ls.dynamic_node

      ls.config.set_config {
        history = true,
        updateevents = 'TextChanged,TextChangedI',
        enable_autosnippets = true,
        ext_opts = nil,
      }

      ls.add_snippets(nil, {
        rust = {
          snip({
            trig = 'rrr',
            namr = '[R]ust E[RR]or',
            dscr = 'Rust Error Boilerplate',
          }, {
            text { '#[derive(Debug)]', '' },
            text { 'pub enum Error {', '' },
            text { '    // TODO', '', '}', '' },
            text { '// Error Boilerplate', '' },
            text { 'impl core::fmt::Display for Error {', '' },
            text { '    fn fmt(&self, fmt: &mut core::fmt::Formatter) -> core::result::Result<(), core::fmt::Error> {', '' },
            text { '        write!(fmt, "{self:?}")', '' },
            text { '    }', '' },
            text { '}', '', '' },
            text 'impl std::error::Error for Error {}',
          }),
          snip({
            trig = 'ernre',
            namr = 'Result And Error',
            dscr = 'Rust Result & Error Boilerplate',
          }, {
            text { 'pub type Result<T> = core::result::Result<T, Error>;', '', '' },
            text { '#[derive(Debug)]', '' },
            text { 'pub enum Error {', '' },
            text { '    // TODO', '', '}', '' },
            text { '// Error Boilerplate', '' },
            text { 'impl core::fmt::Display for Error {', '' },
            text { '    fn fmt(&self, fmt: &mut core::fmt::Formatter) -> core::result::Result<(), core::fmt::Error> {', '' },
            text { '        write!(fmt, "{self:?}")', '' },
            text { '    }', '' },
            text { '}', '', '' },
            text 'impl std::error::Error for Error {}',
          }),
        },
      })
    end,
  },
}
