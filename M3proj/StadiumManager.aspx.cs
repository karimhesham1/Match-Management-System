using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Web.Configuration;

namespace M3proj
{
    public partial class StadiumManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void viewinfom(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            


            String currusername = Session["username"].ToString();

            using (SqlConnection connection = new SqlConnection(sonnStr))
            {
                connection.Open();


                string query = "SELECT stadium_ID FROM StadiumManager WHERE username = @username ";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@username", currusername);


                SqlDataReader reader = command.ExecuteReader();
                int stadiumid = 0;

                if (reader.Read())
                {
                    stadiumid = reader.GetInt32(0);  // retrieve the value as an integer


                }

                reader.Close();

                string query2 = "SELECT name FROM Stadium WHERE ID = @id";
                SqlCommand command2 = new SqlCommand(query2, connection);
                command2.Parameters.AddWithValue("@id", stadiumid);


                SqlDataReader reader2 = command2.ExecuteReader();
                int clubnameint = 0;
                string stadiumname = "";
                if (reader2.Read())
                {
                   // clubnameint = reader2.GetInt32(0);  // retrieve the value as an integer
                    stadiumname = reader2.GetString(0);  // convert the integer to a string
                }
                reader2.Close();

                String sname = stadiumname;




                SqlCommand allstadiumsview = new SqlCommand("SELECT * FROM allStadiums", conn);
                allstadiumsview.CommandType = CommandType.Text;

                conn.Open();
                SqlDataReader rdr = allstadiumsview.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    String coursename = rdr.GetString(rdr.GetOrdinal("name"));
                    if (coursename == sname) //nshof law msh registered
                    {
                        String coursename5 = rdr.GetString(rdr.GetOrdinal("name"));
                        String coursename2 = rdr.GetString(rdr.GetOrdinal("location"));
                        String coursename3 = rdr.GetInt32(rdr.GetOrdinal("capacity")).ToString();
                        String coursename4 = rdr.GetBoolean(rdr.GetOrdinal("status")).ToString();

                        Label name = new Label();
                        name.Text = coursename5 + " " ;

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
                    //host guest w endtime



                }







            }




        }

        protected void acceptm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);

            String smname = password4.Text;
            String hclub = password1.Text;
            String cclub = password2.Text;
            String datetime = password3.Text + " " + password5.Text;

            SqlCommand acceptRequestProc = new SqlCommand("acceptRequest", conn);
            acceptRequestProc.CommandType = CommandType.StoredProcedure;
            acceptRequestProc.Parameters.Add(new SqlParameter("@username" , smname));
            acceptRequestProc.Parameters.Add(new SqlParameter("@hostClubName" , hclub));
            acceptRequestProc.Parameters.Add(new SqlParameter("@guestClubName" , cclub));
            acceptRequestProc.Parameters.Add(new SqlParameter("@startTime", datetime));


            conn.Open();
            acceptRequestProc.ExecuteNonQuery();
            conn.Close();
        }

        protected void rejectm(object sender, EventArgs e)
        {


            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);


            String smname = password4.Text;
            String hclub = password1.Text;
            String cclub = password2.Text;
            String datetime = password3.Text + " " + password5.Text;

            SqlCommand rejectRequestProc = new SqlCommand("rejectRequest", conn);
            rejectRequestProc.CommandType = CommandType.StoredProcedure;
            rejectRequestProc.Parameters.Add(new SqlParameter("@username", smname));
            rejectRequestProc.Parameters.Add(new SqlParameter("@hostClubName", hclub));
            rejectRequestProc.Parameters.Add(new SqlParameter("@guestClubName", cclub));
            rejectRequestProc.Parameters.Add(new SqlParameter("@startTime", datetime));


            conn.Open();
            rejectRequestProc.ExecuteNonQuery();
            conn.Close();
        }

        protected void viewrequestsm(object sender, EventArgs e)
        {

            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            SqlConnection conn = new SqlConnection(sonnStr);


            String currusername = Session["username"].ToString();

            SqlCommand allreqview = new SqlCommand("SELECT * FROM receivedRequests WHERE sm_username = @tmp", conn);
            allreqview.CommandType = CommandType.Text;

            allreqview.Parameters.AddWithValue("@tmp", currusername);
            

           
            String crname = "";
            
            String host = "";
            String guest = "";
            String starttime = "";
            String endtime = "";
            String status = "";

            conn.Open();
            SqlDataReader rdr = allreqview.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                 crname = rdr.GetString(rdr.GetOrdinal("representative_name"));
                //smname = rdr.GetString(rdr.GetOrdinal("sm_name"));
                host = rdr.GetString(rdr.GetOrdinal("host_club_name"));
                guest = rdr.GetString(rdr.GetOrdinal("guest_club_name"));
                starttime = rdr.GetDateTime(rdr.GetOrdinal("start_time")).ToString();
                endtime = rdr.GetDateTime(rdr.GetOrdinal("end_time")).ToString();
                status = rdr.GetString(rdr.GetOrdinal("status"));

                Label name = new Label();
                name.Text = crname + " ";

               

                Label name3 = new Label();
                name3.Text = host + " ";

                Label name4 = new Label();
                name4.Text = guest + " ";

                Label name5 = new Label();
                name5.Text = starttime + " ";

                Label name6 = new Label();
                name6.Text = endtime + " ";

                Label name2 = new Label();
                name2.Text = status + " " + Environment.NewLine;

                Label line = new Label();
                line.Text = Environment.NewLine;

                form1.Controls.Add(name);
                
                form1.Controls.Add(name3);
                form1.Controls.Add(name4);
                form1.Controls.Add(name5);
                form1.Controls.Add(name6);
                form1.Controls.Add(name2);
                form1.Controls.Add(line);




            }




        }

        
    }
}