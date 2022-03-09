import os
import time


def main():
    problemas=[]
    print("Creamos los problemas necesarios (rango 10-100).\n")
    for i in range(1,11):
        cantidad=10*i
        aux=" -l " + str((int(cantidad//2))) + " -p "+str((int(cantidad)))+" -c " + str((int(cantidad))) + " -g "+str((int(cantidad)))
        cmd= "python3 generate-problem.py -d 1 -r 0" + aux
        os.system(cmd) #Descomentar para que funcione, pero no quiero que me pete la carpeta uwu
        aux="drone_problem_d1_r0_l"+str((int(cantidad//2)))+"_p"+str((int(cantidad)))+"_c"+str((int(cantidad)))+"_g"+str((int(cantidad)))+"_ct2.pddl"
        problemas.append(aux)

    #Aqui ejecutamos los problemas sobre planificador FF, la ejecucion se detiene tras planear el ultimo problema o tras que un plan tarde más de 5 minutos en ejecutarse
    tiemposFF=ejecutar_planificador(problemas,"./ff -o AidRelief.pddl -f ")

    #TODO: ejecutar LPG-TD
    tiemposLPG=ejecutar_planificador(problemas,"")

    #TODO: ejecutar SGPLAN40
    tiemposSGPlan=ejecutar_planificador(problemas,"")

    #TODO: ejecutar SATPLAN
    tiemposSATPlan=ejecutar_planificador(problemas,"")

    #TODO: ejecutar FastDownward
    tiemposFD=ejecutar_planificador(problemas,"")


    #Limpiamos el directorio:
    for x in problemas:
        cmd="rm "+x
        os.system(cmd)


def ejecutar_planificador(problemas, planificador):
    tiempos=[]
    tiempo=0
    contador=0
    while(tiempo<300000 and contador<len(problemas)):
        print("Buscamos plan para el problema: "+str(contador)+"\n")
        cmd=planificador + problemas[contador]
        inicio=current_milli_time()
        
        os.system(cmd)
        fin=current_milli_time()
        tiempo=fin-inicio
        #print("\n"+str(tiempo)+"\n")
        contador+=1
        tiempos.append(tiempo)

    if((contador)<len(problemas)):
        print("Se ha excedido el tiempo máximo de 5 minutos, se ha terminado la ejecución en el problema: "+str(contador)+"\n")
    else:
        print("Se han completado todos los problemas.")

    #Esto es opcional, el objetivo debería ser guardarlo en un fichero. TODO
    print("Los tiempos (en segundos) necesarios para la ejecución han sido: ")
    for i in tiempos:
        print(str(i/1000)+"\n")

    return tiempos

def current_milli_time():
    return round(time.time() * 1000)


if __name__ == '__main__':
    main()