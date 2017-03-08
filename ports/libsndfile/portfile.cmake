# Common Ambient Variables:
#   VCPKG_ROOT_DIR = <C:\path\to\current\vcpkg>
#   TARGET_TRIPLET is the current triplet (x86-windows, etc)
#   PORT is the current port name (zlib, etc)
#   CURRENT_BUILDTREES_DIR = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR  = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#

include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/libsndfile-MSVC-1.0.27-4)
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/lordmulder/libsndfile-MSVC/archive/1.0.27-4.tar.gz"
    FILENAME "libsndfile-1.0.27-4.tar.gz"
    SHA512 6c8f128cdc322cc4d42addb0b9206195cbc68197cf348f9c4f2368417e1c30d78c7361c33a431800b1741207da268936c2fba9ae56b759cdfde1c0fadd5da30a
)
vcpkg_extract_source_archive(${ARCHIVE})

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_apply_patches(
        SOURCE_PATH ${SOURCE_PATH}/src
        PATCHES
                ${CMAKE_CURRENT_LIST_DIR}/config.patch)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

file(COPY ${SOURCE_PATH}/src/sndfile.h DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(COPY ${SOURCE_PATH}/src/sndfile.hh DESTINATION ${CURRENT_PACKAGES_DIR}/include)

if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
    vcpkg_apply_patches(
            SOURCE_PATH ${CURRENT_PACKAGES_DIR}/include
            PATCHES
                    ${CMAKE_CURRENT_LIST_DIR}/add_define.patch)
endif()

# Handle copyright
file(COPY ${SOURCE_PATH}/COPYING.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/libsndfile)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/libsndfile/COPYING.txt ${CURRENT_PACKAGES_DIR}/share/libsndfile/copyright)
