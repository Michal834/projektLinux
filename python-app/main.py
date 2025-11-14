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
    #sample payload: {"id_wydarzenia": 123, "nazwa": "Test", "data_poczatek": "2025-11-01", "data_koniec": "2025-11-02", "opis": "Opis", "id_lokalizacja": 1, "id_kategoria": 1, "id_organizator": 1}
    my_db = db()
    result = my_db.save_event(user_data)
    return JSONResponse(status_code=201, content=result)

@app.delete("/event/delete")
async def delete_event(request: Request):
    user_data = await request.json()
    # sample payload: {"id_wydarzenia": 123}
    my_db = db()
    result = my_db.delete_event(user_data)
    return JSONResponse(status_code=200, content=result)

@app.delete("/event/{id_wydarzenia}")
def delete_event_by_id(id_wydarzenia: int): 
    # bardziej RESTowy sposób: użyj metody HTTP DELETE i przekaż id w URL
    my_db = db()
    result = my_db.delete_event({"id_wydarzenia": id_wydarzenia})
    return JSONResponse(status_code=200, content=result)

@app.put("/event/update")
async def update_event(request: Request):
    user_data = await request.json()
    # sample payload: {"id_wydarzenia": 123, "nazwa": "Updated Name", "data_poczatek": "2025-12-01", "data_koniec": "2025-12-02", "opis": "Updated Opis", "id_lokalizacja": 2, "id_kategoria": 2, "id_organizator": 2}
    my_db = db()
    result = my_db.update_event(user_data)
    return JSONResponse(status_code=200, content=result)

@app.put("/event/{id_wydarzenia}")
async def update_event(id_wydarzenia: int, request: Request):
    user_data = await request.json()
    # Upewnij się, że id jest przekazane do metody update_event
    user_data["id_wydarzenia"] = id_wydarzenia
    my_db = db()
    result = my_db.update_event(user_data)
    return JSONResponse(status_code=200, content=result)
