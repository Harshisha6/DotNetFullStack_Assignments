using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace ConsoleApp5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string connStr = "Server = USHYDDEPRANEET1; Database=Sept2024Db; Integrated Security=true";

            SqlConnection conn = new SqlConnection(connStr);
            // conn.ConnectionString = connStr;

            string cmdText = "INSERT INTO Product VALUES(7,'DOLO',10,2,'MEDICINE')";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            conn.Open();
            Console.WriteLine("Connected to Database successfully");

            int n = cmd.ExecuteNonQuery();  // For DML:  Insert, update, delete

            Console.WriteLine("No. of rows affected :" + n);
            conn.Close();

            Console.ReadLine();
        }
    }
}