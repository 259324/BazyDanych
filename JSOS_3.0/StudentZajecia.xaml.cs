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
        public Zajecie[] listaZajec = { new Zajecie(DateTime.Now,45, "druty")};


        // Załaduj plik XAML ze stylami
        private ResourceDictionary resourceDict = new ResourceDictionary();



        public StudentZajecia(IMainWindow mainWindow)
        {
            InitializeComponent();
            _mainWindow = mainWindow;

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


            for (int i = 0; i < listaZajec.Length; i++)
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
                prowadzacy.Content = "prowadzacy";
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
            public DateTime data;
            public string przedmiot;
            public int czasTrwa;

            public Zajecie(DateTime data_,int czasTrwa_, string przedmiot_)
            {
                czasTrwa = czasTrwa_;
                data = data_;
                przedmiot = przedmiot_;
            }
        }
    }
}
