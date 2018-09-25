using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Grocery_Demo
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Log_In(object sender, EventArgs e)
        {

            string CS;
            CS = "Data Source=DESKTOP-UEA1TMT;Initial Catalog=Grocery_Demo;Integrated Security=True";
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("Login", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@AdministratorUsername", TextBox1.Text);
            cmd.Parameters.AddWithValue("@AdministratorPassword", TextBox2.Text);

            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            read.Read();

            if (read.HasRows)
            {
                Session["UsernameAdmin"] = TextBox1.Text;
                Session["PasswordAdmin"] = TextBox2.Text;
                con.Close();

                SqlConnection con1 = new SqlConnection(CS);
                SqlCommand cmd1 = new SqlCommand("GetBranchName", con1);
               // string returnValue = string.Empty;
                con1.Open();
                cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@AdministratorUsername", TextBox1.Text);
                SqlParameter retval = new SqlParameter("@BranchName", SqlDbType.VarChar, 50);
                retval.Direction = ParameterDirection.Output;
                cmd1.Parameters.Add(retval);
                cmd1.ExecuteNonQuery();
                string returnValue = retval.Value.ToString();
                Session["BranchAdmin"] = returnValue;
                Response.Redirect("AdminHomepage.aspx");
                con1.Close();
            }
            
            else
            {
             Label3.Text = "Either username or password is wrong";
             con.Close();
            }
        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

    }
}