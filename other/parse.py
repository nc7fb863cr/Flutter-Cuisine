import pandas as pd
import json

file = 'foodList.xlsx'
df = pd.read_excel(file)

_data = {}
for index, row in df.iterrows():
    key = row['Name'].lower()
    _data[key] = {
        'name': row['Name'],
        'key': key,
        'url':'assets/{}.jpg'.format(key),
        'price': row['Price'],
        'calorie': row['Calorie'],
        'protein': row['Protein'],
        'carb': row['Carb'],
        'type': row['Genre']
    }

#print(_data)
data = json.dumps(_data,ensure_ascii=False)
print(data)


