__author__ = 'alexey.a.nabrodov'

import Image

def load():
    fname='layout.png'
    try:
        im = Image.open(fname)
        xsize,ysize=im.size
        for row in xrange(29):
            for col in xrange(13):
                box = ((xsize/14)*col ,(ysize/30)*row, (xsize/14)*(col+1), (ysize/30)*(row+1))
                region = im.crop(box)
                region.save('%d_%d.png' % (row,col), "png")
    except Exception,e:
        print e

load()