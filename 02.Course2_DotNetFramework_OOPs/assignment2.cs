using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int Product_ID;
            string Product_Name;
            int x;
            int y;
            double Total_Amount;
            double Discount_Amount;
            double Final_Amount;

            Console.WriteLine("Enter Product ID : ");
            Product_ID = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter Product Name : ");
            Product_Name = Console.ReadLine();

            Console.WriteLine("Enter Unit Price : ");
            x = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter Quantity : ");
            y = int.Parse(Console.ReadLine());

            Total_Amount = x * y;

            if (y <= 10)
            {
                Discount_Amount = 0;
                Final_Amount = Total_Amount;
                Console.WriteLine("Total Amount : " + Total_Amount);
                Console.WriteLine("Discount Amount : " + Discount_Amount);
                Console.WriteLine("Final Amount : " + Final_Amount);
            }
            else if (y > 10 && y <= 30)
            {
                Discount_Amount = 0.1 * Total_Amount;
                Final_Amount = Total_Amount - (Discount_Amount);
                Console.WriteLine("Total Amount : " + Total_Amount);
                Console.WriteLine("Discount Amount : " + Discount_Amount);
                Console.WriteLine("Final Amount : " + Final_Amount);
            }
            else if (y > 30 && y <= 50)
            {
                Discount_Amount = 0.2 * Total_Amount;
                Final_Amount = Total_Amount - (Discount_Amount);
                Console.WriteLine("Total Amount : " + Total_Amount);
                Console.WriteLine("Discount Amount : " + Discount_Amount);
                Console.WriteLine("Final Amount : " + Final_Amount);
            }
            else if (y > 50)
            {
                Discount_Amount = 0.3 * Total_Amount;
                Final_Amount = Total_Amount - (Discount_Amount);
                Console.WriteLine("Total Amount : " + Total_Amount);
                Console.WriteLine("Discount Amount : " + Discount_Amount);
                Console.WriteLine("Final Amount : " + Final_Amount);
            }

            Console.ReadLine();
        }
    }
}
