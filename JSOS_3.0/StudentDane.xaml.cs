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
    /// Interaction logic for Kandydat.xaml
    /// </summary>
    public partial class StudentDane : Page
    {
        private readonly IMainWindow _mainWindow;
        public string[] listaDanych = { "Imię", "Nazwisko", "Login", "Hasło", "Nr. telefonu", "E-mail", "PESEL","Kierunek" };

        public string[] funkcjeGet = { "getImie", "getNazwisko", "getLogin", "getPass", "getTel", "getMail", "getPESEL","getKier",};
        public string[] funkcjeSet = { "setimie", "setnazwisko", "setlogin", "setpassword", "settel", "setemail", "setpesel", "setkierunek" };
        List<TextBox> listaTextBox = new List<TextBox>();

        MySqlDataReader reader;
        string sql = "";
        string result = "";

        public StudentDane(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;


            //zaladowanie komorek (bez danych)
            for (int i = 0; i < listaDanych.Length; i++)
            {

                Grid komorka = new Grid();

                komorka.ColumnDefinitions.Add(new ColumnDefinition());
                komorka.ColumnDefinitions.Add(new ColumnDefinition());

                komorka.ColumnDefinitions[0].Width = new GridLength(150);


                TextBox poleDanych = new TextBox();
                poleDanych.Width = 500;
                poleDanych.HorizontalAlignment = HorizontalAlignment.Left;
                poleDanych.Margin = new Thickness(10);
                poleDanych.FontSize = 15;
                listaTextBox.Add(poleDanych);


                Label jakieDane = new Label();
                jakieDane.Content = listaDanych[i];
                jakieDane.FontSize = 15;
                jakieDane.Margin = new Thickness(10);
                jakieDane.HorizontalAlignment = HorizontalAlignment.Left;

                Grid.SetColumn(jakieDane, 0);
                komorka.Children.Add(jakieDane);

                Grid.SetColumn(poleDanych, 1);
                komorka.Children.Add(poleDanych);

                panelDanych.Children.Add(komorka);

            }

            // zaladowanie danych w liscie
            for (int i = 0; i < listaTextBox.Count; i++)
            {
                sql = "select uczelnia." + funkcjeGet[i] + "(" + _mainWindow.getID() + ") AS result;";
                reader = new MySqlCommand(sql, _mainWindow.getConn()).ExecuteReader();

                result = "";
                while (reader.Read())
                {
                    result = Convert.ToString(reader["result"]);
                }
                reader.Close();

                listaTextBox[i].Text = result;

            }

        }
        public void Powrot(object sender, EventArgs e)
        {
            _mainWindow.student();
        }

        public void update(object sender, EventArgs e)
        {
            string send;
            for (int i = 0; i < funkcjeSet.Length-1; i++)
            {
                if (listaTextBox[i].Text == "")
                {
                    send = "0";
                }
                else
                {
                    send = listaTextBox[i].Text;
                }
                sql = "call uczelnia." + funkcjeSet[i] + "(" + _mainWindow.getID() + ",'" + send + "');";
                new MySqlCommand(sql, _mainWindow.getConn()).ExecuteScalar();
            }
        }
    }
}
