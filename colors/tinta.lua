local ok, tinta = pcall(require, "tinta")
if not ok then
	vim.notify("Failed to load tinta module: " .. tostring(tinta), vim.log.levels.ERROR)
else
	tinta.load()
end
