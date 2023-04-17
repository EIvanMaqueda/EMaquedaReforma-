using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PL
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Ingrese la opcion que desee hacer: \n1.-suma de matriz\n2.-Factorial");
            int op=int.Parse(Console.ReadLine());
            if (op==1)
            {
                SumaMatrices.matrissuma();
            }
            else
            {
                Factorial.factorial();
            }
           
            
        }


        
    }
    
}
