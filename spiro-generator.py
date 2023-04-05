import math
def spirograph():
    TMTx = -118.2854482493822
    TMTy = 34.020581098750505 
    R, r,a = 6,1,8
    x0 = R +r-a
    y0 = 0
    cos = math.cos
    sin = math.sin
    pi = math.pi
    nRev = 15
    t =0.0
    li = list()
    while t < (pi *nRev):
        x = (R+r) * cos((r/R)*t) - a*cos((1+r/R)*t)
        y = (R+r) * sin((r/R)*t) - a*sin((1+r/R)*t)
        x = x * 0.0001 + TMTx
        y = y * 0.0001 + TMTy
        # print(x,y)
        li.append([x,y])
        t+=0.01
    return li

def kml_syntax(coord):
    output =""""""
    string = """<Placemark>
                <styleUrl>#z1</styleUrl>
                <Point>
                <coordinates>{0:.6f},{1:.6f}</coordinates>
                </Point>
                </Placemark>\n"""
    for lon,lat in coord:
        output+=string.format(lon,lat)
    file1 = open("spirograph.txt",'w+')
    file1.write(output)
    file1.close()

coord = spirograph()
kml_syntax(coord)