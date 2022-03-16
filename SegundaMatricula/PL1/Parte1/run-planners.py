from optparse import OptionParser
import os
import time
import sys

def main():
    resultados = []
    problemas = crear_problemas()

    #ejecutar FF
    resultados.append("FF: " + str(ejecutar_planificador_problema("ff","./ff -o AidRelief.pddl -f ", problemas)))

    #ejecutar LPG-TD
    resultados.append("LPG-TD: " + str(ejecutar_planificador_problema("lpg-td","./lpg-td -o AidRelief.pddl -n 1 -f ", problemas)))

    #ejecutar SGPLAN40
    resultados.append("SGPLAN40: " + str(ejecutar_planificador_problema('sgplan40',"./sgplan40 -o AidRelief.pddl -out borrar.soln -f ",problemas)))

    #ejecutar SATPLAN
    resultados.append("SATPLAN: " + str(ejecutar_planificador_problema('satplan',"./satplan/satplan -solver siege -domain AidRelief.pddl -problem ", problemas)))

    #ejecutar FastDownward
    resultados.append("FASTDOWNWARD: " + str(ejecutar_planificador_problema('FastDownward', "./singularity-ce-3.9.5/downward.sif --alias lama-first AidRelief.pddl ", problemas)))

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

def ejecutar_planificador_problema(planificador, comando, problemas):
    tiempos={}; contador=0; tiempo = 0; tiempoMax = 300000
    
    contadorLimite = 10 if (planificador == 'satplan') else len(problemas)

    while(tiempo<tiempoMax and contador<contadorLimite):
        print("Plan para el problema: "+str(contador)+"\n")
        inicio=round(time.time() * 1000)
        problema = problemas[contador]
        os.system(comando + problema)
        fin=round(time.time() * 1000)
        tiempo = fin-inicio
        tiempos[problema[14:len(problema)-9]] = (tiempo/1000) #tiempo en segundos
        contador += 1

    if((contador)<len(problemas)):
        print("Se ha excedido el tiempo máximo de " + str(tiempoMax/1000) +" segundos, se ha terminado la ejecución en el problema: "+str(contador)+"\n")
    else:
        print("Se han completado todos los problemas previstos.")
    return tiempos

if __name__ == '__main__':
    main()


