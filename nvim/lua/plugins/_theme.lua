return function ()
  require('onedark').setup {
    style = 'dark',
    code_style = {
      comments = 'italic',
      keywords = 'bold',
      functions = 'italic',
      strings = 'none',
      variables = 'none'
    },
  }
  require('onedark').load()
end
