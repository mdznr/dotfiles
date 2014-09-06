# Deletes user defaults in the given domain name matching the given format
# 
# Example usage:
#  
#     swiftcasmdiff example.swift
function swiftcasmdiff
	swiftc -g -o output.s -emit-assembly -Xllvm --x86-asm-syntax=intel -S -O -D COMPARE_A $argv[1]
	mv output.s output.a.s
	
	swiftc -g -o output.s -emit-assembly -Xllvm --x86-asm-syntax=intel -S -O -D COMPARE_B $argv[1]
	mv output.s output.b.s
	
	# TODO: Use different diff tools depending on what is available
	ksdiff output.a.s output.b.s
end
