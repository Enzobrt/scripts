import os
from os import listdir
from os.path import isfile
from datetime import datetime
#import pandas as pd
#import matplotlib.pyplot as plt

dir = "/home/enzo/Documents/notas-obsidian/Notas diarias/"
files = [f for f in os.listdir(dir) if os.path.isfile(os.path.join(dir, f))]
sorted_files = sorted(files)

def leer_archivo(archivo):
    pelis = []
    actividades = []
    despertarse = ""
    dormir = ""
    with open(archivo) as file:
        next(file) # Salta la primera linea #Notas-diarias
        apartado = 0
        stripped = ""
        for line in file:
            stripped = line.strip().lower()
            if len(stripped) == 0:
                continue
            match stripped:
                case "# actividades" | "# sucesos":
                    apartado = 1
                    continue
                case "# pelis":
                    apartado = 2
                    continue
                case "# hora de despertarse/dormir":
                    apartado = 3
                    continue

            # tratamiento: funciona raro, mejor no usar
            """
            inicio_parentesis = stripped.find("(")
            final_parentesis = stripped.find(")")
            stripped = stripped[:inicio_parentesis] + stripped[final_parentesis + 1:]

            inicio_flecha = stripped.find("→")
            stripped = stripped[:inicio_flecha - 1]
            """

            match apartado:
                case 1:
                    if stripped[0] == "-":
                        stripped = stripped[2:] # Salta el guion al principio de la linea
                    else:
                        stripped = "fallito"
                    actividades.append(stripped)

                case 2:
                    if stripped[0] == "-":
                        stripped = stripped[2:] # Salta el guion al principio de la linea
                    else:
                        stripped = "fallito"
                    pelis.append(stripped)
                case 3:
                    if "- Me he despertado:" in stripped:
                        stripped.replace("Me he despertado:", "")
                        despertarse = stripped
                    if "- Me he dormido:" in stripped:
                        stripped.replace("Me he dormido: ", "")
                        dormir = stripped

    return pelis, actividades, despertarse, dormir

lista_pelis = []
lista_actividades = {}
lista_mimir = []

archivos_encontrados = 0

for i in sorted_files:
    archivo = dir + i
    archivos_encontrados += 1

    pelis, actividades, despertarse, dormir = leer_archivo(archivo)
    for cinematografía in pelis:
        lista_pelis.append(cinematografía)
    for acto in actividades:
        if acto not in lista_actividades.keys():


            lista_actividades[acto] = 1
        else:
            lista_actividades[acto] += 1

    dia = i[:-3]
    if len(despertarse) == 0:
        continue
    else:
        hora_despertarse = datetime.strptime(f"{dia} {despertarse}", '%Y-%m-%d %H:%M').date()
        lista_mimir.append(hora_despertarse)
        print(hora_despertarse)

    if len(dormir) == 0:
        continue
    else:
        hora_dormir = datetime.strptime(f"{dia} {dormir}", '%Y-%m-%d %H:%M').date()
        lista_mimir.append(hora_dormir)
        print(hora_dormir)


print(f"Pelis:\n{lista_pelis}\nActividades:\n{lista_actividades}\nMimir:\n{lista_mimir}")
print(f"Nº archivos encontrados: {archivos_encontrados}")

with open("lista-pelis.txt", "w") as file:
    for line in lista_pelis:
        file.write(line)
        file.write(", ")

"""
df = pd.DataFrame([lista_actividades])
df.to_csv('lista-actividades.csv', index=False, encoding='utf-8')

df.plot()
plt.show()
"""
