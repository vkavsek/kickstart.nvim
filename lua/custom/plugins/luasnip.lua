return {
  {
    'L3MON4D3/LuaSnip',
    config = function()
      local ls = require 'luasnip'
      local fmt = require('luasnip.extras.fmt').fmt
      local rep = require('luasnip.extras').rep

      -- some shorthands...
      local snip = ls.snippet
      -- local node = ls.snippet_node
      local text = ls.text_node
      local insert = ls.insert_node
      -- local func = ls.function_node
      -- local choice = ls.choice_node
      -- local dynamicn = ls.dynamic_node

      ls.config.set_config {
        history = true,
        updateevents = 'TextChanged,TextChangedI',
        enable_autosnippets = true,
        ext_opts = nil,
      }

      ls.add_snippets(nil, {
        rust = {
          snip({
            trig = 'title',
            namr = 'Comment Title',
            dscr = 'Rust Comment Title',
          }, {
            text { '// ###################################', '' },
            text { '// -> \t' },
            insert(0, 'TITLE'),
            text { '', '// ###################################' },
          }),

          snip({
            trig = 'rrr',
            namr = '[R]ust E[RR]or',
            dscr = 'Rust Error Boilerplate',
          }, {
            text { '#[derive(Debug)]', '' },
            text { 'pub enum Error {', '' },
            insert(0, '\t// TODO: '),
            text { '', '}', '' },
            text { '// Error Boilerplate', '' },
            text { 'impl core::fmt::Display for Error {', '' },
            text { '\tfn fmt(&self, fmt: &mut core::fmt::Formatter) -> core::result::Result<(), core::fmt::Error> {', '' },
            text { '\t\twrite!(fmt, "{self:?}")', '' },
            text { '\t}', '' },
            text { '}', '', '' },
            text 'impl std::error::Error for Error {}',
          }),

          snip({
            trig = 'erandre',
            namr = 'Result And Error',
            dscr = 'Rust Result & Error Boilerplate',
          }, {
            text { 'pub type Result<T> = core::result::Result<T, Error>;', '', '' },
            text { '#[derive(Debug)]', '' },
            text { 'pub enum Error {', '' },
            insert(0, '\t// TODO: '),
            text { '', '}', '' },
            text { '// Error Boilerplate', '' },
            text { 'impl core::fmt::Display for Error {', '' },
            text { '\tfn fmt(&self, fmt: &mut core::fmt::Formatter) -> core::result::Result<(), core::fmt::Error> {', '' },
            text { '\t\twrite!(fmt, "{self:?}")', '' },
            text { '\t}', '' },
            text { '}', '', '' },
            text 'impl std::error::Error for Error {}',
          }),

          snip({
            trig = 'testsmod',
            namr = 'Tests Module',
            dscr = 'Create a tests module',
          }, {
            text { '#[cfg(test)]', '' },
            text { 'mod tests {', '' },
            text { '\tuse super::*;', '' },
            text { '\tuse anyhow::Result;', '', '\t' },
            insert(0),
            text { '', '}' },
          }),

          snip({
            trig = 'tokiotest',
            namr = 'Tokio Test Function',
            dscr = 'Create a tokio test function',
          }, {
            text { '#[tokio::test]', '' },
            text { 'fn test_' },
            insert(1, 'name'),
            text { '() -> Result<()>{', '\t' },
            insert(0),
            text { '', '\tOk(())', '' },
            text { '}' },
          }),

          snip({
            trig = 'testfn',
            namr = 'Test Function',
            dscr = 'Create a test function',
          }, {
            text { '#[test]', '' },
            text { 'fn test_' },
            insert(1, 'name'),
            text { '() -> Result<()>{', '\t' },
            insert(0),
            text { '', '\tOk(())', '' },
            text { '}' },
          }),
        },
      })
    end,
  },
}
