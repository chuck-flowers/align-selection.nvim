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
		center = (top + bottom) / 2
	}
end

--- @return nil
function M.center()
	local selection_info = getSelectionInfo()

	vim.fn.feedkeys('<ESC>' .. selection_info.center .. 'Gzzgv')
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
