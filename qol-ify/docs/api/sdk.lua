---@diagnostic disable:unused-local,missing-return

---@class sdk
local _sdk = {}

---Returns the version of the type database. A good approximation of the version of the RE Engine the game is running on.
---@return string
function _sdk.get_tdb_version() end

---Returns ```game_namespace.name```.
---DMC5: ```name``` would get converted to ```app.name```
---RE3: ```name``` would get converted to ```offline.name```
---@return string
function _sdk.game_namespace(name) end

---@return any
function _sdk.get_thread_context() end

---Returns a ```void*```. Can be used with ```sdk.call_native_func```
---Possible singletons can be found in the Native Singletons view in the Object Explorer.
---@param name string
---@return any
function _sdk.get_native_singleton(name) end

---Returns an ```REManagedObject*```
---Possible singletons can be found in the Singletons view in the Object Explorer.
---@param name string
---@return any
function _sdk.get_managed_singleton(name) end

---Returns an ```RETypeDefinition*```.
---@param name string
---@return any
function _sdk.find_type_definition(name) end

---Returns a ```System.Type```.
---Equivalent to calling ```sdk.find_type_definition(name):get_runtime_type()```.
---Equivalent to typeof in C#.
---@param name string
---@return any
function _sdk.typeof(name) end

---Returns an ```REManagedObject```.
---Equivalent to calling sdk.find_type_definition(typename):create_instance()
---simplify - defaults to ```false```. Set this to ```true``` if this function is returning ```nil```.
---@param typename string
---@param simplify boolean
---@return any
function _sdk.create_instance(typename, simplify) end

---Creates and returns a new ```System.String``` from ```str```.
---@param str string
---@return any
function _sdk.create_managed_string(str) end

---Creates and returns a new ```SystemArray``` of the given ```type```, with ```length``` elements.
---type can be any of the following:
--- - A ```System.Type``` returned from ```sdk.typeof```
--- - An ```RETypeDefinition``` returned from ```sdk.find_type_definition```
--- - A Lua ```string``` representing the type name.
---Any other type will throw a Lua error.
---If ```type``` cannot resolve to a valid ```System.Type```, a Lua error will be thrown.
---@param type any
---@param length number
---@return any
function _sdk.create_managed_array(type, length) end

---Returns a fully constructed ```REManagedObject``` of type ```System.SByte``` given the ```value```.
---@param value number
---@return any
function _sdk.create_sbyte(value) end

---Returns a fully constructed ```REManagedObject``` of type ```System.Byte``` given the ```value```.
---@param value number
---@return any
function _sdk.create_byte(value) end

---Returns a fully constructed ```REManagedObject``` of type ```System.Int16``` given the ```value```.
---@param value number
---@return any
function _sdk.create_int16(value) end

---Returns a fully constructed ```REManagedObject``` of type ```System.UInt16``` given the ```value```.
---@param value number
---@return any
function _sdk.create_uint16(value) end

---Returns a fully constructed ```REManagedObject``` of type ```System.Int32``` given the ```value```.
---@param value number
---@return any
function _sdk.create_int32(value) end

---Returns a fully constructed ```REManagedObject``` of type ```System.UInt32``` given the ```value```.
---@param value number
---@return any
function _sdk.create_uint32(value) end

---Returns a fully constructed ```REManagedObject``` of type ```System.Int64``` given the ```value```.
---@param value number
---@return any
function _sdk.create_int64(value) end

---Returns a fully constructed ```REManagedObject``` of type ```System.UInt64``` given the ```value```.
---@param value number
---@return any
function _sdk.create_uint64(value) end

---Returns a fully constructed ```REManagedObject``` of type ```System.Single``` given the ```value```.
---@param value decimal
---@return any
function _sdk.create_single(value) end

---Returns a fully constructed ```REManagedObject``` of type ```System.Double``` given the ```value```.
---@param value decimal
---@return any
function _sdk.create_double(value) end

---Returns an ```REResource```.
---If the typename does not correctly correspond to the resource file or is not a resource type, nil will be returned.
---@param typename string
---@param resource_path string
---@return any
function _sdk.create_resource(typename, resource_path) end

---Returns a list of ```REManagedObject``` generated from ```data```.
---data is the raw RSZ data contained for example in a ```.scn``` file, starting at the ```RSZ``` magic in the header.
---data must in ```table``` format as an array of bytes.
---Example usage:
---```
---local rsz_data = json.load_file("Foobar.json")
---local objects = sdk.deserialize(rsz_data)
---for i, v in ipairs(objects) do
---    local obj_type = v:get_type_definition()
---    log.info(obj_type:get_full_name())
---end
---```
---@param data any
---@return any
function _sdk.deserialize(data) end

---Return value is dependent on what the method returns.
---Full function prototype can be passed as ```method_name``` if there are multiple functions with the same name but different parameters.
---Should only be used with native types, not ```REManagedObject``` (though, it can be if wanted).
---Example:
---```
---local scene_manager = sdk.get_native_singleton("via.SceneManager")
---local scene_manager_type = sdk.find_type_definition("via.SceneManager")
---local scene = sdk.call_native_func(scene_manager, scene_manager_type, "get_CurrentScene")
---
---if scene ~= nil then
---    -- We can use call like this because scene is a managed object, not a native one.
---    scene:call("set_TimeScale", 5.0)
---end
---```
---@param object any
---@param type_definition any
---@param method_name any
---@param ... unknown
---@return any
function _sdk.call_native_func(object, type_definition, method_name, ...) end

