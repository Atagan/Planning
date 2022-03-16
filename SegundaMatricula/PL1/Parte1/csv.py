

def leerData(fichero):
    lista=[]
    for line in fichero:
        line=line.replace("FF: {","")
        line=line.replace("LPG-TD: {","")
        line=line.replace("SGPLAN40: {","")
        line=line.replace("SATPLAN: {","")
        line.replace("}","")

        inner_list = [elt.strip() for elt in line.split(',')]
        lista.append(inner_list)
    return lista
    

def writeData(listas):
    listaTiempos=[]
    fichero= open("Tiempos.csv","w+")

    #fichero.write("\nFF\nLPG-TD\nSGPLAN40\nSATPLAN")
    fichero.write("\n")
    contador=0
    for lista in listas:
        listaTiempos.append([])
        print(contador)
        for valor in lista:
             inner_list = [elt.strip() for elt in valor.split(':')]
             listaTiempos[contador].append(inner_list[1])
        contador=contador+1
        
    print(listaTiempos)
    for lista in listaTiempos:
        for tiempo in lista:
            fichero.write(";"+str(tiempo))
        fichero.write("\n")
       

    


fichero = open("resumen.txt","r")
listas=leerData(fichero)
#print(listas)

writeData(listas)

