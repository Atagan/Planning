from optparse import OptionParser
import os
import time
import sys

def main():
    parser = OptionParser(usage='python3 run-planners.py [-help] options...')
    parser.add_option('-s', '--salto', metavar='NUM', dest='salto', action='store', type=int, help='salto')
    (options, args) = parser.parse_args()

    if options.salto is None:
        print("suponemos que el salto es 10")
        salto=10
    else:
        salto=options.salto

    problemas=[]
    print("Creamos los problemas necesarios (rango 10-100).\n")
    i=1
    cantidad=0
    while(cantidad<100):
        cantidad=salto*i
        aux=" -l " + str((int(cantidad//2))) + " -p "+str((int(cantidad)))+" -c " + str((int(cantidad))) + " -g "+str((int(cantidad)))
        cmd= "python3 generate-problem.py -d 1 -r 1" + aux
        os.system(cmd) #Descomentar para que funcione, pero no quiero que me pete la carpeta uwu
        aux="drone_problem_d1_r0_l"+str((int(cantidad//2)))+"_p"+str((int(cantidad)))+"_c"+str((int(cantidad)))+"_g"+str((int(cantidad)))+"_ct2.pddl"
        problemas.append(aux)
        i+=1

    #Aqui ejecutamos los problemas sobre planificador FF, la ejecucion se detiene tras planear el ultimo problema o tras que un plan tarde más de 5 minutos en ejecutarse
    #tiemposFF=ejecutar_planificador(problemas,"./ff -o AidRelief.pddl -f ")

    #ejecutar LPG-TD
    tiemposLPG=ejecutar_planificador(problemas,"./lpg-td -o AidRelief.pddl -n 1 -f ")

    #ejecutar SGPLAN40
    tiemposSGPlan=ejecutar_planificador(problemas,"./sgplan40 -o AidRelief.pddl -out borrar.soln -f ")

    #ejecutar SATPLAN
    tiemposSATPlan=ejecutar_planificador(problemas,"./satplan/satplan -solver siege -domain AidRelief.pddl -problem ")

    #ejecutar FastDownward
    tiemposFD=ejecutar_planificador(problemas,"")

    #Limpiamos el directorio:
    for x in problemas:
        cmd="rm "+x
        os.system(cmd)
        cmd="rm plan_"+x+"_1.SOL"
        os.system(cmd)


    cmd= "rm borrar.soln"
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
