local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

vim.g.skip_ts_context_commentstring_module = true

comment.setup { }

