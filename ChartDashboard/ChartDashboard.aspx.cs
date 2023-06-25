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
    public partial class ChartDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static CourierModel fetchCourierReport()
        {
            return new CourierModel { InwardCount=10,NGRPCount=30,OutwardCount=60,RGPcount=50};
            
        }
    }
}