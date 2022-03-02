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

    

    tiempo=0
    contador=0
    
    #Aqui ejecutamos los problemas sobre planificador FF, la ejecucion se detiene tras planear el ultimo problema o tras que un plan tarde más de 5 minutos en ejecutarse
    tiemposFF=[]
    while(tiempo<300000 and contador<len(problemas)):
        inicio=current_milli_time()
        cmd="./ff -o AidRelief.pddl -f " + problemas[contador]
        os.system(cmd)
        fin=current_milli_time()
        tiempo=fin-inicio
        #print("\n"+str(tiempo)+"\n")
        contador+=1
        tiemposFF.append(tiempo)

    print(tiemposFF)

    #TODO: ejecutar LPG-TD
    
    #TODO: ejecutar SGPLAN40
    #TODO: ejecutar SATPLAN
    #TODO: ejecutar FastDownward


    #Limpiamos el directorio:
    for x in problemas:
        cmd="rm "+x
        os.system(cmd)

        
def current_milli_time():
    return round(time.time() * 1000)


if __name__ == '__main__':
    main()