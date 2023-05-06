using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace M3proj
{
    public partial class Fan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void availableMatchesToAttendF(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String birthz = password3.Text + " " + password5.Text;


            SqlCommand availableMatchesToAttendFun = new SqlCommand("SELECT * FROM availableMatchesToAttend(@d)", conn);
            availableMatchesToAttendFun.CommandType = CommandType.Text;
            availableMatchesToAttendFun.Parameters.AddWithValue("@d", birthz);

            conn.Open();
            SqlDataReader rdr = availableMatchesToAttendFun.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String coursename = rdr.GetString(rdr.GetOrdinal("host_club_name"));

                String coursename2 = rdr.GetString(rdr.GetOrdinal("guest_club_name"));

                String coursename3 = rdr.GetString(rdr.GetOrdinal("stadium_name"));

                String coursename4 = rdr.GetString(rdr.GetOrdinal("location"));


                Label name = new Label();
                name.Text = coursename + " ";

                Label name2 = new Label();
                name2.Text = coursename2 + " ";

                Label name3 = new Label();
                name3.Text = coursename3 + " ";


                Label name4 = new Label();
                name4.Text = coursename4 + " ";

                form1.Controls.Add(name);
                form1.Controls.Add(name2);
                form1.Controls.Add(name3);
                form1.Controls.Add(name4);


            }

        }

        protected void purchaseTicketPro(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            int nationalidzz = Int16.Parse(nationallllID.Text);
            String hname = hostnameeeee.Text;
            String gname = guestnameeeee.Text;
            String starttime = password6.Text + " " + password7.Text;

            SqlCommand purchaseTicketPro = new SqlCommand("purchaseTicket", conn);
            purchaseTicketPro.CommandType = CommandType.StoredProcedure;

            SqlCommand availableMatchesToAttendFun = new SqlCommand("SELECT status FROM Fan where national_id = @d", conn);
            availableMatchesToAttendFun.CommandType = CommandType.Text;
            availableMatchesToAttendFun.Parameters.AddWithValue("@d", nationalidzz);

            conn.Open();
            SqlDataReader rdr = availableMatchesToAttendFun.ExecuteReader(CommandBehavior.CloseConnection);
            String coursename="";
            while (rdr.Read())
            {
                coursename = rdr.GetInt32(rdr.GetOrdinal("status")).ToString();

            }

            if (coursename == "1")
            { 
            purchaseTicketPro.Parameters.Add(new SqlParameter("@national_id", nationalidzz));
            purchaseTicketPro.Parameters.Add(new SqlParameter("@hname", hname));
            purchaseTicketPro.Parameters.Add(new SqlParameter("@gname", gname));
            purchaseTicketPro.Parameters.Add(new SqlParameter("@date", starttime));

            conn.Open();
            purchaseTicketPro.ExecuteNonQuery();
            conn.Close();
             }
        }


    }
}