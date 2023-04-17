using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PL
{
    public class Factorial
    {
        public static void factorial() {
            Console.WriteLine("Ingrese un numero: ");
            int num=int.Parse(Console.ReadLine());
           
            for (int i = (num-1); i> 1; i--)
            {
                num = num * i;
            }
            Console.WriteLine("El factorial del numero es: "+num);
            Console.ReadKey();
        }
    }
}
