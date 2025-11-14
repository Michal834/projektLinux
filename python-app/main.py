from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from db import db

app = FastAPI(debug=True)

@app.get("/events")
def get_users():
    my_db = db()
    return my_db.get_events()

@app.post("/event")
async def save_event(request: Request):
    user_data = await request.json()
    #sample payload: {"name":"Test","email":"moj@email"}
    my_db = db()
    result = my_db.save_event(user_data)
    return JSONResponse(status_code=201, content=result)

