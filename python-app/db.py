from dbconnection import get_connection
class db:
    def __init__(self):
        self.connection = get_connection()

    def get_events(self):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM wydarzenia")
        users = cursor.fetchall()
        cursor.close()
        conn.close()
        return users
    
    def save_event(self, user_data):
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("INSERT INTO wydarzenia (id_wydarzenia, nazwa, data_poczatek, data_koniec, opis, id_lokalizacja, id_kategoria, id_organizator) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)", (user_data['id_wydarzenia'], user_data['nazwa'], user_data['data_poczatek'], user_data['data_koniec'], user_data['opis'], user_data['id_lokalizacja'], user_data['id_kategoria'], user_data['id_organizator']))
        conn.commit()
        cursor.close()
        conn.close()
        return { "status":"ok","added_id": cursor.lastrowid } 
