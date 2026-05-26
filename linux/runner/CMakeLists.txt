cmake_minimum_required(VERSION 3.13)
project(runner LANGUAGES CXX)

# Define the application target. To change its name, change BINARY_NAME in the
# top-level CMakeLists.txt, not the value here, or `flutter run` will no longer
# work.
#
# Any new source files that you add to the application should be added here.
add_executable(${BINARY_NAME}
  "main.cc"
  "my_application.cc"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
)

include("${CMAKE_CURRENT_SOURCE_DIR}/../../rust_builder/cargokit/cmake/cargokit.cmake")

# 2. Call the function with the exact arguments expected:
# apply_cargokit(target, manifest_dir, lib_name, any_symbol_name)
apply_cargokit(
    ${BINARY_NAME} 
    "../../rust"                  # Relative path from runner directory to your Rust folder
    "rust_lib_animebox"           # Cargo package name (without lib or .so)
    ""                            # Symbol name (used for Windows, can be anything dummy for Linux)
)

# 3. Elevate the library path variable to the top-level scope so your main CMakeLists can find it
set(${BINARY_NAME}_cargokit_lib "${${BINARY_NAME}_cargokit_lib}" PARENT_SCOPE)

# Apply the standard set of build settings. This can be removed for applications
# that need different build settings.
apply_standard_settings(${BINARY_NAME})

# Add preprocessor definitions for the application ID.
add_definitions(-DAPPLICATION_ID="${APPLICATION_ID}")

# Add dependency libraries. Add any application-specific dependencies here.
target_link_libraries(${BINARY_NAME} PRIVATE flutter)
target_link_libraries(${BINARY_NAME} PRIVATE PkgConfig::GTK)

target_include_directories(${BINARY_NAME} PRIVATE "${CMAKE_SOURCE_DIR}")
