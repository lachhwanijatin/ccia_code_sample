cmake_minimum_required(VERSION 3.10)
project(Listings)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find pthread library
find_package(Threads REQUIRED)

# Find all .cpp files in the current directory
file(GLOB CPP_FILES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

# Create an executable for each .cpp file
foreach(CPP_FILE ${CPP_FILES})
    # Get the filename without path
    get_filename_component(FILENAME ${CPP_FILE} NAME)
    
    # Extract the target name (e.g., "listing_12.1.cpp" -> "12.1")
    # Using FILENAME (not NAME_WE) to preserve the full name with dots
    string(REGEX REPLACE "^listing_([0-9]+\\.[0-9]+)\\.cpp$" "\\1" TARGET_NAME ${FILENAME})
    
    # Only process if the filename matches the expected pattern
    if(NOT TARGET_NAME STREQUAL FILENAME)
        # Create executable
        add_executable(${TARGET_NAME} ${CPP_FILE})
        
        # Link pthread library
        target_link_libraries(${TARGET_NAME} PRIVATE Threads::Threads)
        
        message(STATUS "Added target: ${TARGET_NAME} from ${FILENAME}")
    endif()
endforeach()