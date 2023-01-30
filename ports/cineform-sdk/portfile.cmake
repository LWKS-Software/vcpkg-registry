vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO LWKS-Software/cineform-sdk
  REF bc5118d12921d1c59b95cdcd5d87dc8ac99f1cd0
  SHA512 4e2287ddaa345bceb9c9fb4d3e0508de49db2faf67bcbc7c8f0a817d02fb7013cf5572322ad761f230f8ea13c9b79b4744f2b56d1bb72eff045390cfc3d4d165
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS -DBUILD_STATIC=OFF -DBUILD_SEPARATED=ON -DBUILD_TOOLS=OFF
)
vcpkg_install_cmake()

# make 'vcpkg/packages/cineform-sdk_x64-windows/debug/share/cineform-sdk'
message(STATUS "making folders in: \"${CURRENT_PACKAGES_DIR}\"")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/debug/share/${PORT}")

# remove vcpkg/packages/cineform-sdk_x64-windows/debug/lib/CFHDDecoder.dll
message(STATUS "run remove files in: \"${CURRENT_PACKAGES_DIR}\"")
file(REMOVE "${CURRENT_PACKAGES_DIR}/*.dll")
file(REMOVE "${CURRENT_PACKAGES_DIR}/lib/*.dll")
file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/*.dll")
file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/lib/*.dll")

# needs 'vcpkg/packages/cineform-sdk_x64-windows/debug/share/cineform-sdk'
message(STATUS "run vcpkg_fixup_cmake_targets")
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.txt"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
