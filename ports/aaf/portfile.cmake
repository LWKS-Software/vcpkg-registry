vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO LWKS-Software/AAF
  REF 73f959bf7783dadbf75db7d8869ebcb387dd262e
  SHA512 0
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LEGAL/AAFSDKPSL.TXT"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
