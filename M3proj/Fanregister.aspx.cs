using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3proj
{
    public partial class Fanregister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void registerf(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);


            String namez = stnameee.Text;
            String usernamez = userrrname.Text;
            String passwordz = passss.Text;

            int nationalidz = Int32.Parse(nationaliddddd.Text);
            String birthz = password3.Text + " " + password5.Text;

            String addressz = addresssssss.Text;
            int phonez = Int32.Parse(phoneeee.Text);

            SqlCommand addFanPro = new SqlCommand("addFan", conn);
            addFanPro.CommandType = CommandType.StoredProcedure;

            addFanPro.Parameters.Add(new SqlParameter("@fname", namez));


            addFanPro.Parameters.Add(new SqlParameter("@uname", usernamez));

            addFanPro.Parameters.Add(new SqlParameter("@pass", passwordz));

            addFanPro.Parameters.Add(new SqlParameter("@nid", nationalidz));

            addFanPro.Parameters.Add(new SqlParameter("@birth", birthz));

            addFanPro.Parameters.Add(new SqlParameter("@address", addressz));

            addFanPro.Parameters.Add(new SqlParameter("@phoneno", phonez));

            conn.Open();
            addFanPro.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");
        }
    }
}