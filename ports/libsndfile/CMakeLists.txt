cmake_minimum_required (VERSION 3.0)
project (sndfile)

set(MAIN_SOURCES
	src/aiff.c
	src/alac.c
	src/alaw.c
	src/au.c
	src/audio_detect.c
	src/avr.c
	src/broadcast.c
	src/caf.c
	src/cart.c
	src/chanmap.c
	src/chunk.c
	src/command.c
	src/common.c
	src/dither.c
	src/double64.c
	src/dwd.c
	src/dwvw.c
	src/file_io.c
	src/flac.c
	src/float32.c
	src/g72x.c
	src/gsm610.c
	src/htk.c
	src/id3.c
	src/ima_adpcm.c
	src/ima_oki_adpcm.c
	src/interleave.c
	src/ircam.c
	src/macos.c
	src/mat4.c
	src/mat5.c
	src/mpc2k.c
	src/ms_adpcm.c
	src/nist.c
	src/ogg.c
	src/ogg_opus.c
	src/ogg_pcm.c
	src/ogg_speex.c
	src/ogg_vorbis.c
	src/paf.c
	src/pcm.c
	src/pvf.c
	src/raw.c
	src/rf64.c
	src/rx2.c
	src/sd2.c
	src/sds.c
	src/sndfile.c
	src/strings.c
	src/svx.c
	src/txw.c
	src/ulaw.c
	src/voc.c
	src/vox_adpcm.c
	src/w64.c
	src/wav.c
	src/wavlike.c
	src/windows.c
	src/wve.c
	src/xi.c
)

set(ALAC_SOURCES
	src/ALAC/ag_dec.c
	src/ALAC/ag_enc.c
	src/ALAC/ALACBitUtilities.c
	src/ALAC/alac_decoder.c
	src/ALAC/alac_encoder.c
	src/ALAC/dp_dec.c
	src/ALAC/dp_enc.c
	src/ALAC/matrix_dec.c
	src/ALAC/matrix_enc.c
)

set(G72_SOURCES
	src/G72x/g721.c
	src/G72x/g723_16.c
	src/G72x/g723_24.c
	src/G72x/g723_40.c
	src/G72x/g72x.c
)

set(GSM610_SOURCES
	src/GSM610/add.c
	src/GSM610/code.c
	src/GSM610/decode.c
	src/GSM610/gsm_create.c
	src/GSM610/gsm_decode.c
	src/GSM610/gsm_destroy.c
	src/GSM610/gsm_encode.c
	src/GSM610/gsm_option.c
	src/GSM610/long_term.c
	src/GSM610/lpc.c
	src/GSM610/preprocess.c
	src/GSM610/rpe.c
	src/GSM610/short_term.c
	src/GSM610/table.c
)

add_definitions(-DWIN32 -D_DEBUG -D_CONSOLE -D_LIB -DLIBSNDFILE_PRIVATE_CONFIG -D_USE_MATH_DEFINES -D_CRT_SECURE_NO_WARNINGS)

if(BUILD_SHARED_LIBS)
	add_definitions(-DLIBSNDFILE_DLL -DLIBSNDFILE_DLL_EXPORT)
endif()

include_directories(
	src
	src/ALAC
	src/G72x
	src/GSM610
)

add_library(sndfile ${MAIN_SOURCES} ${ALAC_SOURCES} ${G72_SOURCES} ${GSM610_SOURCES})

install(TARGETS sndfile
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)
