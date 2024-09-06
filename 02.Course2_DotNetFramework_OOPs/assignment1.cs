using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class QuestionOne
    {
        static void Main(string[] args)
        {
            string uname, salary;
            string id, job;


            Console.WriteLine("Enter your ID : ");
            id = Console.ReadLine();

            Console.WriteLine("Enter your Name : ");
            uname = Console.ReadLine();

            Console.WriteLine("Enter your Job : ");
            job = Console.ReadLine();

            Console.WriteLine("Enter your Salary : ");
            salary = Console.ReadLine();

            Console.WriteLine("Employee ID : " + id);
            Console.WriteLine("Employee Name : " + uname);
            Console.WriteLine("Employee Job : " + job);
            Console.WriteLine("Employee Salary : " + salary);


            Console.ReadLine();

        }
    }
}