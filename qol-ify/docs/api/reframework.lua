---@diagnostic disable:unused-local,missing-return

---@class reframework
local _reframework = {}

---Returns true if the REFramework menu is open.
---@return boolean
function _reframework:is_drawing_ui() end

---Returns the name of the game this REFramework was compiled for.
---e.g. "dmc5" or "re2"
---@return string
function _reframework:get_game_name() end

---key is a Windows virtual key code.
---@param key string
---@return boolean
function _reframework:is_key_down(key) end

---Returns the total number of commits on the current branch of the REFramework build.
---@return integer
function _reframework:get_commit_count() end

---Returns the branch name of the REFramework build.
---ex: "master"
---@return string
function _reframework:get_branch() end

---Returns the commit hash of the REFramework build.
---@return string
function _reframework:get_commit_hash() end

---Returns the last tag of the REFramework build on its current branch.
---ex: "v1.5.4"
---@return string
function _reframework:get_tag() end

---Returns the last tag in full of the REFramework build on its current branch.
---@return string
function _reframework:get_tag_long() end

---Returns the number of commits past the last tag.
---@return integer
function _reframework:get_commits_past_tag() end

---Returns the date that REFramework was built (mm/dd/yyyy).
---@return string
function _reframework:get_build_date() end

---Returns the time that REFramework was built.
---@return number
function _reframework:get_build_time() end

---@class reframework
reframework = reframework ---@diagnostic disable-line
