using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace M3proj
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginm(object sender, EventArgs e)
        {
            string sonnStr = WebConfigurationManager.ConnectionStrings["M3proj"].ToString();
            //SqlConnection conn = new SqlConnection(sonnStr);

            string username = userrrname.Text; //e3mlo fel html
            string password = userrrname0.Text; //e3mlo fel html


            using (SqlConnection conn = new SqlConnection(sonnStr))
            {
                conn.Open();

                string sql = "SELECT * FROM systemuser WHERE username = @username";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@username", username);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    // User name was found in the database
                    string storedPassword = reader["password"].ToString();
                    if (password == storedPassword)
                    {
                        Session["username"]  = username;
                        Session["password"] = storedPassword;
                        reader.Close();

                        ///////////club rep
                        
                        string sql2 = "SELECT * FROM ClubRepresentative WHERE username = @username";
                        SqlCommand cmd2 = new SqlCommand(sql2, conn);
                        cmd2.Parameters.AddWithValue("@username", username);
                        SqlDataReader reader2 = cmd2.ExecuteReader();

                       

                       



                        if (reader2.Read())
                        {
                            Response.Redirect("ClubRepresentative.aspx");
                            reader2.Close();
                        }


                        else
                        {
                            reader2.Close();
                            string sql3 = "SELECT * FROM Fan WHERE username = @username";
                            SqlCommand cmd3 = new SqlCommand(sql3, conn);
                            cmd3.Parameters.AddWithValue("@username", username);
                            SqlDataReader reader3 = cmd3.ExecuteReader();

                            if (reader3.Read())
                            {
                                reader2.Close();
                                Response.Redirect("Fan.aspx");
                                reader3.Close();


                            }



                            else
                            {
                                reader3.Close();

                                string sql4 = "SELECT * FROM SportsAssociationManager WHERE username = @username";
                                SqlCommand cmd4 = new SqlCommand(sql4, conn);
                                cmd4.Parameters.AddWithValue("@username", username);
                                SqlDataReader reader4 = cmd4.ExecuteReader();

                                if (reader4.Read())
                                {
                                    Response.Redirect("SportsAssoManager.aspx");
                                    reader4.Close();
                                }

                                else
                                {
                                    reader4.Close();
                                    string sql5 = "SELECT * FROM StadiumManager WHERE username = @username";
                                    SqlCommand cmd5 = new SqlCommand(sql5, conn);
                                    cmd5.Parameters.AddWithValue("@username", username);
                                    SqlDataReader reader5 = cmd5.ExecuteReader();

                                    if (reader5.Read())
                                    {
                                        reader4.Close();
                                        Response.Redirect("StadiumManager.aspx");
                                        reader5.Close();


                                    }

                                    else
                                    {
                                        Response.Redirect("SystemAdmin.aspx");
                                    }
                                }

                            }




                        }
                      

                    }
                    else
                    {
                       
                        string message = "wrong password";
                        Response.Write(message);
                    }
                }
                else
                {
                   
                    string message = "user not found";
                    Response.Write(message);
                }
            }
        }

        protected void registercr(object sender, EventArgs e)
        {
            Response.Redirect("crregister.aspx");
        }

        protected void regitserf(object sender, EventArgs e)
        {
            Response.Redirect("Fanregister.aspx");
        }

        protected void registersm(object sender, EventArgs e)
        {
            Response.Redirect("smregister.aspx");
        }

        protected void registersa(object sender, EventArgs e)
        {
            Response.Redirect("Saregister.aspx");
        }

       
    }
}