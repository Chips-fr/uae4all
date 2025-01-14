NAME   = uae4all
O      = o
RM     = rm -f
CC     = gcc
#CC     = gcc-3.4
CXX    = g++
#CXX    = g++-3.4
STRIP  = strip

PROG   = $(NAME)

all: $(PROG)

#CYCLONE_CORE=1
FAME_CORE=1
FAME_CORE_C=1
LIB7Z=1

DEFAULT_CFLAGS = `sdl-config --cflags`
LDFLAGS        = `sdl-config --libs` -lz -lbcm_host -L/opt/vc/lib -flto -lpthread


MORE_CFLAGS = -flto -g -O3  -I/opt/vc/include/interface/vmcs_host/linux/ -Isrc/ -I/opt/vc/include/ -I/opt/vc/include/interface/vcos/pthreads/  -Isrc/include/ -Isrc/menu -Isrc/vkbd -fomit-frame-pointer -fno-threadsafe-statics -Wno-unused -Wno-format -DUSE_SDL -DGCCCONSTFUNC="__attribute__((const))" -DUSE_UNDERSCORE -fno-exceptions -DUNALIGNED_PROFITABLE -DREGPARAM="__attribute__((regparm(3)))" -DOPTIMIZED_FLAGS -D__inline__=__inline__ -DSHM_SUPPORT_LINKS=0 -DOS_WITHOUT_MEMORY_MANAGEMENT -DVKBD_ALWAYS


MORE_CFLAGS+= -DROM_PATH_PREFIX=\"./\" -DDATA_PREFIX=\"./data/\" -DSAVE_PREFIX=\"./\"

MORE_CFLAGS+= -DRASPBERRY
MORE_CFLAGS+= -DNO_VKBD

#MORE_CFLAGS+= -DUSE_MAYBE_BLIT
#MORE_CFLAGS+= -DUSE_BLITTER_DELAYED
#MORE_CFLAGS+= -DUSE_BLIT_FUNC
#MORE_CFLAGS+= -DUSE_LARGE_BLITFUNC
#MORE_CFLAGS+= -DUSE_VAR_BLITSIZE
#MORE_CFLAGS+= -DUSE_SHORT_BLITTABLE
#MORE_CFLAGS+= -DUSE_BLIT_MASKTABLE
#MORE_CFLAGS+= -DUSE_RASTER_DRAW
MORE_CFLAGS+= -DUSE_ALL_LINES
#MORE_CFLAGS+= -DUSE_LINESTATE
#MORE_CFLAGS+= -DUSE_DISK_UPDATE_PER_LINE
#MORE_CFLAGS+= -DDOUBLEBUFFER
#MORE_CFLAGS+= -DMENU_MUSIC
#MORE_CFLAGS+= -DUSE_AUTOCONFIG
#MORE_CFLAGS+= -DUAE_CONSOLE

MORE_CFLAGS+= -DUSE_ZFILE

#MORE_CFLAGS+= -DUAE4ALL_NO_USE_RESTRICT

#MORE_CFLAGS+= -DNO_SOUND
#MORE_CFLAGS+= -DNO_THREADS
#MORE_CFLAGS+= -DEXACT_AUDIO
#MORE_CFLAGS+= -DSOUND_AHI
#MORE_CFLAGS+= -DCUT_COPPER
#MORE_CFLAGS+= -DEXACT_CURRENT_HPOS
#MORE_CFLAGS+= -DUSE_SPECIAL_MEM

#MORE_CFLAGS+= -DDEBUG_TIMESLICE

MORE_CFLAGS+= -DEMULATED_JOYSTICK
MORE_CFLAGS+= -DFAME_INTERRUPTS_PATCH
#MORE_CFLAGS+= -DFAME_INTERRUPTS_SECURE_PATCH
#MORE_CFLAGS+= -DSECURE_BLITTER

#MORE_CFLAGS+= -DUAE_MEMORY_ACCESS
#MORE_CFLAGS+= -DSAFE_MEMORY_ACCESS
#MORE_CFLAGS+= -DERROR_WHEN_MEMORY_OVERRUN

MORE_CFLAGS+= -DDEBUG_UAE4ALL
#MORE_CFLAGS+= -DDEBUG_UAE4ALL_FFLUSH
#MORE_CFLAGS+= -DDEBUG_M68K
#MORE_CFLAGS+= -DDEBUG_INTERRUPTS
#MORE_CFLAGS+= -DDEBUG_CYCLES
#MORE_CFLAGS+= -DDEBUG_CIA
MORE_CFLAGS+= -DDEBUG_SOUND
#MORE_CFLAGS+= -DDEBUG_MEMORY
#MORE_CFLAGS+= -DDEBUG_MAPPINGS
#MORE_CFLAGS+= -DDEBUG_DISK
#MORE_CFLAGS+= -DDEBUG_CUSTOM
#MORE_CFLAGS+= -DDEBUG_EVENTS
#MORE_CFLAGS+= -DDEBUG_SAVESTATE
#MORE_CFLAGS+= -DDEBUG_GFX -DDEBUG_BLITTER
#MORE_CFLAGS+= -DDEBUG_FRAMERATE
#MORE_CFLAGS+= -DAUTO_FRAMERATE=1400
#MORE_CFLAGS+= -DMAX_AUTO_FRAMERATE=4400
#MORE_CFLAGS+= -DAUTO_FRAMERATE_SOUND
#MORE_CFLAGS+= -DSTART_DEBUG=588
#MORE_CFLAGS+= -DMAX_AUTOEVENTS=1856
#MORE_CFLAGS+= -DSTART_DEBUG_SAVESTATE
#MORE_CFLAGS+= -DAUTO_SAVESTATE=101
#MORE_CFLAGS+= -DMAX_AUTOEVENTS=589
#MORE_CFLAGS+= -DAUTO_RUN
#MORE_CFLAGS+= -DAUTOEVENTS
#MORE_CFLAGS+= -DPROFILER_UAE4ALL
#MORE_CFLAGS+= -DAUTO_PROFILER=4000
#MORE_CFLAGS+= -DMAX_AUTO_PROFILER=5000

