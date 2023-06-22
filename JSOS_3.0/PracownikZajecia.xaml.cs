using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
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

namespace JSOS_3._0
{
    /// <summary>
    /// Interaction logic for PracownikZajecia.xaml
    /// </summary>
    public partial class PracownikZajecia : Page
    {
        private readonly IMainWindow _mainWindow;
        List<Zajecie> listaZajec = new List<Zajecie>();
        List<string> listaPrzed= new List<string>();
        MySqlDataReader reader;
        string sql = "";
        string result = "";
        string studid = string.Empty;
        string kierid = string.Empty;
        string pracUserid = string.Empty;
        string imieNazw = string.Empty;

        // Załaduj plik XAML ze stylami
        private ResourceDictionary resourceDict = new ResourceDictionary();



        public PracownikZajecia(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;


            int count = 0;
            // pobranie przedmiotow, ktorych uczy
            while (true)
            {
                sql = "select uczelnia.getPrzedPracownika(" + _mainWindow.getID() + "," + count + ") AS result;";
                reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
                while (reader.Read())
                {
                    result = Convert.ToString(reader["result"]);
                }
                reader.Close();
                if (result.Length > 0)
                {
                    listaPrzed.Add(result);
                }
                else
                {
                    reader.Close();
                    break;

                }
                reader.Close();
                count++;
            }

            ////pobranie zajec
            for(int i = 0; i < listaPrzed.Count;i++)
            {
                count = 0;

                while (true)
                {


                    Zajecie zajecie = new Zajecie();


                    sql = "select uczelnia.getLekcjaCzasByPrzed(" + listaPrzed[i] + "," + count + ") AS result;";
                    reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
                    while (reader.Read())
                    {
                        result = Convert.ToString(reader["result"]);
                    }
                    reader.Close();
                    if (result.Length > 0)
                    {
                        zajecie.czasTrwa = result;
                    }
                    else
                    {
                        reader.Close();
                        break;

                    }
                    reader.Close();


                    sql = "select uczelnia.getPrzedNazwa(" + listaPrzed[count] + ") AS result;";
                    reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
                    while (reader.Read())
                    {
                        result = Convert.ToString(reader["result"]);
                    }
                    reader.Close();

                    zajecie.przedmiot = result;


                    sql = "select uczelnia.getLekcjaDataByPrzed(" + listaPrzed[count] + "," + count + ") AS result;";
                    reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
                    while (reader.Read())
                    {
                        result = Convert.ToString(reader["result"]);
                    }
                    reader.Close();

                    zajecie.data = result;


                    listaZajec.Add(zajecie);
                    count++;
                }

            }



            resourceDict.Source = new Uri("Style.xaml", UriKind.RelativeOrAbsolute);

            Grid legenda = new Grid();

            legenda.ColumnDefinitions.Add(new ColumnDefinition());
            legenda.ColumnDefinitions.Add(new ColumnDefinition());
            legenda.ColumnDefinitions.Add(new ColumnDefinition());
            legenda.Style = resourceDict["KomorkaL"] as Style;

            Label przedmiotL = new Label();
            przedmiotL.Style = resourceDict["OcenaL"] as Style;
            przedmiotL.Content = "Przedmiot";
            Grid.SetColumn(przedmiotL, 0);
            legenda.Children.Add(przedmiotL);

            Label dataL = new Label();
            dataL.Style = resourceDict["OcenaL"] as Style;
            dataL.Content = "Data";
            Grid.SetColumn(dataL, 1);
            legenda.Children.Add(dataL);

            Label czasTrwaL = new Label();
            czasTrwaL.Style = resourceDict["OcenaL"] as Style;
            czasTrwaL.Content = "Czas trwania";
            Grid.SetColumn(czasTrwaL, 2);
            legenda.Children.Add(czasTrwaL);


            panelZajec.Children.Add(legenda);


            for (int i = 0; i < listaZajec.Count; i++)
            {

                Grid komorka = new Grid();

                komorka.ColumnDefinitions.Add(new ColumnDefinition());
                komorka.ColumnDefinitions.Add(new ColumnDefinition());
                komorka.ColumnDefinitions.Add(new ColumnDefinition());
                komorka.Style = resourceDict["Komorka"] as Style;

                Label przedmiot = new Label();
                przedmiot.Style = resourceDict["Ocena"] as Style;
                przedmiot.Content = listaZajec[i].przedmiot;
                Grid.SetColumn(przedmiot, 0);
                komorka.Children.Add(przedmiot);

                Label data = new Label();
                data.Style = resourceDict["Ocena"] as Style;
                data.Content = listaZajec[i].data;
                Grid.SetColumn(data, 1);
                komorka.Children.Add(data);

                Label czasTrwa = new Label();
                czasTrwa.Style = resourceDict["Ocena"] as Style;
                czasTrwa.Content = listaZajec[i].czasTrwa + "min";
                Grid.SetColumn(czasTrwa, 2);
                komorka.Children.Add(czasTrwa);


                panelZajec.Children.Add(komorka);

            }

        }
        public void Powrot(object sender, EventArgs e)
        {
            _mainWindow.pracownik();
        }
        public class Zajecie
        {
            public string data;
            public string przedmiot;
            public string czasTrwa;

            public Zajecie()
            {
                czasTrwa = String.Empty;
                data = String.Empty;
                przedmiot = String.Empty;
            }
        }
    }
}
