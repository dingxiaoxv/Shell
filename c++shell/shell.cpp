#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <fstream>
#include <string>

void testPip()
{
    const char *command = "wpa_cli -i wlan0 scan && sleep 3 && wpa_cli -i wlan0 scan_results"; // 执行命令
    FILE *pipe = popen(command, "r");                                                          // 打开命令输出管道

    if (!pipe)
    {
        std::cerr << "Error opening pipe." << std::endl;
        return;
    }

    std::string result = "";
    char buffer[128]; // 用于存储命令输出的缓冲区

    while (fgets(buffer, sizeof(buffer), pipe) != nullptr)
    {
        result += buffer;
    }

    int pcloseResult = pclose(pipe); // 关闭管道

    if (pcloseResult == 0)
    {
        if (!result.empty())
        {
            std::cout << "Output from grep: \n"
                      << result << std::endl;
        }
        else
        {
            std::cout << "No match found." << std::endl;
        }
    }
    else
    {
        std::cerr << "Command execution failed." << std::endl;
    }
}

void testSystem()
{
    const char *cmd = "[ -f tmp.txt ]";
    if (0 != std::system(cmd))
    {
        std::cout << "No file found." << std::endl;
    }
    else
    {
        std::cout << "file found." << std::endl;
    }
}

int main()
{
    testPip();
    testSystem();

    return 0;
}
