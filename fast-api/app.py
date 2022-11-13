import uvicorn
from fastapi import FastAPI , Request
from PredictQuality import PredictMilk
import pickle 
from fastapi.responses import JSONResponse
import numpy as np
import pandas as pd 

app = FastAPI()

pickle_in = open('milkquality.pkl','rb')
classifier = pickle.load(pickle_in) 

@app.get('/')
def get_name():
    return {'message': f'Hello, Man'}

@app.get('/{name}')
def get_name(name: str):
    return {'message': f'Hello, {name}'} 

@app.post('/predict')
def predict_result(data: PredictMilk):
    print(data)
    print(type(data))
    data = data.dict()
    pH = data['pH']
    temperature = data['temperature']
    taste = data['taste']
    odor = data['odor']
    fat = data['fat']
    turbidity = data['turbidity']
    color = data['color']
    predict_arr = [pH , temperature , taste , odor , fat , turbidity , color]
    print(predict_arr)
    numpy_arr = np.asarray(predict_arr)
    reshaped_array = numpy_arr.reshape(-7,7)
    prediction = classifier.predict(reshaped_array)
    print(prediction)

    if(prediction[0]==0):
        pred_res = "Low Quality Milk"
    elif(prediction[0]==1):
        pred_res = "Medium Quality Milk"
    else:
        pred_res = "High Quality Milk"

    return {'prediction':pred_res}

@app.exception_handler(ValueError)
async def value_error_exception_handler(request: Request, exc: ValueError):
    return JSONResponse(
        status_code=400,
        content={"message": str(exc)},
    )


if(__name__)=='__main__':
    uvicorn.run(app , host='0.0.0.0' , port=7000)


