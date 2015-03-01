using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization.Json;
using System.Windows.Forms;
using System.IO;
using System.Runtime.Serialization;
using System.Globalization;
using System.Threading;

namespace Kulendayz2014
{
    public partial class Form1 : Form
    {

        private WebClient client = new WebClient();
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            client.DownloadStringCompleted += new DownloadStringCompletedEventHandler(loadHTMLCallback);
            client.DownloadStringAsync(new Uri("http://jakopec.com/kulendayz2014/realniPrimjerBaza.php"));
        }

        public void loadHTMLCallback(Object sender, DownloadStringCompletedEventArgs e)
        {
                List<Osoba> osobe = new List<Osoba>();
                CultureInfo trenutni = Thread.CurrentThread.CurrentCulture;
                Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
                DataContractJsonSerializer serializer = new DataContractJsonSerializer(osobe.GetType(),
              new DataContractJsonSerializerSettings { DateTimeFormat = new DateTimeFormat("ddd, dd MMM yyyy HH:mm:ss zzz") });
                
                MemoryStream ms = new MemoryStream(Encoding.Unicode.GetBytes(e.Result));
                osobe = serializer.ReadObject(ms) as List<Osoba>;
                ms.Close();
                Thread.CurrentThread.CurrentCulture = trenutni;
                labela.Text = osobe.LastOrDefault().datumRodenja.ToString() + ": " + osobe.LastOrDefault().koeficijent;
                Byte[] bitmapData = new Byte[osobe.LastOrDefault().slika.Length];
                bitmapData = Convert.FromBase64String(FixBase64ForImage(osobe.LastOrDefault().slika));
                System.IO.MemoryStream streamBitmap = new System.IO.MemoryStream(bitmapData);
                Bitmap bitImage = new Bitmap((Bitmap)Image.FromStream(streamBitmap));
                pictureBox1.Image = bitImage;
        }

        private String FixBase64ForImage(String Image)
        {
            try
            {
                System.Text.StringBuilder st = new System.Text.StringBuilder(Image, Image.Length);
                st.Replace("\r\n", String.Empty);
                st.Replace(" ", String.Empty);
                return st.ToString();
            }
            catch (Exception ex)
            {
                return "";
            }
        }
    }
}
