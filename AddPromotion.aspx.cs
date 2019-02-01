using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Web.Services;

namespace Grocery_Demo
{
    public partial class AddPromotion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsernameAdmin"] != null && Session["PasswordAdmin"] != null && Session["BranchAdmin"] != null)
            {
                string username = Session["UsernameAdmin"].ToString();
                string password = Session["PasswordAdmin"].ToString();
                string branch = Session["BranchAdmin"].ToString();
                string CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("AdminValidation", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@AdministratorUsername", username);
                cmd.Parameters.AddWithValue("@AdministratorPassword", password);
                cmd.Parameters.AddWithValue("@GroceryBranchName", branch);
                con.Open();
                SqlDataReader read = cmd.ExecuteReader();
                read.Read();
                if (read.HasRows == false)
                {
                    Response.Redirect("SignIn.aspx");
                }
                con.Close();
            }

            else
            {
                Response.Redirect("SignIn.aspx");
            }

            Label1.Text = Session["BranchAdmin"].ToString();
            Label2.Text = Session["UsernameAdmin"].ToString();

            ShowUploadedImages();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedfile = FileUpload1.PostedFile;
            string filename = Path.GetFileName(postedfile.FileName);
            string fileextension = Path.GetExtension(filename);
            int filesize = postedfile.ContentLength;

            if (FileUpload1.HasFile)
            {
                if (fileextension.ToLower() == ".jpg" || fileextension.ToLower() == ".jpeg" || fileextension.ToLower() == ".bmp" ||
                fileextension.ToLower() == ".gif" || fileextension.ToLower() == ".png")
                {
                    FileUpload1.SaveAs(Server.MapPath("Promotion_Image//" + FileUpload1.FileName));

                    Label3.Text = "Image Uploaded Successfully";
                }

                else if (fileextension.ToLower() != ".jpg" || fileextension.ToLower() != ".jpeg" || fileextension.ToLower() != ".bmp" ||
                fileextension.ToLower() != ".gif" || fileextension.ToLower() != ".png")
                {

                    Label3.Text = "Please Upload Image Only";
                }
                
            }

            if (!FileUpload1.HasFile)
            {
                Label3.Text = "Please Select your file";
            }
            
            ShowUploadedImages();

        }


         private void  ShowUploadedImages()
        {
            string filters = "*.jpg;*.png;*.gif;*.jpeg";
            string Path = ConfigurationManager.AppSettings["FilePath"].ToString();

            List<String> images = new List<string>();

            foreach (string filter in filters.Split(';'))
            {
                FileInfo[] fit = new DirectoryInfo(this.Server.MapPath(Path)).GetFiles(filter);
                foreach (FileInfo fi in fit)
                {
                    images.Add(String.Format(Path + "/{0}", fi));
                }
            }

            RepeaterImages.DataSource = images;
            RepeaterImages.DataBind();

        }
                
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var imagePath = ((System.Web.UI.WebControls.WebControl)sender).CssClass;
            var filePath = Server.MapPath(imagePath);
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }

            ShowUploadedImages();
        }
    }
}