---Return value is dependent on what the method returns.
---Full function prototype can be passed as method_name if there are multiple functions with the same name but different parameters.
---Alternative calling method: ```managed_object:call(method_name, args...)```
---@param managed_object any
---@param method_name any
---@param ... unknown
---@return any
function _sdk.call_object_func(managed_object, method_name, ...) end

---@param object any
---@param type_definition any
---@param field_name any
---@return any
function _sdk.get_native_field(object, type_definition, field_name) end

---@param object any
---@param type_definition any
---@param field_name any
---@param value any
function _sdk.set_native_field(object, type_definition, field_name, value) end

---Returns a ```REManagedObject*```. Returns the current camera being used by the engine.
function _sdk.get_primary_camera() end

---Creates a hook for method_definition, intercepting all incoming calls the game makes to it.
---ignore_jmp - Skips trying to follow the first jmp in the function. Defaults to false.
---Using pre_function and post_function, the behavior of these functions can be modified.
---NOTE: Some native methods may not be able to be hooked with this, e.g. if they are just a wrapper over the native function. Some additional work will need to be done from our end to make those work.
---
---pre_function and post_function looks like so:
---```
---local function pre_function(args)
---    -- args are modifiable
---    -- args[1] = thread_context
---    -- args[2] = "this"/object pointer
---    -- rest of args are the actual parameters
---    -- actual parameters start at args[2] in a static function
---    -- Some native functions will have the object start at args[1] and rest at args[2]
---    -- All args are void* and not auto-converted to their respective types.
---    -- You will need to do things like sdk.to_managed_object(args[2])
---    -- or sdk.to_int64(args[3]) to get arguments to better interact with or read.
---
---    -- if the argument is a ValueType, you need to do this to access its fields:
---    -- local type = sdk.find_type_definition("via.Position")
---    -- local x = sdk.get_native_field(arg[3], type, "x")
---
---    -- OPTIONAL: Specify an sdk.PreHookResult
---    -- e.g.
---    -- return sdk.PreHookResult.SKIP_ORIGINAL -- prevents the original function from being called
---    -- return sdk.PreHookResult.CALL_ORIGINAL -- calls the original function, same as not returning anything
---end
---
---local function post_function(retval)
---    -- return something else if you don't want the original return value
---    -- NOTE: the post_function will still be called if SKIP_ORIGINAL is returned from the pre_function
---    -- So, if your function expects something valid in return, keep that in mind, as retval will not be valid.
---    -- Make sure to convert custom retvals to sdk.to_ptr(retval)
---    return retval
---end
---```
---
---Example hook:
---```
---local function on_pre_get_timescale(args)
---end
---
---local function on_post_get_timescale(retval)
---    -- Make the game run 5 times as fast instead
---    -- TODO: Make it so casting return values like this is not necessary
---    return sdk.float_to_ptr(5.0)
---end
---
---sdk.hook(sdk.find_type_definition("via.Scene"):get_method("get_TimeScale"), on_pre_get_timescale, on_post_get_timescale)
---```
function _sdk.hook(method_definition, pre_function, post_function, ignore_jmp) end

---Similar to ```sdk.hook``` but hooks on a per-object basis instead, instead of hooking the function globally for all objects.
---Only works if the target method is a virtual method.
function _sdk.hook_vtable(obj, method, pre, post) end

---Returns true if value is a valid REManagedObject.
---Use only if necessary. Does a bunch of checks and calls IsBadReadPtr a lot.
---@param value any
---@return boolean
function _sdk.is_managed_object(value) end

---Attempts to convert value to an ```REManagedObject*```.
---value can be any of the following types:
--- - An REManagedObject*, in which case it is returned as-is
--- - A lua number convertible to ```uintptr_t```, representing the object's address
--- - A ```void*```
---Any other type will return ```nil```.
---A ```value``` that is not a valid ```REManagedObject*``` will return ```nil```, equivalent to calling ```sdk.is_managed_object``` on it.
---@param value any
function _sdk.to_managed_object(value) end

---Attempts to convert value to a ```double```.
---value can be any of the following types:
--- - A ```void*```
---@param value any
function _sdk.to_double(value) end

---Attempts to convert value to a ```float```.
---value can be any of the following types:
--- - A ```void*```
---@param value any
function _sdk.to_float(value) end

---Attempts to convert value to a ```float```.
---value can be any of the following types:
--- - A ```void*```
---If you need a smaller datatype, you can do:
--- - ```(sdk.to_int64(value) & 1) == 1``` for a boolean
--- - ```(sdk.to_int64(value) & 0xFF)``` for an unsigned byte
--- - ```(sdk.to_int64(value) & 0xFFFF)``` for an unsigned short (2 bytes)
--- - ```(sdk.to_int64(value) & 0xFFFFFFFF)``` for an unsigned int (4 bytes)
---@param value any
function _sdk.to_int64(value) end

---Attempts to convert ```value``` to a ```void*```.
---value can be any of the following types:
--- - An ```REManagedObject*```
--- - A lua number convertible to ```int64_t```
--- - A lua number convertible to ```double```
--- - A lua boolean
--- - A ```void*```, in which case it is returned as-is
---Any other type will return nil.
---@param value any
function _sdk.to_ptr(value) end

---Converts ```number``` to a ```void*```.
---@param number any
function _sdk.float_to_ptr(number) end

---@enum
_sdk.PreHookResult = {
	CALL_ORIGINAL = {},
	SKIP_ORIGINAL = {},
}

---@class sdk
sdk = sdk ---@diagnostic disable-line
