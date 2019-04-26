function nrc.check_version(a, b)
	a = a or 0
	b = b or 0
	local ca, cb = crawl.version("major"):match("(%d*).(%d*)")
	ca = tonumber(ca)
	cb = tonumber(cb)
	return (a > ca) or (a == ca and b >= cb)
end
