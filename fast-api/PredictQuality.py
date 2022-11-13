from pydantic import BaseModel 

class PredictMilk(BaseModel):
    pH : float 
    temperature : float 
    taste : int 
    odor : int 
    fat : int 
    turbidity : int 
    color : int