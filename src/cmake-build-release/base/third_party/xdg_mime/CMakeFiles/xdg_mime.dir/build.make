# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/guoweiye/workspace/for_test_accurate_formula/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release

# Include any dependencies generated for this target.
include base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/compiler_depend.make

# Include the progress variables for this target.
include base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/progress.make

# Include the compile flags for this target's objects.
include base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/flags.make

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmime.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/flags.make
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmime.c.o: ../base/third_party/xdg_mime/xdgmime.c
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmime.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmime.c.o"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmime.c.o -MF CMakeFiles/xdg_mime.dir/xdgmime.c.o.d -o CMakeFiles/xdg_mime.dir/xdgmime.c.o -c /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmime.c

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmime.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/xdg_mime.dir/xdgmime.c.i"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmime.c > CMakeFiles/xdg_mime.dir/xdgmime.c.i

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmime.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/xdg_mime.dir/xdgmime.c.s"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmime.c -o CMakeFiles/xdg_mime.dir/xdgmime.c.s

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimealias.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/flags.make
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimealias.c.o: ../base/third_party/xdg_mime/xdgmimealias.c
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimealias.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimealias.c.o"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimealias.c.o -MF CMakeFiles/xdg_mime.dir/xdgmimealias.c.o.d -o CMakeFiles/xdg_mime.dir/xdgmimealias.c.o -c /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimealias.c

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimealias.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/xdg_mime.dir/xdgmimealias.c.i"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimealias.c > CMakeFiles/xdg_mime.dir/xdgmimealias.c.i

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimealias.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/xdg_mime.dir/xdgmimealias.c.s"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimealias.c -o CMakeFiles/xdg_mime.dir/xdgmimealias.c.s

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimecache.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/flags.make
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimecache.c.o: ../base/third_party/xdg_mime/xdgmimecache.c
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimecache.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimecache.c.o"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimecache.c.o -MF CMakeFiles/xdg_mime.dir/xdgmimecache.c.o.d -o CMakeFiles/xdg_mime.dir/xdgmimecache.c.o -c /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimecache.c

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimecache.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/xdg_mime.dir/xdgmimecache.c.i"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimecache.c > CMakeFiles/xdg_mime.dir/xdgmimecache.c.i

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimecache.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/xdg_mime.dir/xdgmimecache.c.s"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimecache.c -o CMakeFiles/xdg_mime.dir/xdgmimecache.c.s

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeglob.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/flags.make
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeglob.c.o: ../base/third_party/xdg_mime/xdgmimeglob.c
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeglob.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeglob.c.o"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeglob.c.o -MF CMakeFiles/xdg_mime.dir/xdgmimeglob.c.o.d -o CMakeFiles/xdg_mime.dir/xdgmimeglob.c.o -c /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeglob.c

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeglob.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/xdg_mime.dir/xdgmimeglob.c.i"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeglob.c > CMakeFiles/xdg_mime.dir/xdgmimeglob.c.i

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeglob.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/xdg_mime.dir/xdgmimeglob.c.s"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeglob.c -o CMakeFiles/xdg_mime.dir/xdgmimeglob.c.s

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeicon.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/flags.make
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeicon.c.o: ../base/third_party/xdg_mime/xdgmimeicon.c
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeicon.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeicon.c.o"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeicon.c.o -MF CMakeFiles/xdg_mime.dir/xdgmimeicon.c.o.d -o CMakeFiles/xdg_mime.dir/xdgmimeicon.c.o -c /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeicon.c

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeicon.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/xdg_mime.dir/xdgmimeicon.c.i"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeicon.c > CMakeFiles/xdg_mime.dir/xdgmimeicon.c.i

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeicon.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/xdg_mime.dir/xdgmimeicon.c.s"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeicon.c -o CMakeFiles/xdg_mime.dir/xdgmimeicon.c.s

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeint.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/flags.make
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeint.c.o: ../base/third_party/xdg_mime/xdgmimeint.c
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeint.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeint.c.o"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeint.c.o -MF CMakeFiles/xdg_mime.dir/xdgmimeint.c.o.d -o CMakeFiles/xdg_mime.dir/xdgmimeint.c.o -c /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeint.c

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeint.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/xdg_mime.dir/xdgmimeint.c.i"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeint.c > CMakeFiles/xdg_mime.dir/xdgmimeint.c.i

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeint.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/xdg_mime.dir/xdgmimeint.c.s"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeint.c -o CMakeFiles/xdg_mime.dir/xdgmimeint.c.s

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimemagic.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/flags.make
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimemagic.c.o: ../base/third_party/xdg_mime/xdgmimemagic.c
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimemagic.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimemagic.c.o"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimemagic.c.o -MF CMakeFiles/xdg_mime.dir/xdgmimemagic.c.o.d -o CMakeFiles/xdg_mime.dir/xdgmimemagic.c.o -c /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimemagic.c

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimemagic.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/xdg_mime.dir/xdgmimemagic.c.i"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimemagic.c > CMakeFiles/xdg_mime.dir/xdgmimemagic.c.i

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimemagic.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/xdg_mime.dir/xdgmimemagic.c.s"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimemagic.c -o CMakeFiles/xdg_mime.dir/xdgmimemagic.c.s

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeparent.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/flags.make
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeparent.c.o: ../base/third_party/xdg_mime/xdgmimeparent.c
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeparent.c.o: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeparent.c.o"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeparent.c.o -MF CMakeFiles/xdg_mime.dir/xdgmimeparent.c.o.d -o CMakeFiles/xdg_mime.dir/xdgmimeparent.c.o -c /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeparent.c

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeparent.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/xdg_mime.dir/xdgmimeparent.c.i"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeparent.c > CMakeFiles/xdg_mime.dir/xdgmimeparent.c.i

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeparent.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/xdg_mime.dir/xdgmimeparent.c.s"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime/xdgmimeparent.c -o CMakeFiles/xdg_mime.dir/xdgmimeparent.c.s

