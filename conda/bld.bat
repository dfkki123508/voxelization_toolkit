mkdir build && cd build

cmake -G "Visual Studio 16 2019" -A x64 ^
 -DCMAKE_BUILD_TYPE:STRING=Release ^
 -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
 -DCMAKE_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
 -DCMAKE_SYSTEM_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
 -DCMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE=x64 ^
 ^
 -DENABLE_TESTS=Off ^
 -DUSE_BUILD_SCRIPT_OUTPUT=Off ^
 -DUSE_STATIC_MSVC_RUNTIME=Off ^
 -DBoost_USE_STATIC_LIBS=Off ^
 -DIFC_INCLUDE_DIR=%LIBRARY_PREFIX%\include ^
 -DIFC_LIBRARY_DIR=%LIBRARY_PREFIX%\lib ^
 -DOCC_INCLUDE_DIR=%LIBRARY_PREFIX%\include\opencascade ^
 -DOCC_LIBRARY_DIR=%LIBRARY_PREFIX%\lib ^
 %SRC_DIR%
 
if errorlevel 1 exit 1

:: Build and install
cmake --build . --target INSTALL --config Release

if errorlevel 1 exit 1
