using MySql.Data.MySqlClient;
using System.Windows.Controls;

namespace JSOS_3._0
{
    public interface IMainWindow
    {
        void RejestrBot();
        void CloseConn();
        MySqlConnection getConn();
        void setConn(MySqlConnection conn);

        string getPracDane(int userID);
        void home();
        void loadView(Frame f);
        void login(int rola);
        void signin();
        void kandydatWybor();
        void kandydat();
        void student();
        void studentDane();
        void studentOceny();
        void studentZajecia();
        void pracownik();
        void pracownikOceny();
        void pracownikZajecia();

        void dziekan();
        void setID(int ID);
        int getID();
    }
}