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
    public partial class UpdateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CS;
            CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
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

            if (!Page.IsPostBack)
            {
                string UsernameAdmin = Session["UsernameAdmin"].ToString();

                SqlConnection con1 = new SqlConnection(CS);
                SqlCommand cmd1 = new SqlCommand("GetAdministratorNo", con1);
                string returnValue = string.Empty;
                con1.Open();
                cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@AdministratorUsername", UsernameAdmin);
                SqlParameter retval = new SqlParameter("@AdministratorNo", SqlDbType.Int);
                retval.Direction = ParameterDirection.Output;
                cmd1.Parameters.Add(retval);
                cmd1.ExecuteNonQuery();
                returnValue = retval.Value.ToString();
                Session["AdministratorNo"] = returnValue;
                con1.Close();

                HiddenField1.Value = returnValue;
                TextBox1.Text = (string)read["Administrator_Name"];
                TextBox2.Text = (string)read["Administrator_Username"];
                TextBox3.Text = (string)read["Administrator_Password"];
                TextBox4.Text = ((string)read["Administrator_Phone_No"]);
                TextBox5.Text = (string)read["Administrator_Email"];              
            }
            con.Close();
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            string CS;
            CS = "data source=LAPTOP-ODS96MIK\\MSSQL2014; database = Grocery_Demo; integrated security=SSPI";
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("UpdateProfile", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@AdministratorNo", HiddenField1.Value);
            cmd.Parameters.AddWithValue("@AdministratorName", TextBox1.Text);
            cmd.Parameters.AddWithValue("@AdministratorUsername", TextBox2.Text);
            cmd.Parameters.AddWithValue("@AdministratorPassword", TextBox3.Text);
            cmd.Parameters.AddWithValue("@AdministratorPhoneNo", TextBox4.Text);
            cmd.Parameters.AddWithValue("@AdministratorEmail", TextBox5.Text);
            
            cmd.ExecuteNonQuery();           
            con.Close();

            //Update AdministratorName from DB

            var AdministratorNo = Session["AdministratorNo"];
            SqlConnection con1 = new SqlConnection(CS);
            SqlCommand cmd1 = new SqlCommand("GetAdministratorUsername", con1);
            string returnValue = string.Empty;
            con1.Open();
            cmd1.CommandType = System.Data.CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@AdministratorNo", AdministratorNo);
            SqlParameter retval = new SqlParameter("@AdministratorUsername", SqlDbType.VarChar, 30);
            retval.Direction = ParameterDirection.Output;
            cmd1.Parameters.Add(retval);
            cmd1.ExecuteNonQuery();
            returnValue = retval.Value.ToString();
            Session["UsernameAdmin"] = returnValue;
            con1.Close();

            MessageBox("Profile has been updated");
            
        }

        public void MessageBox(string message)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "MessageBox", "<script language='javascript'>alert('" + message + "')</script>");
        }
    }
}
