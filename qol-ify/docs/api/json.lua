---@diagnostic disable:unused-local

---@class json
local _json = {}

---Takes a JSON string and turns it into a Lua value (usually a table). Returns ```nil``` on error.
---@param json_str string
---@return any
function _json.load_string(json_str) end

---Takes a Lua value (usually a table) and turns it into a JSON string. Returns an empty string on error. If unspecified, ```indent``` will default to -1.
---@param value any
---@param indent? number
function _json.dump_string(value, indent) end

---Loads a JSON file identified by ```filepath``` relative to the ```reframework/data``` subdirectory and returns it as a Lua value (usually a table). Returns ```nil``` if the file does not exist.
---@param filepath string
---@return any
function _json.load_file(filepath) end

---Takes a Lua value (usually a table), and turns it into a JSON file identified as ```filepath``` relative to the ```reframework/data``` subdirectory. Returns ```true``` if the dump was successful, false ```otherwise```. If unspecified, ```indent``` will default to 4
---@param filepath string
---@param value any
---@param indent? number
function _json.dump_file(filepath, value, indent) end

---@class json
json = json ---@diagnostic disable-line
