-- scaffold geniefile for m4

m4_script = path.getabsolute(path.getdirectory(_SCRIPT))
m4_root = path.join(m4_script, "m4")

m4_includedirs = {
	path.join(m4_script, "config"),
	m4_root,
}

m4_libdirs = {}
m4_links = {}
m4_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { m4_includedirs }
	end,

	_add_defines = function()
		defines { m4_defines }
	end,

	_add_libdirs = function()
		libdirs { m4_libdirs }
	end,

	_add_external_links = function()
		links { m4_links }
	end,

	_add_self_links = function()
		links { "m4" }
	end,

	_create_projects = function()

project "m4"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		m4_includedirs,
	}

	defines {}

	files {
		path.join(m4_script, "config", "**.h"),
		path.join(m4_root, "**.h"),
		path.join(m4_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
