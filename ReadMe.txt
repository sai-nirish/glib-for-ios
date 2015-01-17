BUILDING GLIB FOR IOS:
	
	I have written a custom script "glib.sh" which is used to build glib for a given architecture 

	Before running the script the dependencies must be build and script must be modified 
	so as to set "--host" and "--build" attributes accordingly depending on whether build is for ios device or ios simulator and whether architecture is i386 or x86_64 

	The dependencies needed for building glib for ios are libffi,gettext,libiconv in their respective architectures which must be installed in prefix direcory ("$PREFIX")which is "pwd/dependencies" 

	After running the script run "make" and "make install" to  build glib

	we can see glib installed in "PREFIX" which is "pwd/dependencies" in this case 

	For building glib:

	For Simulator:

	set
	--build="i386-apple-darwin" 
	--host="i386-apple-darwin" 

	and call setenv_i386 in the script

	For Ios Devices:

	For ios devices set "ac_cv_func__NSGetEnviron=no" as "NSGetEnviron()" is private API on ios and thus not supported on ios-devices 

	set
	--build="x86_64-apple-darwin" 
	--host="arm-apple-darwin"
  
   	and call setenv_arm64 in the script to build for arm64 
  	and call setenv_arm7 in the script  to build for arm7 
  	and call setenv_armv7 in the script to build for armv7



  	Building Dependencies for glib:

  		Use the script "glib_dependencies.sh" to build libffi,gettext,libiconv
  		keep the script in respective source directories and run them 
  		and then run "make" and "make install" to build the library in "PREFIX" directory

  		set the --host and --build attributes as mentioned above 

  		Note:
  		- use "--host=aarch64-apple-darwin" when building libffi for arm64 
  		- use  ac_cv_func__NSGetEnviron=no for iosdevices
  		- while building gettext use a name for prefix other than "dependencies" because it conflicts with already present file in the source directory and after running make it will show errors such as "crt_externs.h" not found , "environ" not found etc., edit the corresponding files to delete those statements and rerun make untill it is clear of errors










