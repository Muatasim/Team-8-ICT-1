using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Grocery_Demo
{
    public partial class ViewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("ViewProfile", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            if (Session["UsernameAdmin"] != null)
            {
              string UsernameAdmin = Session["UsernameAdmin"].ToString();
              cmd.Parameters.AddWithValue("@AdministratorUsername", UsernameAdmin);
            }

            else
            {
                Response.Redirect("SignIn.aspx");
            }

            Label1.Text = Session["BranchAdmin"].ToString();
            Label2.Text = Session["UsernameAdmin"].ToString();

            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            read.Read();


            Label4.Text = (string)read["Administrator_Name"];
            Label6.Text = (string)read["Administrator_Username"];
            Label8.Text = (string)read["Administrator_Password"];
            Label10.Text = (string)read["Administrator_Phone_No"];
            Label12.Text = (string)read["Administrator_Email"];

            con.Close();
         
        }
    }
}