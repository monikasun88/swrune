from PIL import Image
import urllib2 as urllib
import io
import pytesseract

fd = urllib.urlopen("http://i.imgur.com/VuWnfee.jpg")
image_file = io.BytesIO(fd.read())
im = Image.open(image_file)

print(pytesseract.image_to_string(im))



