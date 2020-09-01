workspace "Project"
	architecture "x64"
	systemversion "latest"

	configurations
	{
		"Debug",
		"Release"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Test_prj"
	location "glfw"
	location "Test_prj" 
	kind "ConsoleApp"
	cppdialect "C++17"

	includedirs { "glfw/include/" }
	libdirs { "bin/" .. outputdir .. "/glfw" }
	links{ "glfw.lib" }

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

filter "system:window"
	defines
	{
		"PLATFORM_WINDOWS"
	}
filter "system:linux"
	defines
	{
		"PLATFORM_LINUX"
	}

filter "configurations:Debug"
	symbols "on"
	defines
	{
		"CFG_DEBUG"
	}

filter "configurations:Release"
	optimize "on"
	defines
	{
		"CFG_RELEASE"
	}

project "glfw"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")

	files
	{
		"glfw/include/GLFW/glfw3.h",
		"glfw/include/GLFW/glfw3native.h",
		"glfw/src/glfw_config.h",
		"glfw/src/context.c",
		"glfw/src/init.c",
		"glfw/src/input.c",
		"glfw/src/monitor.c",
		"glfw/src/vulkan.c",
		"glfw/src/window.c"
	}

filter "system:linux"
	pic "On"

	files
	{
		"glfw/src/x11_platform.h",
		"glfw/src/xkb_unicode.h",
		"glfw/src/posix_time.h",
		"glfw/src/posix_thread.h",
		"glfw/src/glx_context.h",
		"glfw/src/egl_context.h",
		"glfw/src/x11_init.c",
		"glfw/src/osmesa_context.h",
		"glfw/src/x11_monitor.c",
		"glfw/src/x11_window.c",
		"glfw/src/xkb_unicode.c",
		"glfw/src/posix_time.c",
		"glfw/src/posix_thread.c",
		"glfw/src/glx_context.c",
		"glfw/src/egl_context.c",
		"glfw/src/osmesa_context.c",
		"glfw/src/wl_platform.h",
		"glfw/src/posix_time.h",
		"glfw/src/posix_thread.h",
		"glfw/src/xkb_unicode.h",
		"glfw/src/egl_context.h",
		"glfw/src/osmesa_context.h",
		"glfw/src/wl_init.c",
		"glfw/src/wl_monitor.c",
		"glfw/src/wl_window.c",
		"glfw/src/posix_time.c",
		"glfw/src/posix_thread.c",
		"glfw/src/xkb_unicode.c",
		"glfw/src/egl_context.c",
		"glfw/src/osmesa_context.c",
		"glfw/src/null_platform.h",
		"glfw/src/null_joystick.h",
		"glfw/src/posix_time.h",
		"glfw/src/posix_thread.h",
		"glfw/src/osmesa_context.h",
		"glfw/src/null_init.c",
		"glfw/src/null_monitor.c",
		"glfw/src/null_window.c",
		"glfw/src/null_joystick.c",
		"glfw/src/posix_time.c",
		"glfw/src/posix_thread.c",
		"glfw/src/osmesa_context.c",
		"glfw/src/linux_joystick.h",
		"glfw/src/null_joystick.c",
		"glfw/src/linux_joystick.h",
		"glfw/src/null_joystick.c",

	}

	defines
	{
		"_GLFW_X11"
	}

filter "system:windows"
	files
	{
		"glfw/src/win32_init.c",
		"glfw/src/win32_joystick.c",
		"glfw/src/win32_monitor.c",
		"glfw/src/win32_time.c",
		"glfw/src/win32_thread.c",
		"glfw/src/win32_window.c",
		"glfw/src/wgl_context.c",
		"glfw/src/egl_context.c",
		"glfw/src/osmesa_context.c"
	}

	defines 
	{ 
		"_GLFW_WIN32",
		"_CRT_SECURE_NO_WARNINGS"
	}
