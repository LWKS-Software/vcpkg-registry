vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO LWKS-Software/ntv2
  REF f3114645779bdf6571d97f7b927f571a4ac6878c
  SHA512 9bc27c5d9169b61f02ad0e2ed0b32fc7df6dce7f56bd784821b8a7424e4d14a4af7edfbfbd19b0350e14afef385313a86b054e6ea9acc239ae0f39f2bac38327
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS -DAJA_BUILD_APPS=NO -DAJA_BUILD_DRIVER=NO -DAJA_BUILD_QT_BASED=NO
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
