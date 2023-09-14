local M = {}

---@alias SelectionInfo { top: integer, bottom: integer, height: integer, center: integer }
---@alias WindowInfo { width: integer, height: integer }

--- @return SelectionInfo
local function getSelectionInfo()
	local top = vim.fn.line('v')
	local bottom = vim.fn.line('.')

	return {
		top = top,
		bottom = bottom,
		height = bottom - top,
		center = math.floor((top + bottom) / 2)
	}
end

--- @return nil
function M.center()
	local selection_info = getSelectionInfo()
	local keys = vim.api.nvim_replace_termcodes('<ESC>' .. selection_info.center .. 'Gzzgv', true, false, true)
	vim.fn.feedkeys(keys, 'n')
end

--- @return WindowInfo
local function getWindowInfo()
	local winid = vim.fn.win_getid()
	local width = vim.fn.winwidth(winid)
	local height = vim.fn.winheight(winid)

	return {
		width = width,
		height = height
	}
end

return M
