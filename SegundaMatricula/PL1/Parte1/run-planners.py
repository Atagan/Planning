from optparse import OptionParser
import os
import time
import sys

def main():
    resultados = []
    problemas = crear_problemas()

    #ejecutar FF
    resultados.append("FF: " + str(ejecutar_planificador_problema("./ff -o AidRelief.pddl -f ", problemas)))

    #ejecutar LPG-TD
    resultados.append("LPG-TD: " + str(ejecutar_planificador_problema("./lpg-td -o AidRelief.pddl -n 1 -f ", problemas)))

    #ejecutar SGPLAN40
    resultados.append("SGPLAN40: " + str(ejecutar_planificador_problema("./sgplan40 -o AidRelief.pddl -out borrar.soln -f ",problemas)))

    #ejecutar SATPLAN
    resultados.append("SATPLAN: " + str(ejecutar_planificador_problema("./satplan/satplan -solver siege -domain AidRelief.pddl -problem ", problemas)))

    #ejecutar FastDownward
    #tiemposFD=ejecutar_planificador_problema("", problemas)

    grabar_resultados(resultados)
    limpiar_directorio(problemas)

def grabar_resultados(resultados):
    file = open('./resumen.txt', 'w+')
    for resultado in resultados:
        file.write(resultado + "\n")
    file.close()

def crear_problemas():
    parser = OptionParser(usage='python3 run-planners.py [-help] options...')
    parser.add_option('-s', '--salto', metavar='NUM', dest='salto', action='store', type=int, help='salto')
    (options, args) = parser.parse_args()

    if options.salto is None:
        print("Salto de 10 en 10")
        salto = 10
    else:
        salto = options.salto

    print("Creando problemas.\n")
    i = 1; num = 0; problemas = []
    while (num < 100):
        num = salto * i
        os.system("python3 generate-problem.py -d 1 -r 0" + " -l " + str((int(num // 2))) + " -p " + str((int(num))) + " -c " + str((int(num))) + " -g " + str((int(num))))
        problemas.append("drone_problem_d1_r0_l" + str((int(num // 2))) + "_p" + str((int(num))) + "_c" + str((int(num))) + "_g" + str((int(num))) + "_ct2.pddl")
        i += 1
    return problemas

def limpiar_directorio(problemas):
    for x in problemas:
        os.system("rm "+x)
        os.system("rm plan_"+ x +"_1.SOL")
    os.system("rm borrar.soln")

def ejecutar_planificador_problema(planificador, problemas):
    tiempos={}; contador=0; tiempo = 0; tiempoMax = 300000

    while(tiempo<tiempoMax and contador<len(problemas)):
        print("Plan para el problema: "+str(contador)+"\n")
        inicio=current_milli_time()
        problema = problemas[contador]
        os.system(planificador + problema)
        fin=current_milli_time()
        tiempo = fin-inicio
        tiempos[problema[14:len(problema)-9]] = (tiempo/1000) #tiempo en segundos
        contador += 1

    if((contador)<len(problemas)):
        print("Se ha excedido el tiempo máximo de " + str(tiempoMax/1000) +" segundos, se ha terminado la ejecución en el problema: "+str(contador)+"\n")
    else:
        print("Se han completado todos los problemas previstos.")
    return tiempos

def current_milli_time():
    return round(time.time() * 1000)

if __name__ == '__main__':
    main()


