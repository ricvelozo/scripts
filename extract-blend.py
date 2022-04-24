#!/usr/bin/env python3

"""Extract a .blend file from a Windows executable (.exe).
Website: https://gitlab.com/ricvelozo/scripts
"""

__version__ = '2.1.0'
__author__ = 'Ricardo Silva Veloso'

import click
import re
from io import DEFAULT_BUFFER_SIZE
from os import path

@click.command(context_settings=dict(help_option_names=['-h', '--help']))
@click.version_option(version=__version__, message='%(prog)s %(version)s')
@click.argument('executables', metavar='INPUT', nargs=-1)
def extract(executables: list[str]):
    """Extract a .blend file from a Windows executable (.exe)."""

    if not executables:
        executable = input('Enter the URL of the executable file, ' \
                           'or ENTER to exit:\n>>> ').strip()
        if executable:
            executables = [executable]

    for i, executable in enumerate(executables):
        dir, filename = path.split(executable)
        blend = filename[:-4] if filename.endswith('.exe') else filename
        blend += '.blend'
        if i > 0:
            print()
        try:
            with open(executable, 'rb') as exe:
                print(f'{[i]} Processing `{filename}`...')
                prog = re.compile(b'BLENDER[_|-][v|V][0-9]{3}')
                bigger_chunk = b''
                while chunk := exe.read(DEFAULT_BUFFER_SIZE):
                    bigger_chunk += chunk
                    magic_number = prog.search(bigger_chunk)
                    if magic_number is None:
                        # Include the last 12 bytes in the next search
                        bigger_chunk = bigger_chunk[-12:]
                    else:
                        print(f'{[i]} Extracting `{blend}`...')
                        try:
                            with open(path.join(dir, blend), 'wb') as output:
                                # The .blend file's start
                                start = magic_number.start()
                                output.write(bigger_chunk[start:])

                                while chunk := exe.read(DEFAULT_BUFFER_SIZE):
                                    output.write(chunk)
                        except IOError:
                            print(f'{[i]} Could not open the file `{blend}`.')
                        break
                if magic_number is None:
                    print(f'{[i]} The file `{filename}` does not have a ' \
                           '.blend file.')
        except IOError:
            print(f'{[i]} Could not open the file `{filename}`.')

if __name__ == '__main__':
    extract()
