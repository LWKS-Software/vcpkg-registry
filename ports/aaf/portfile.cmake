vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO LWKS-Software/AAF
  REF 73f959bf7783dadbf75db7d8869ebcb387dd262e
  SHA512 65c03edf5ce43ef0c45b596897b376eab1921c7c014224888e6ec5f5f6a16ca7b74deab6777562a6ae0f2d7f1ebcd959427e7f43ad7457e3620ba07ae077ea51
  HEAD_REF main
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LEGAL/AAFSDKPSL.TXT"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
