﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
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
    /// Interaction logic for Kandydat.xaml
    /// </summary>
    public partial class StudentZajecia: Page
    {
        private readonly IMainWindow _mainWindow;

        List<Zajecie> listaZajec = new List<Zajecie>();
        MySqlDataReader reader;
        string sql = "";
        string result = "";
        string studid = string.Empty;
        string kierid = string.Empty;
        string pracUserid = string.Empty;
        string imieNazw = string.Empty;

        // Załaduj plik XAML ze stylami
        private ResourceDictionary resourceDict = new ResourceDictionary();



        public StudentZajecia(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;


            //pobranie studentid
            sql = "select uczelnia.getStudentid(" + _mainWindow.getID() + ") AS result;";
            reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
            while (reader.Read())
            {
                studid = Convert.ToString(reader["result"]);
            }
            reader.Close();

            //pobranie kierunekid studenta
            sql = "select uczelnia.getKier(" + _mainWindow.getID() + ") AS result;";
            reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
            while (reader.Read())
            {
                kierid = Convert.ToString(reader["result"]);
            }
            reader.Close();


            //pobranie zajec
            int count = 0;
            while (true)
            {

                Zajecie zajecie = new Zajecie();

                sql = "select uczelnia.getLekcjaData(" + kierid + "," + count + ") AS result;";
                reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
                while (reader.Read())
                {
                    result = Convert.ToString(reader["result"]);
                }
                reader.Close();
                if (result.Length > 0)
                {
                    zajecie.data = result;
                }
                else
                {
                    reader.Close();
                    break;

                }
                reader.Close();

                sql = "select uczelnia.getLekcjaPrzedID(" + kierid + "," + count + ") AS result;";
                reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
                while (reader.Read())
                {
                    result = Convert.ToString(reader["result"]);
                }
                reader.Close();

                sql = "select uczelnia.getPrzedPracUserID(" + result + ") AS result;";
                reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
                while (reader.Read())
                {
                    pracUserid = Convert.ToString(reader["result"]);
                }
                reader.Close();




                zajecie.prowadzacy= _mainWindow.getPracDane(Convert.ToInt16(pracUserid));


                sql = "select uczelnia.getPrzedNazwa(" + result + ") AS result;";
                reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
                while (reader.Read())
                {
                    result = Convert.ToString(reader["result"]);
                }
                reader.Close();

                zajecie.przedmiot = result;


                sql = "select uczelnia.getLekcjaCzas(" + kierid + "," + count + ") AS result;";
                reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();
                while (reader.Read())
                {
                    result = Convert.ToString(reader["result"]);
                }
                reader.Close();

                zajecie.czasTrwa = result;






                listaZajec.Add(zajecie);

                count++;

            }


            resourceDict.Source = new Uri("Style.xaml", UriKind.RelativeOrAbsolute);

            Grid legenda = new Grid();

            legenda.ColumnDefinitions.Add(new ColumnDefinition());
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

            Label prowadzacyL = new Label();
            prowadzacyL.Style = resourceDict["OcenaL"] as Style;
            prowadzacyL.Content = "Prowadzacy";
            Grid.SetColumn(prowadzacyL, 3);
            legenda.Children.Add(prowadzacyL);


            panelZajec.Children.Add(legenda);


            for (int i = 0; i < listaZajec.Count; i++)
            {

                Grid komorka = new Grid();

                komorka.ColumnDefinitions.Add(new ColumnDefinition());
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
                czasTrwa.Content = listaZajec[i].czasTrwa+"min";
                Grid.SetColumn(czasTrwa, 2);
                komorka.Children.Add(czasTrwa);

                Label prowadzacy = new Label();
                prowadzacy.Style = resourceDict["Ocena"] as Style;
                prowadzacy.Content = listaZajec[i].prowadzacy;
                Grid.SetColumn(prowadzacy, 3);
                komorka.Children.Add(prowadzacy);


                panelZajec.Children.Add(komorka);

            }

        }
        public void Powrot(object sender, EventArgs e)
        {
            _mainWindow.student();
        }
        public class Zajecie
        {
            public string data;
            public string przedmiot;
            public string czasTrwa;
            public string prowadzacy;

            public Zajecie(string data_, string czasTrwa_, string przedmiot_, string prowadzacy_)
            {
                czasTrwa = czasTrwa_;
                data = data_;
                przedmiot = przedmiot_;
                prowadzacy=prowadzacy_;
            }

            public Zajecie()
            {
                czasTrwa = String.Empty;
                data = String.Empty;
                przedmiot = String.Empty;
                prowadzacy = String.Empty;
            }
        }
    }
}
