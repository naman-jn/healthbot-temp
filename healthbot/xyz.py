#!/usr/bin/python
# -*- coding: utf-8 -*-
import tensorflow as tf

diseases = [
    'Apple___Apple_scab',
    'Apple___Black_rot',
    'Apple___Cedar_apple_rust',
    'Apple___healthy',
    'Blueberry___healthy',
    'Cherry_(including_sour)___Powdery_mildew',
    'Cherry_(including_sour)___healthy',
    'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot',
    'Corn_(maize)___Common_rust_',
    'Corn_(maize)___Northern_Leaf_Blight',
    'Corn_(maize)___healthy',
    'Grape___Black_rot',
    'Grape___Esca_(Black_Measles)',
    'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)',
    'Grape___healthy',
    'Orange___Haunglongbing_(Citrus_greening)',
    'Peach___Bacterial_spot',
    'Peach___healthy',
    'Pepper,_bell___Bacterial_spot',
    'Pepper,_bell___healthy',
    'Potato___Early_blight',
    'Potato___Late_blight',
    'Potato___healthy',
    'Raspberry___healthy',
    'Soybean___healthy',
    'Squash___Powdery_mildew',
    'Strawberry___Leaf_scorch',
    'Strawberry___healthy',
    'Tomato___Bacterial_spot',
    'Tomato___Early_blight',
    'Tomato___Late_blight',
    'Tomato___Leaf_Mold',
    'Tomato___Septoria_leaf_spot',
    'Tomato___Spider_mites Two-spotted_spider_mite',
    'Tomato___Target_Spot',
    'Tomato___Tomato_Yellow_Leaf_Curl_Virus',
    'Tomato___Tomato_mosaic_virus',
    'Tomato___healthy',
]


def getResult(img_shape=256, scale=True):

    model = tf.keras.models.load_model('./model')

    # Read in the image

    img = tf.io.read_file('./output.jpg')

    # Decode it into a tensor

    img = tf.image.decode_jpeg(img)

    # Resize the image

    img = tf.image.resize(img, [img_shape, img_shape])
    if scale:

        # Rescale the image (get all values between 0 and 1)

        img = img / 255.

    pred = model.predict(tf.expand_dims(img, axis=0))

    # Get the predicted class

    if len(pred[0]) > 1:  # check for multi-class
        # if more than one output, take the max
        pred_class = diseases[pred.argmax()]
    else:
        # if only one output, round
        pred_class = diseases[int(tf.round(pred)[0][0])]

    return pred_class
