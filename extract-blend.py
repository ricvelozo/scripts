#!/usr/bin/env python3

"""Extract a .blend file from a Windows executable (.exe)
Author:  Ricardo Silva Veloso (ricvelozo)
Website: https://gitlab.com/ricvelozo/scripts
"""

__version__ = '2.0.0'

import click
import re
from os import path

BUFSIZE = 4 * 1024 * 1024 # 4 MB

@click.command(context_settings=dict(help_option_names=['-h', '--help']))
@click.version_option(version=__version__, message='%(prog)s %(version)s')
@click.argument('executables', metavar='INPUT', nargs=-1)
def extract(executables: list[str]):
    """Extract a .blend file from a Windows executable (.exe)"""

    if not executables:
        executable = input('Enter the URL of the executable file, ' \
                           'or ENTER to exit:\n>>> ')

        if executable.strip():
            executables = [executable]

    for i, executable in enumerate(executables):
        dir, filename = path.split(executable)
        blend = filename[0:-4] if filename.endswith('.exe') else filename
        blend += '.blend'
        if i > 0:
            print()

        try:
            with open(executable, 'rb') as exe:
                print(f'{[i]} Processing `{filename}`...')
                while (buf := exe.read(BUFSIZE)):
                    magic_number = re.search(b'BLENDER_[v|V][0-9]{3}REND', buf)
                    if magic_number is not None:
                        print(f'{[i]} Extracting `{blend}`...')
                        try:
                            with open(path.join(dir, blend), 'wb') as output:
                                start = magic_number.start()
                                output.write(buf[start:])
                                while (buf := exe.read(BUFSIZE)):
                                    output.write(buf)

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
