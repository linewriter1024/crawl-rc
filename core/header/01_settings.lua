nrc.settings = {
	values = {},
	defaults = {},

	get = function(k)
		local v = nrc.settings.values[k]
		if v == nil then
			return nrc.settings.defaults[k]
		else
			return v
		end
	end,

	set = function(k, v)
		nrc.settings.values[k] = v
	end,

	default = function(k, v)
		nrc.settings.defaults[k] = v
	end,
}
