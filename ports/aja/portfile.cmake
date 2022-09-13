vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO "aja-video/ntv2"
  REF 93a811d321bc5d2be6e9b8443bfff905cac731cf
  SHA512 0
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS -DBUILD_STATIC=OFF -DBUILD_SEPARATED=ON -DBUILD_TOOLS=OFF
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
