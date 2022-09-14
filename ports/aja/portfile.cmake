vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO aja-video/ntv2
  REF 93a811d321bc5d2be6e9b8443bfff905cac731cf
  SHA512 61eae40797156be3b9f639e321929b5d4509f96354833a4c594de548678199fa7ef80633dc6a5708d50e01f39699e326a5694cb5917d8124ffb4c7cc43cfe858
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
