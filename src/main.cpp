#include <iostream>
#include <tuple>
#include <stdint.h>
#include <stdbool.h>
#include <string>
#include <thread>

#include "settings.h"
using namespace std;

tuple<bool, string> simple() {
	string hello = "Hello World";
	bool isOk = true;
	return make_tuple(isOk, hello);
}

int main() {
	cout << "Hello, world, from Visual C++!" << endl;

	auto [isOk, s] = simple();

	if (isOk) {
		cout << s;
	}

	simplePrint();
	
	//uint32_t 
}

// https://docs.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-160
// https://docs.microsoft.com/en-us/cpp/build/reference/nmake-reference?view=msvc-160


/* BUILD
cl.exe /EHsc /I"F:\Apps\Microsoft Visual Studio 2019\VC\Tools\MSVC\14.29.30133\include" /I"C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\ucrt" /I"F:\Apps\Microsoft Visual Studio 2019\VC\Tools\MSVC\14.29.30133\lib\x64" /std:c++17 /Zi /MP /Fm main.cpp
 */


// https://riptutorial.com/cplusplus/example/5959/compiling-with-visual-cplusplus--command-line-
// https://docs.microsoft.com/en-us/cpp/build/reference/compiler-options-listed-by-category?view=msvc-170#output-files
