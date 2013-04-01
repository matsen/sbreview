from SCons.Script import VariantDir, Environment, \
        Builder, Depends, Flatten
import os

VariantDir('_build', src_dir='.')

env = Environment(ENV=os.environ)
inkscape = Builder(action = 'inkscape --without-gui --export-pdf=$TARGET $SOURCE')
env['BUILDERS']['Inkscape'] = inkscape
env['BUILDERS']['Latexdiff'] = Builder(action = 'latexdiff $SOURCES > $TARGET')

svgs = [ ]

pdfs = [env.Inkscape(target="_build/" + os.path.basename(svg).replace('.svg','.pdf'), source=svg)
        for svg in svgs]

sbreview, = env.PDF(target='_build/sbreview.pdf',source='sbreview.tex')
Default([sbreview])

Depends(Flatten([sbreview]),
        Flatten([pdfs, 'sbreview.bib', 'sysbio.bst']))


cont_build = env.Command('.continuous', ['sbreview.bib', 'sbreview.tex', 'sysbio.bst'],
    'while :; do inotifywait -e modify $SOURCES; scons -Q; done')
Alias('continuous', cont_build)


#env.Latexdiff(target='diff.tex',source=['stored_sbreview.tex','sbreview.tex'])
#diff = env.PDF(target='diff.pdf',source='diff.tex')
#Depends(sbreview, sbreview_supp)
