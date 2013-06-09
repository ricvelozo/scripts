#!/usr/bin/python3
# -*- coding: UTF-8 -*-

"""Extract a .blend file of a Windows executable (.exe)
Author:  Ricardo Silva Veloso (Ricvelozo)
Website: http://ricvelozo.blogspot.com/
"""

import os
import re
import sys

def extract_blend(executable_url):
    blend_dir, exe_name = os.path.split(executable_url)
    blend_name = exe_name[0:-3] + "blend"

    try:
        executable_file = open(executable_url, "rb")
        print("Processing \"" + exe_name + "\"...")

        line = b""
        while True:
            line_temp = executable_file.read(1024)
            if line_temp == b"":
                print("The file \"" + exe_name + "\" does not have a " \
                      ".blend file")
                break

            line = line + line_temp
            pos = re.search(b"BLENDER_[v|V][0-9]{3}REND", line)
            if not pos == None:
                try:
                    blend_file = open(os.path.join(blend_dir, blend_name),
                                      "wb")
                    pos = pos.start()

                    print("Extracting \"" + exe_name + "\"...")
                    blend_file.write(line[pos:len(line)])

                    while True:
                        line_temp = executable_file.read(1024)
                        if line_temp == b"":
                            break

                        blend_file.write(line_temp)

                    blend_file.close()
                    print(".blend file extracted: \"" + blend_name + "\"")

                except IOError:
                    print("Could not create the .blend file \"" + blend_name +
                          "\"!")

                break
            
            line = line_temp[-32:len(line_temp)]

    except IOError:
        print("Could not open the file \"" + exe_name + "\"")
        return False


if len(sys.argv) > 1:
    args = sys.argv[1:len(sys.argv)]

    # Extract the .blend file(s)
    for arg in args:
        extract_blend(arg)

else:
    while True:
        executable_url = input("Enter the URL of the executable file, or " \
                               "ENTER to exit:\n>>> ")

        # Empty line on Unix-like and Windows, respectively
        if len(executable_url) == 0 or executable_url == '\r':
            break

        else:
            # Remove the '\r' character on Windows
            if executable_url[-1] == '\r':
                executable_url = executable_url[0:-1]

            # Extract the .blend file
            extract_blend(executable_url)