# Object files for target xdg_mime
xdg_mime_OBJECTS = \
"CMakeFiles/xdg_mime.dir/xdgmime.c.o" \
"CMakeFiles/xdg_mime.dir/xdgmimealias.c.o" \
"CMakeFiles/xdg_mime.dir/xdgmimecache.c.o" \
"CMakeFiles/xdg_mime.dir/xdgmimeglob.c.o" \
"CMakeFiles/xdg_mime.dir/xdgmimeicon.c.o" \
"CMakeFiles/xdg_mime.dir/xdgmimeint.c.o" \
"CMakeFiles/xdg_mime.dir/xdgmimemagic.c.o" \
"CMakeFiles/xdg_mime.dir/xdgmimeparent.c.o"

# External object files for target xdg_mime
xdg_mime_EXTERNAL_OBJECTS =

base/third_party/xdg_mime/libxdg_mime.a: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmime.c.o
base/third_party/xdg_mime/libxdg_mime.a: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimealias.c.o
base/third_party/xdg_mime/libxdg_mime.a: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimecache.c.o
base/third_party/xdg_mime/libxdg_mime.a: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeglob.c.o
base/third_party/xdg_mime/libxdg_mime.a: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeicon.c.o
base/third_party/xdg_mime/libxdg_mime.a: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeint.c.o
base/third_party/xdg_mime/libxdg_mime.a: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimemagic.c.o
base/third_party/xdg_mime/libxdg_mime.a: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/xdgmimeparent.c.o
base/third_party/xdg_mime/libxdg_mime.a: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/build.make
base/third_party/xdg_mime/libxdg_mime.a: base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking C static library libxdg_mime.a"
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && $(CMAKE_COMMAND) -P CMakeFiles/xdg_mime.dir/cmake_clean_target.cmake
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/xdg_mime.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/build: base/third_party/xdg_mime/libxdg_mime.a
.PHONY : base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/build

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/clean:
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime && $(CMAKE_COMMAND) -P CMakeFiles/xdg_mime.dir/cmake_clean.cmake
.PHONY : base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/clean

base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/depend:
	cd /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/guoweiye/workspace/for_test_accurate_formula/src /home/guoweiye/workspace/for_test_accurate_formula/src/base/third_party/xdg_mime /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime /home/guoweiye/workspace/for_test_accurate_formula/src/cmake-build-release/base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : base/third_party/xdg_mime/CMakeFiles/xdg_mime.dir/depend

