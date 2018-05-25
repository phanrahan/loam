# For building FPGA image with Quartus

TARGET=out

$(TARGET).sof: 
	quartus_map $(TARGET)
	quartus_fit $(TARGET)
	quartus_asm $(TARGET)
	mv output_files/$(TARGET).sof $(TARGET).sof

upload: $(TARGET).sof
	quartus_pgm --mode=jtag -o "p;$(TARGET).sof"

clean:
	rm -rf incremental_db db output_files *.qpf *.sof *.qsf *.v

