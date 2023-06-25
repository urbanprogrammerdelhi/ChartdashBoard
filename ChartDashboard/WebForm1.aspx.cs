using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChartDashboard
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string fetchCourierReport()
        {
            var result= new CourierModel { InwardCount=10,NGRPCount=30,OutwardCount=60,RGPcount=50};
            var output= JsonConvert.SerializeObject(result);
            return output;
            //return new Class1().FetchCourierModel();
        }
    }
}