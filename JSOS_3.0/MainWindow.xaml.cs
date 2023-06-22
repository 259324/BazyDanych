using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;

namespace JSOS_3._0
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, IMainWindow
    {
        private int ID = 0;
        private MySqlConnection conn;
        public MainWindow()
        {
            InitializeComponent();

            Closing += MainWindow_Closing;
            home();


        }

        public string getPracDane(int userID)
        {
            string tytImieNazw = String.Empty;
            string sql = "select uczelnia.getTyt(" + userID + ") AS result;";
            MySqlDataReader reader = new MySqlCommand(sql, conn).ExecuteReader();
            while (reader.Read())
            {
                tytImieNazw = Convert.ToString(reader["result"]);
            }
            reader.Close();

            sql = "select uczelnia.getImie(" + userID + ") AS result;";
            reader = new MySqlCommand(sql, conn).ExecuteReader();
            while (reader.Read())
            {
                tytImieNazw += " " + Convert.ToString(reader["result"]);
            }
            reader.Close();

            sql = "select uczelnia.getNazwisko(" + userID + ") AS result;";
            reader = new MySqlCommand(sql, conn).ExecuteReader();
            while (reader.Read())
            {
                tytImieNazw += " " + Convert.ToString(reader["result"]);
            }
            reader.Close();

            return tytImieNazw;
        }


        public void RejestrBot()
        {
            try
            {
                string connstring = "server=localhost;uid=Rejestracja_bot;pwd=1234;database=uczelnia";
                conn = new MySqlConnection(connstring);
                conn.Open();
                if (!conn.Ping())
                {
                    MessageBox.Show("blad polaczenia");
                }

            }
            catch (MySqlException ex)
            {
                MessageBox.Show("catch: " + ex.Message);
            }
        }

        public void CloseConn()
        {
            conn.Close();
        }

        public MySqlConnection getConn()
        {
            return conn;
        }

        public void setConn(MySqlConnection conn_)
        {
            conn = conn_;
        }

        private void MainWindow_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (conn != null)
            {
                try
                {
                    conn.Close();
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("catch: " + ex.Message);
                }
            }

        }

        public void setID(int ID_)
        {
            ID = ID_;
        }

        public int getID()
        {
            return ID;
        }

        public void loadView(Frame f)
        {
            ContentGrid.Children.Clear();
            ContentGrid.Children.Add(f);
            Grid.SetRow(f, 0);
            Grid.SetColumn(f, 0);
        }

        public void home()
        {
            StronaPowitalna sp = new StronaPowitalna(this);
            loadView(new Frame { Content = sp});
        }

        public void login(int rola_)
        {
            Login login = new Login(rola_,this);
            loadView(new Frame { Content = login });
        }

        public void signin()
        {
            Signin signin= new Signin(this);
            loadView(new Frame { Content = signin });
        }

        public void kandydatWybor()
        {
            KandytatWybor kandydatWybor = new KandytatWybor(this);
            this.loadView(new Frame { Content = kandydatWybor });
        }
        public void kandydat()
        {
            Kandydat kandydat = new Kandydat(this);
            this.loadView(new Frame { Content = kandydat });
        }
        public void student()
        {
            Student student = new Student(this);
            this.loadView(new Frame { Content = student });
        }

        public void studentDane()
        {
            StudentDane studentDane = new StudentDane(this);
            this.loadView(new Frame { Content = studentDane});
        }
        public void studentOceny()
        {
            StudentOceny studentOceny = new StudentOceny(this);
            this.loadView(new Frame { Content = studentOceny });
        }

        public void studentZajecia()
        {
            StudentZajecia studentZajecia = new StudentZajecia(this);
            this.loadView(new Frame { Content = studentZajecia });
        }
        public void pracownik()
        {
            Pracownik pracownik = new Pracownik(this);
            this.loadView(new Frame { Content = pracownik });
        }
        public void pracownikOceny()
        {
            PracownikOceny pracownikOceny = new PracownikOceny(this);
            this.loadView(new Frame { Content = pracownikOceny });
        }

        public void pracownikZajecia()
        {
            PracownikZajecia c = new PracownikZajecia(this);
            this.loadView(new Frame { Content = c });
        }

        public void dziekan()
        {
            Dziekan c = new Dziekan(this);
            this.loadView(new Frame { Content = c });
        }

    }
}


