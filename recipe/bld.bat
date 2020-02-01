mkdir -p build
pushd build

unset BOOST_ROOT
echo "##vso[task.setvariable variable=BOOST_ROOT]"$BOOST_ROOT

cmake %SRC_DIR% -G "Ninja" ^
      -Wno-dev ^
      -DBOOST_ROOT=C:\Boost ^
      -DBoost_COMPILER=cl.exe ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_PYTHON_BINDINGS=ON ^
      -DBUILD_CLI_EXECUTABLES=ON ^
      -DBUILD_SHARED_LIBS=ON ^
      -DBUILD_TESTS=OFF ^
      -DMATLAB_BINDINGS=OFF ^
      -DDOWNLOAD_STB_IMAGE=OFF ^
      -DDOWNLOAD_ENSMALLEN=OFF ^
      -DPYTHON_EXECUTABLE=%PYTHON% ^
      -DUSE_OPENMP=ON ^
      -DCMAKE_CXX_COMPILER=cl.exe ^
      -DCMAKE_C_COMPILER=cl.exe ^
      -DBOOST_INCLUDEDIR=%LIBRARY_PREFIX%/include ^
      -DENSMALLEN_INCLUDE_DIR=%LIBRARY_PREFIX%/include ^
      -DARMADILLO_INCLUDE_DIR=%LIBRARY_PREFIX%/include ^
      -DARMADILLO_LIBRARIES=%LIBRARY_PREFIX%/lib/armadillo.lib ^
      -DBOOST_LIBRARYDIR=%LIBRARY_PREFIX%/lib ^
      -DBoost_NO_BOOST_CMAKE=1 ^
      -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ^
      -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=true ^
      -DCOTIRE_MINIMUM_NUMBER_OF_TARGET_SOURCES=100000 ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      ..

ninja
ninja install
