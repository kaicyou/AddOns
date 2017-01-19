local _, GTP = ...

--[[-------------------------------------------------------------------------
	--  Localization
-------------------------------------------------------------------------]]--

GTP.L = GTP.L or setmetatable({}, {
	__index = function(t, k)
	rawset(t, k, k)
		return k
	end,
	__newindex = function(t, k, v)
		if v == true then
			rawset(t, k, k)
		else
			rawset(t, k, v)
		end
	end,
})

function GTP:RegisterLocale(locale, tbl)
	if locale == "enUS" or locale == GetLocale() then
		for k,v in pairs(tbl) do
			if v == true then
				self.L[k] = k
			elseif type(v) == "string" then
				self.L[k] = v
			else
				self.L[k] = k
			end
		end
	end
end
