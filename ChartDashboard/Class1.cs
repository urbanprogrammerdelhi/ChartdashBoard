using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ChartDashboard
{
    [Serializable]
    public class CourierModel
    {
        public int InwardCount { get; set; }
        public int OutwardCount { get; set; }
        public int NGRPCount { get; set; }
        public int RGPcount { get; set; }

    }
    public class Class1
    {
       
        public CourierModel FetchCourierModel()
        {
            var result = new CourierModel();
            using (SqlConnection connection = new SqlConnection("Data Source = 172.16.3.2; Initial Catalog = OfficeSpace; User Id = sa; Password = sqlserver@2018!@#;Connection Timeout=0; pooling='true'; Max Pool Size=200;"))
            {
                connection.Open();
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "UDP_Fetch_Courier_Report";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader reader = command.ExecuteReader();
                //DataTable dt = new DataTable();
                //dt.Load(reader);
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        result.InwardCount = Convert.ToInt32(reader["InwardCount"].ToString());
                        result.OutwardCount = Convert.ToInt32(reader["OutwardCount"].ToString());
                        result.RGPcount = Convert.ToInt32(reader["RGPcount"].ToString());
                        result.NGRPCount = Convert.ToInt32(reader["NGRPCount"].ToString());

                    }
                }
                reader.Close();
                return result;
            }
        }
    }
}