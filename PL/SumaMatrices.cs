using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace PL
{
    public class SumaMatrices
    {
        public static void matrissuma()
        {
            int[] fila = { 1, 2, 3 };
            int[] fila2 = { 4, 5, 6 };
            int[] fila3 = { 7, 8, 9 };
            int[,] matris1 = new int[3, 3];
            int[,] matris2 = new int[3, 3];
            int[,] matris3 = new int[3, 3];

            Console.WriteLine(" Matriz 1   Matriz 2   Suma de Matrices\n");
            for (int i = 0; i < fila.Length; i++)
            {
                matris1[i, 0] = fila[i];
                matris1[i, 1] = fila2[i];
                matris1[i, 2] = fila3[i];
                matris2[i, 1] = fila[i];
                matris2[i, 2] = fila2[i];
                matris2[i, 0] = fila3[i];

                matris3[i, 0] = matris1[i, 0] + matris2[i, 0];
                matris3[i, 1] = matris1[i, 1] + matris2[i, 1];
                matris3[i, 2] = matris1[i, 2] + matris2[i, 2];

                Console.WriteLine("|" + matris1[i, 0] + ", " + matris1[i, 1] + ", " + matris1[i, 2] + "|  " +
                "|" + matris2[i, 0] + ", " + matris2[i, 1] + ", " + matris2[i, 2] + "|  " +
                "   |" + matris3[i, 0] + ", " + matris3[i, 1] + ", " + matris3[i, 2] + "|\n");

            }



            Console.ReadKey();
        }
    }
}
