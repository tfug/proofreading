import os
import sys
import click
import html2text

@click.command()
@click.option('--input_file', '-i', default=None)
@click.option('--output_dir', '-o', default=None)
def main(input_file, output_dir):
    if input_file is None or output_dir is None:
        print('invalid arguments')
        sys.exit(1)
    else:
        try:
            with open(input_file, 'r') as f:
                html = f.read()
        except:
            print(f'{input_file} does not exist')
            sys.exit(1)
        text = html2text.html2text(html)
        output_file = '{}.md'.format(os.path.basename(input_file).split('.')[0])
        output = os.path.join(output_dir, output_file)
        try:
            with open(output, 'w') as f:
                f.write(text)
        except:
            print('output path does not exist')
        print(f'converted {input_file} to {output_dir}')
        sys.exit(0)

if __name__ == '__main__':
    main()
