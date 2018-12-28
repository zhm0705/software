import cv2
import numpy as np


def img2array(pic_path):
    img = cv2.imread(pic_path, cv2.IMREAD_GRAYSCALE)
    img = cv2.resize(img, (28, 28), 0, 0, cv2.INTER_LINEAR)
    #cv2.imshow("cxc",img)
    img_np = np.array(img)
    img_np = img_np.reshape([784])
    #cv2.waitKey(0)
    return img_np

