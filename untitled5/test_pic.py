import load_model as lm
import load_pic as lp

if __name__ == "__main__":
    path = 'pic/666.jpg'
    pic_array = lp.img2array(path)
    res = lm.load_model(pic_array)
    print("The picture\"%s" % path + "\" may be:%d" % res[0])