CFLAGS  = $(DEFAULT_CFLAGS) $(MORE_CFLAGS)

OBJS =	\
	src/savestate.o \
	src/audio.o \
	src/autoconf.o \
	src/blitfunc.o \
	src/blittable.o \
	src/blitter.o \
	src/cia.o \
	src/savedisk.o \
	src/compiler.o \
	src/custom.o \
	src/disk.o \
	src/drawing.o \
	src/ersatz.o \
	src/gfxutil.o \
	src/keybuf.o \
	src/main.o \
	src/md-support.o \
	src/memory.o \
	src/missing.o \
	src/gui.o \
	src/od-joy.o \
	src/sound_sdl_new.o \
	src/raspbgfx.o \
	src/writelog.o \
	src/zfile.o \
	src/menu/fade.o \
	src/menu/menu.o \
	src/menu/menu_load.o \
	src/menu/menu_save.o \
	src/menu/menu_main.o \
	src/vkbd/vkbd.o \


ifdef LIB7Z
CFLAGS+=-DUSE_LIB7Z
OBJS+= \
	src/lib7z/7zAlloc.o \
	src/lib7z/7zBuf2.o \
	src/lib7z/7zBuf.o \
	src/lib7z/7zCrc.o \
	src/lib7z/7zDecode.o \
	src/lib7z/7zExtract.o \
	src/lib7z/7zFile.o \
	src/lib7z/7zHeader.o \
	src/lib7z/7zIn.o \
	src/lib7z/7zItem.o \
	src/lib7z/7zStream.o \
	src/lib7z/Alloc.o \
	src/lib7z/Bcj2.o \
	src/lib7z/Bra86.o \
	src/lib7z/BraIA64.o \
	src/lib7z/Bra.o \
	src/lib7z/LzFind.o \
	src/lib7z/LzmaDec.o \
	src/lib7z/LzmaEnc.o \
	src/lib7z/lzma.o
endif

ifdef FAME_CORE
ifdef FAME_CORE_C
#CFLAGS+=-DUSE_FAME_CORE -DUSE_FAME_CORE_C -DFAME_INLINE_LOOP -DFAME_IRQ_CLOCKING -DFAME_CHECK_BRANCHES -DFAME_EMULATE_TRACE -DFAME_DIRECT_MAPPING -DFAME_BYPASS_TAS_WRITEBACK -DFAME_ACCURATE_TIMING -DFAME_GLOBAL_CONTEXT -DFAME_FETCHBITS=8 -DFAME_DATABITS=8 -DFAME_GOTOS -DFAME_EXTRA_INLINE=__inline__ -DFAME_NO_RESTORE_PC_MASKED_BITS
CFLAGS+=-DUSE_FAME_CORE -DUSE_FAME_CORE_C -DFAME_IRQ_CLOCKING -DFAME_CHECK_BRANCHES -DFAME_EMULATE_TRACE -DFAME_DIRECT_MAPPING -DFAME_BYPASS_TAS_WRITEBACK -DFAME_ACCURATE_TIMING -DFAME_GLOBAL_CONTEXT -DFAME_FETCHBITS=8 -DFAME_DATABITS=8 -DFAME_NO_RESTORE_PC_MASKED_BITS
src/m68k/fame/famec.o: src/m68k/fame/famec.cpp
OBJS += src/m68k/fame/famec.o
else
CFLAGS+=-DUSE_FAME_CORE
src/m68k/fame/fame.o: src/m68k/fame/fame.asm
	nasm -f elf src/m68k/fame/fame.asm
OBJS += src/m68k/fame/fame.o
endif
OBJS += src/m68k/fame/m68k_intrf.o
else # FAME_CORE
ifdef CYCLONE_CORE
# use all FAME hacks in uae code for Cyclone too
CFLAGS+=-DUSE_FAME_CORE
CFLAGS+=-DUSE_CYCLONE_CORE
#ASFLAGS+=-mfloat-abi=soft -mcpu=arm920t
OBJS += src/m68k/cyclone/cyclone.o
OBJS += src/m68k/m68k_cmn_intrf.o
OBJS += src/m68k/cyclone/m68k_intrf.o
CFLAGS+=-DUSE_CYCLONE_MEMHANDLERS
OBJS += src/m68k/cyclone/memhandlers.o
else
OBJS += \
	src/m68k/uae/newcpu.o \
	src/m68k/uae/readcpu.o \
	src/m68k/uae/cpudefs.o \
	src/m68k/uae/fpp.o \
	src/m68k/uae/cpustbl.o \
	src/m68k/uae/cpuemu.o
endif
endif

CPPFLAGS  = $(CFLAGS)

$(PROG): $(OBJS) 
	$(CC) $(CFLAGS) -o $(PROG) $(OBJS) $(LDFLAGS)
#	$(STRIP) $(PROG)


run: $(PROG)
	./$(PROG)

clean:
	$(RM) $(PROG) $(OBJS)


