#!/usr/bin/env python3

"""Extract a .blend file from a Windows executable (.exe).
Website: https://gitlab.com/ricvelozo/scripts
"""

__version__ = '2.3.2'
__author__ = 'Ricardo Silva Veloso'

import click
import re
from pathlib import Path

@click.command(context_settings=dict(help_option_names=['-h', '--help']))
@click.version_option(version=__version__, message='%(prog)s %(version)s')
@click.argument('executables', metavar='INPUT', nargs=-1)
def extract(executables: list[str]):
    """Extract a .blend file from a Windows executable (.exe)."""
    magic_number_prog = re.compile(b'BLENDER[_|-][v|V][0-9]{3}')
    if not executables:
        executables = [input('Enter the URL of the executable file, ' \
                             'or ENTER to exit:\n>>> ').strip()]
    executables = [Path(exe) for exe in executables if exe]
    for i, exe_path in enumerate(executables):
        blend_path = exe_path.with_suffix('.blend')
        exe_name, blend_name = exe_path.name, blend_path.name
        try:
            if i > 0:
                print()
            with exe_path.open('rb') as exe:
                print(f'{[i]} Processing `{exe_name}`...')
                bigger_chunk = bytes()
                magic_number = None

                # Search for the .blend file's magic number
                while chunk := exe.read1():
                    bigger_chunk += chunk
                    if magic_number := magic_number_prog.search(bigger_chunk):
                        print(f'{[i]} Extracting `{blend_name}`...')
                        try:
                            with blend_path.open('wb') as blend:
                                # Copy the .blend file's start
                                start = magic_number.start()
                                blend.write(bigger_chunk[start:])

                                # Copy the rest of the .blend file
                                while chunk := exe.read1():
                                    blend.write(chunk)
                        except IOError:
                            print(f'{[i]} Could not write to `{blend_name}`.')
                        break
                    else:
                        # Keep only the last 12 bytes for the next search
                        bigger_chunk = bigger_chunk[-12:]

                # EOF
                if magic_number is None:
                    print(f'{[i]} The file `{exe_name}` does not have a ' \
                           '.blend file.')
        except IOError:
            print(f'{[i]} Could not open the file `{exe_name}`.')

if __name__ == '__main__':
    extract()
