---@diagnostic disable:unused-local

---@class log
local _log = {}

---@param text string
function _log.info(text) end

---@param text string
function _log.warn(text) end

---Requires DebugView or a debugger to see this. Can also be viewed in the debug console spawned with "Spawn Debug Console" under ScriptRunner.
---@param text string
function _log.debug(text) end

---@param text string
function _log.error(text) end

---@class log
log = log ---@diagnostic disable-line
