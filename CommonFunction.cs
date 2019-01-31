using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Grocery_Demo
{
    public class CommonFunction : Interface1
    {
        static string CS;
        static SqlConnection con;
        static SqlCommand cmd;
        public static SqlConnection GetConnection()
        {
            CS = ConfigurationManager.ConnectionStrings["Grocery_DemoConnectionString"].ConnectionString;
            con = new SqlConnection(CS);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            return con;
        }

        //-- code to make sure to close connection and dispose the object
        public static void Dispose()
        {
            if (con.State == System.Data.ConnectionState.Open)
                con.Close();
            con.Dispose();
        }
        public static SqlCommand executeCommand(string command)
        {
            con = GetConnection();
            cmd = new SqlCommand(command, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            return cmd;
        }
        public void Add_Click(string arg)
        {
        }
        public void Add_Click(object sender, EventArgs e, FileUpload fu)
        {
            HttpPostedFile postedfile = fu.PostedFile;
            string filename = Path.GetFileName(postedfile.FileName);
            string fileextension = Path.GetExtension(filename);
            int filesize = postedfile.ContentLength;
            if (fileextension.ToLower() == ".jpg" || fileextension.ToLower() == ".jpeg" ||
                fileextension.ToLower() == ".bmp" || fileextension.ToLower() == ".gif" ||
                fileextension.ToLower() == ".png")
            {
                Stream stream = postedfile.InputStream;
                BinaryReader binaryreader = new BinaryReader(stream);
                byte[] bytes = binaryreader.ReadBytes((int)stream.Length);
                cmd = CommonFunction.executeCommand("AddProducts");
            }
        }
        public void Display(string query, GridView grd)
        {
            cmd = CommonFunction.executeCommand(query);
            grd.DataSource = cmd.ExecuteReader();
            grd.DataBind();
            //SqlDataReader read = cmd.ExecuteReader();
            //read.Read();
            CommonFunction.Dispose();
        }
    }
}