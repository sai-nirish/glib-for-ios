mkdir -p "dependencies"

PREFIX="`pwd`/dependencies"

DEVROOT="/Applications/Xcode.app/Contents/Developer"

SDK_VERSION="8.1"
MIN_VERSION="8.1"

IPHONEOS_PLATFORM="${DEVROOT}/Platforms/iPhoneOS.platform"
IPHONEOS_SDK="${IPHONEOS_PLATFORM}/Developer/SDKs/iPhoneOS${SDK_VERSION}.sdk"
IPHONEOS_GCC="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"

IPHONESIMULATOR_PLATFORM="${DEVROOT}/Platforms/iPhoneSimulator.platform"
IPHONESIMULATOR_SDK="${IPHONESIMULATOR_PLATFORM}/Developer/SDKs/iPhoneSimulator${SDK_VERSION}.sdk"
IPHONESIMULATOR_GCC="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"


if [ ! -d "$IPHONEOS_PLATFORM" ]; then
  echo "Cannot find $IPHONEOS_PLATFORM"
  exit 1
fi

if [ ! -d "$IPHONEOS_SDK" ]; then
  echo "Cannot find $IPHONEOS_SDK"
  exit 1
fi

if [ ! -x "$IPHONEOS_GCC" ]; then
  echo "Cannot find $IPHONEOS_GCC"
  exit 1
fi

if [ ! -d "$IPHONESIMULATOR_PLATFORM" ]; then
  echo "Cannot find $IPHONESIMULATOR_PLATFORM"
  exit 1
fi

if [ ! -d "$IPHONESIMULATOR_SDK" ]; then
  echo "Cannot find $IPHONESIMULATOR_SDK"
  exit 1
fi

if [ ! -x "$IPHONESIMULATOR_GCC" ]; then
  echo "Cannot find $IPHONESIMULATOR_GCC"
  exit 1
fi

# setenv_all()
# {
#         # Add internal libs
#         export CFLAGS="$CFLAGS -I/usr/local/include"
 
#         export CPP="$DEVROOT/usr/bin/cpp"
#         export CXX="$DEVROOT/usr/bin/g++"
#         export CXXCPP="$DEVROOT/usr/bin/cpp"
#         export CC="$DEVROOT/usr/bin/gcc"
#         export LD="$DEVROOT/usr/bin/ld"
#         export AR="$DEVROOT/usr/bin/ar"
#         export AS="$DEVROOT/usr/bin/as"
#         export NM="$DEVROOT/usr/bin/nm"
#         export RANLIB="$DEVROOT/usr/bin/ranlib"
#         export LDFLAGS="-L/usr/local/bin  $IPHONESIMULATOR_SDK/usr/lib/"
          
#         export CPPFLAGS=$CFLAGS
#         export CXXFLAGS=$CFLAGS

#         # export LIBFFI_CFLAGS="$CFLAGS -I/usr/local/opt/libffi/lib/libffi-3.0.13/include"
#         # export LIBFFI_LIBS="-L/usr/local/opt/libffi/lib"
# }

 
setenv_arm7()
{
        unset SDKROOT CFLAGS CC LD CPP CXX AR AS NM CXXCPP RANLIB LDFLAGS CPPFLAGS CXXFLAGS
 
        export DEVROOT1="$DEVROOT/Platforms/iPhoneOS.platform/Developer"
        export SDKROOT="$DEVROOT1/SDKs/iPhoneOS$SDK_VERSION.sdk"
 
        export CFLAGS="-arch armv7 -isysroot $SDKROOT -miphoneos-version-min=$MIN_VERSION"
 
       
}
 
setenv_arm7s()
{
        unset SDKROOT CFLAGS CC LD CPP CXX AR AS NM CXXCPP RANLIB LDFLAGS CPPFLAGS CXXFLAGS
 
        export DEVROOT1="$DEVROOT/Platforms/iPhoneOS.platform/Developer"
        export SDKROOT="$DEVROOT1/SDKs/iPhoneOS$SDK_VERSION.sdk"
 
        export CFLAGS="-arch armv7s -isysroot $SDKROOT -miphoneos-version-min=$MIN_VERSION"
 
       
}

setenv_arm64()
{
 
        export DEVROOT1="$DEVROOT/Platforms/iPhoneOS.platform/Developer"
        export SDKROOT="$DEVROOT1/SDKs/iPhoneOS$SDK_VERSION.sdk"
 
        export CFLAGS="-arch arm64  -isysroot $SDKROOT  -miphoneos-version-min=$MIN_VERSION "



}

setenv_i386()
{
      
 
        export DEVROOT1="$DEVROOT/Platforms/iPhoneSimulator.platform/Developer"
        export SDKROOT="$DEVROOT1/SDKs/iPhoneSimulator$SDK_VERSION.sdk"
 
        export CFLAGS="-arch i386  -isysroot $SDKROOT -miphoneos-version-min=$MIN_VERSION"
 
        
}

setenv_i386
#setenv_arm7

export LIBFFI_CFLAGS="$CFLAGS -I${PREFIX}/lib/libffi-3.1/include"
export LIBFFI_LIBS="-L${PREFIX}/lib -lffi "

  
export CPPFLAGS="-I${PREFIX}/include   $CFLAGS"
export LDFLAGS="-L${PREFIX}/lib  -lffi $CFLAGS"
export CXX="/Applications/Xcode.app/Contents/Developer/usr/bin/g++"
export PATH="`pwd`/dependencies/bin/:$PATH"

 [ ! -d "${PREFIX}" ]
./glib-2.42.1/configure --prefix="${PREFIX}" \
--build="i386-apple-darwin" \
--host="i386-apple-darwin" \
--enable-static \
--disable-shared \
glib_cv_stack_grows=no \
glib_cv_uscore=no \
ac_cv_func_posix_getgrgid_r=yes \
ac_cv_func_posix_getpwuid_r=yes

