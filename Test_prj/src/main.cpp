#include <iostream>


#ifdef CFG_DEBUG
#define LOGGING_ENABLED
#else
#define LOGGING_DISABLED
#endif

#include "GLFW/glfw3.h"

int main()
{
	if (glfwInit() == GLFW_TRUE)
	{
#ifdef LOGGING_ENABLED
		std::cout << "GLFW is inisilised !" << std::endl;
#endif
		glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
		glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

		GLFWwindow* window = glfwCreateWindow(800, 600, "Tilte", nullptr, nullptr);
		glfwShowWindow(window);

		while (!glfwWindowShouldClose(window))
		{
			glfwPollEvents();
		}

		glfwTerminate();
	}
	else
	{
		std::cout << "GLFW is not inisilised !" << std::endl;
	}

	return 0;
}