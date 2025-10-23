# Set the minimum required version of CMake.
# We set this to 2.8 since your version is clearly very old.
cmake_minimum_required(VERSION 2.8)

# Define the project name
project(MyProject CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Create a list of all subdirectory names manually
set(CHAPTER_DIRS
    ch01
    ch02
    ch03
    ch04
    ch05
    ch06
    ch07
    ch08
    ch09
    ch10
    ch11
)

# Loop through the explicit list of directories
foreach(CHAPTER_DIR ${CHAPTER_DIRS})
    
    # Check if the directory exists before trying to add it
    if(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${CHAPTER_DIR})
        # Tell CMake to look inside this subdirectory
        add_subdirectory(${CHAPTER_DIR})
    endif()
    
endforeach()


# # Set the minimum required version of CMake
# cmake_minimum_required(VERSION 3.10)

# # Define the project name (you can change "MyProject")
# project(MyProject CXX)

# # Optional: Set a C++ standard to use for all targets
# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_CXX_EXTENSIONS OFF)

# # Loop from 1 to 11
# foreach(CHAPTER_NUM RANGE 1 11)
    
#     # Format the number as a two-digit string (e.g., "01", "02", ... "11")
#     string(FORMAT CHAPTER_DIR "ch%02d" ${CHAPTER_NUM})
    
#     # Check if the directory exists before trying to add it
#     if(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${CHAPTER_DIR})
#         # Tell CMake to look inside this subdirectory for another CMakeLists.txt
#         add_subdirectory(${CHAPTER_DIR})
#     endif()
    
# endforeach()