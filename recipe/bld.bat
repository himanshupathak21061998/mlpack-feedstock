mkdir build
cd build

cmake -GNinja ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE="Debug" ^
      -DBUILD_PYTHON_BINDINGS=ON ^
      -DBUILD_CLI_EXECUTABLES=ON ^
      -DBUILD_SHARED_LIBS=OFF ^
      -DBUILD_TESTS=OFF ^
      -DMATLAB_BINDINGS=OFF ^
      -DDOWNLOAD_STB_IMAGE=OFF ^
      -DDOWNLOAD_ENSMALLEN=OFF ^
      -DPYTHON_EXECUTABLE=%PYTHON% ^
      -DUSE_OPENMP=ON ^
      -DCMAKE_CXX_COMPILER=cl.exe ^
      -DCMAKE_C_COMPILER=cl.exe ^
      -DBoost_INCLUDE_DIRS=%LIBRARY_PREFIX%/include ^
      -DCMAKE_CXX_FLAGS="-DBOOST_ALL_NO_LIB=1" ^
      -DENSMALLEN_INCLUDE_DIR=%LIBRARY_PREFIX%/include ^
      -DARMADILLO_INCLUDE_DIR=%LIBRARY_PREFIX%/include ^
      -DARMADILLO_LIBRARIES=%LIBRARY_PREFIX%/lib/armadillo.lib ^
      -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=true ^
      -DCOTIRE_MINIMUM_NUMBER_OF_TARGET_SOURCES=100000 ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      ..

cmake --build . --target install --config Debug
