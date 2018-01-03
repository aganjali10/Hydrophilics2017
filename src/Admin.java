import java.sql.*;
import java.util.Scanner;

public class Admin {
	public static void main(String args[]) throws Exception{
		String url = "jdbc:mysql://localhost:3306/Hydrophilics2017";
		String uname = "root";
		String pass = "abc123@@@";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,uname,pass);
		Scanner input=new Scanner(System.in);
		System.out.println("Welcome to HYDROPHILICS2017\n");
		String field,aux;
		do{
			System.out.println("What do you manage?\n1.Members(Sportspersons and Officials)\n2.Coaches\n3.Events\n4.Accommodation\n5.SportsVenues");
			System.out.println("Enter the field you want to work with");
			field=input.next();
			switch(field){
			case "Members":
				do{
				System.out.println("Do you want to work with Sportspersons or Officials?");
				field=input.next();
				switch(field){
				case "Sportspersons":
					do{
					System.out.println("Do you want to\n1.Read\n2.Insert");
					field=input.next();
					switch(field){
					case "Read":
						do{
						String query="";
						System.out.println("Do you want to view the information of\n1.All\n2.One\nSportspersons?\nType \"Misc\" for a query of your own");
						field=input.next();
						switch(field){
						case "All":
							query="select * from SportspersonFullDetails";
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery(query);
							ResultSetMetaData rsmd=rs.getMetaData();
							int c=rsmd.getColumnCount();
							int i=c;
							while(c!=0){
								c--;
								System.out.format("%16s",rsmd.getColumnName(i-c));  
							}
							System.out.println();
							while(rs.next()){
								c=i;
								while(c!=0){
									c--;
									System.out.format("%16s",rs.getString(i-c));
								}
								System.out.println();
							}
							break;
						case "One":
							System.out.println("Enter the ID of the Sportsperson");
							String id;
							id=input.next();
							do{
							System.out.println("1.Basic\n2.Participation\n3.Victories\n4.Travels\n5.Coach");
							field=input.next();
							switch(field){
							case "Basic":
							query="select * from SportspersonFullDetails where MemID=?";
							break;
							case "Participation":
								query="select EventName from Participate where MemID=?";
								System.out.println(id + " participated in the following events");
								break;
							case "Victories":
								query="select EventName from Event where Winner=?";
								System.out.println(id + " won in the following events");
								break;
							case "Travels":
								query="select PlaceName,Date,DepartureTime,Mode from TravelTo where MemID=?";
								break;
							case "Coach":
								query="select FirstName,MiddleName,LastName,Academy from Coach where MemID=?";
								break;
							}
							PreparedStatement st1 = con.prepareStatement(query);
							st1.setString(1,id);
							ResultSet rs1 = st1.executeQuery();
							ResultSetMetaData rsmd1=rs1.getMetaData();
							int c1=rsmd1.getColumnCount();
							int i1=c1;
							while(c1!=0){
								c1--;
								System.out.format("%16s",rsmd1.getColumnName(i1-c1));  
							}
							System.out.println();
							while(rs1.next()){
								c1=i1;
								while(c1!=0){
									c1--;
									System.out.format("%16s",rs1.getString(i1-c1));
								}
								System.out.println();
							}
							System.out.println("\nDo you want to continue viewing information for id " + id + "?(Yes/No)");
							field=input.next();
							}while(field.equals("Yes"));
							break;
						case "Misc":
							System.out.println("Enter your query in MYSQL");
							String temp=input.nextLine();
							query=input.nextLine();
							Statement st2 = con.createStatement();
							ResultSet rs2 = st2.executeQuery(query);
							ResultSetMetaData rsmd2=rs2.getMetaData();
							int c2=rsmd2.getColumnCount();
							int i2=c2;
							while(c2!=0){
								c2--;
								System.out.format("%16s",rsmd2.getColumnName(i2-c2));  
							}
							System.out.println();
							while(rs2.next()){
								c2=i2;
								while(c2!=0){
									c2--;
									System.out.format("%16s",rs2.getString(i2-c2));
								}
								System.out.println();
							}
							break;
						}
						System.out.println("\nDo you want to continue viewing Sportspersons' information?(Yes/No)");
						field=input.next();
						}while(field.equals("Yes"));
						break;
					case "Insert":
						do{
						System.out.println("Insert a new\n1.Sportsperson\n2.Participation\n3.Travel");
						field=input.next();
						switch(field){
						case "Sportsperson":
						String query = "insert into Member values(?,?,?,?,?,?,?,?)";
						String query1 = "insert into Sportsperson values(?,?)";
						PreparedStatement st = con.prepareStatement(query);
						PreparedStatement st1 = con.prepareStatement(query1);
						st1.setInt(2, 0);
						System.out.println("Enter Member ID");
						String temp;
						temp=input.next();
						st.setString(1, temp);
						st1.setString(1, temp);
						System.out.println("Enter First Name");
						temp=input.next();
						st.setString(2, temp);
						System.out.println("Do you want to enter a Middle Name?(Yes/No)");
						field=input.next();
						if(field.equals("Yes")){
						System.out.println("Enter a Middle Name");
						temp=input.next();
						st.setString(3, temp);}
						else
						st.setString(3, null);	
						System.out.println("Do you want to enter a Last Name?(Yes/No)");
						field=input.next();
						if(field.equals("Yes")){
						System.out.println("Enter a Last Name");
						temp=input.next();
						st.setString(4, temp);}
						else
						st.setString(4, null);
						System.out.println("Enter DOB(YYYY-MM-DD)");
						temp=input.next();
						st.setString(5, temp);
						System.out.println("Enter Nationality");
						temp=input.next();
						st.setString(6, temp);
						System.out.println("Enter Accommodation Name");
						temp=input.next();
						st.setString(7, temp);
						System.out.println("Enter Room number");
						int temp1=input.nextInt();
						st.setInt(8, temp1);
						int count = st.executeUpdate();
						int count1 = st1.executeUpdate();
						if(count==1&&count1==1)
							System.out.println("Successful insertion");
						break;
						case "Participation":
							String query2="insert into Participate values(?,?)";
							System.out.println("Enter the ID of the sportsperson and the name of the event he's participating in");
							PreparedStatement st2 = con.prepareStatement(query2);
							String temp2=input.next();
							String temp3=input.next();
							st2.setString(1, temp2);
							st2.setString(2, temp3);
							int count2=st2.executeUpdate();
							if(count2==1)
								System.out.println("Successful Insertion");
							break;
						case "Travel":
							String query3="insert into TravelTo values(?,?,?,?,?)";
							System.out.println("Enter the ID of the sportsperson and the name of the venue he'll be going to");
							PreparedStatement st3 = con.prepareStatement(query3);
							String temp4=input.next();
							st3.setString(1, temp4);
							temp4=input.next();
							st3.setString(2, temp4);
							System.out.println("Enter the date");
							temp4=input.next();
							st3.setString(3, temp4);
							System.out.println("Enter the time of departure");
							temp4=input.next();
							st3.setString(4, temp4);
							System.out.println("Enter the mode of transport");
							temp4=input.next();
							st3.setString(5, temp4);
							int count3=st3.executeUpdate();
							if(count3==1)
								System.out.println("Successful Insertion");
							break;
						}
						System.out.println("\nDo you want to continue inserting?(Yes/No)");
						field=input.next();
						}while(field.equals("Yes"));
						break;
					}
					System.out.println("\nDo you want to continue working with Sportspersons?(Yes/No)");
					field=input.next();
					}while(field.equals("Yes"));
					break;
				case "Officials":
					do{
					System.out.println("Do you want to\n1.Read\n2.Insert");
					field=input.next();
					switch(field){
					case "Read":
						do{
							String query="";
							System.out.println("Do you want to view the information of\n1.All\n2.One\nOfficials?\nType \"Misc\" for a query of your own");
							field=input.next();
							switch(field){
							case "All":
								query="select * from OfficialFullDetails";
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery(query);
								ResultSetMetaData rsmd=rs.getMetaData();
								int c=rsmd.getColumnCount();
								int i=c;
								while(c!=0){
									c--;
									System.out.format("%17s",rsmd.getColumnName(i-c));  
								}
								System.out.println();
								while(rs.next()){
									c=i;
									while(c!=0){
										c--;
										System.out.format("%17s",rs.getString(i-c));
									}
									System.out.println();
								}
								break;
							case "One":
								System.out.println("Enter the ID of the Official");
								String id;
								id=input.next();
								do{
								System.out.println("1.Basic\n2.EventsManaged\n3.Travels");
								field=input.next();
								switch(field){
								case "Basic":
								query="select * from OfficialFullDetails where MemID=?";
								break;
								case "EventsManaged":
									query="select EventName from Manage where MemID=?";
									System.out.println(id + " managed the following events");
									break;
								case "Travels":
									query="select PlaceName,Date,DepartureTime,Mode from TravelTo where MemID=?";
									break;
								}
								PreparedStatement st1 = con.prepareStatement(query);
								st1.setString(1,id);
								ResultSet rs1 = st1.executeQuery();
								ResultSetMetaData rsmd1=rs1.getMetaData();
								int c1=rsmd1.getColumnCount();
								int i1=c1;
								while(c1!=0){
									c1--;
									System.out.format("%18s",rsmd1.getColumnName(i1-c1));  
								}
								System.out.println();
								while(rs1.next()){
									c1=i1;
									while(c1!=0){
										c1--;
										System.out.format("%18s",rs1.getString(i1-c1));
									}
									System.out.println();
								}
								System.out.println("\nDo you want to continue viewing information for id " + id + "?(Yes/No)");
								field=input.next();
								}while(field.equals("Yes"));
								break;
							case "Misc":
								System.out.println("Enter your query in MYSQL");
								String temp=input.nextLine();
								query=input.nextLine();
								Statement st2 = con.createStatement();
								ResultSet rs2 = st2.executeQuery(query);
								ResultSetMetaData rsmd2=rs2.getMetaData();
								int c2=rsmd2.getColumnCount();
								int i2=c2;
								while(c2!=0){
									c2--;
									System.out.format("%18s",rsmd2.getColumnName(i2-c2));  
								}
								System.out.println();
								while(rs2.next()){
									c2=i2;
									while(c2!=0){
										c2--;
										System.out.format("%18s",rs2.getString(i2-c2));
									}
									System.out.println();
								}
								break;
							}
							System.out.println("\nDo you want to continue viewing Officials' information?(Yes/No)");
							field=input.next();
						}while(field.equals("Yes"));
						break;
					case "Insert":
						do{
								System.out.println("Insert a new\n1.Official\n2.Management\n3.Travel");
								field=input.next();
								switch(field){
								case "Official":
								String query = "insert into Member values(?,?,?,?,?,?,?,?)";
								String query1 = "insert into Official values(?,?,?)";
								PreparedStatement st = con.prepareStatement(query);
								PreparedStatement st1 = con.prepareStatement(query1);
								System.out.println("Enter Member ID");
								String temp;
								temp=input.next();
								st.setString(1, temp);
								st1.setString(1, temp);
								System.out.println("Enter First Name");
								temp=input.next();
								st.setString(2, temp);
								System.out.println("Do you want to enter a Middle Name?(Yes/No)");
								field=input.next();
								if(field.equals("Yes")){
								System.out.println("Enter a Middle Name");
								temp=input.next();
								st.setString(3, temp);}
								else
									st.setString(3, null);
								System.out.println("Do you want to enter a Last Name?(Yes/No)");
								field=input.next();
								if(field.equals("Yes")){
								System.out.println("Enter a Last Name");
								temp=input.next();
								st.setString(4, temp);}
								else
									st.setString(4, null);
								System.out.println("Enter DOB(YYYY-MM-DD)");
								temp=input.next();
								st.setString(5, temp);
								System.out.println("Enter Nationality");
								temp=input.next();
								st.setString(6, temp);
								System.out.println("Enter Accommodation Name");
								temp=input.next();
								st.setString(7, temp);
								System.out.println("Enter Room number");
								int temp1=input.nextInt();
								st.setInt(8, temp1);
								System.out.println("Enter Department");
								temp=input.next();
								st1.setString(2, temp);
								System.out.println("Enter Salary");
								temp=input.next();
								st1.setString(3, temp);
								int count = st.executeUpdate();
								int count1 = st1.executeUpdate();
								if(count==1&&count1==1)
									System.out.println("Successful insertion");
								break;
								case "Management":
									String query2="insert into Manage values(?,?)";
									System.out.println("Enter the ID of the official and the name of the event he's managing");
									PreparedStatement st2 = con.prepareStatement(query2);
									String temp2=input.next();
									String temp3=input.next();
									st2.setString(1, temp2);
									st2.setString(2, temp3);
									int count2=st2.executeUpdate();
									if(count2==1)
										System.out.println("Successful Insertion");
									break;
								case "Travel":
									String query3="insert into TravelTo values(?,?,?,?,?)";
									System.out.println("Enter the ID of the official and the name of the venue he'll be going to");
									PreparedStatement st3 = con.prepareStatement(query3);
									String temp4=input.next();
									st3.setString(1, temp4);
									temp4=input.next();
									st3.setString(2, temp4);
									System.out.println("Enter the date");
									temp4=input.next();
									st3.setString(3, temp4);
									System.out.println("Enter the time of departure");
									temp4=input.next();
									st3.setString(4, temp4);
									System.out.println("Enter the mode of transport");
									temp4=input.next();
									st3.setString(5, temp4);
									int count3=st3.executeUpdate();
									if(count3==1)
										System.out.println("Successful Insertion");
									break;
								}
							System.out.println("\nDo you want to continue inserting Officials' information?(Yes/No)");
							field=input.next();
						}while(field.equals("Yes"));
						break;
					}
					System.out.println("\nDo you want to continue working with Officials?(Yes/No)");
					field=input.next();
					}while(field.equals("Yes"));
					break;
				}
				System.out.println("\nDo you want to continue working with Members?(Yes/No)");
				field=input.next();
				}while(field.equals("Yes"));
				break;
			case "Coaches":
				do{
					String query="";
					System.out.println("Do you want to view the information of\n1.All\n2.One\nCoaches?\nType \"Misc\" for a query of your own");
					field=input.next();
					switch(field){
					case "All":
						query="select * from Coach";
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery(query);
						ResultSetMetaData rsmd=rs.getMetaData();
						int c=rsmd.getColumnCount();
						int i=c;
						while(c!=0){
							c--;
							System.out.format("%33s",rsmd.getColumnName(i-c));  
						}
						System.out.println();
						while(rs.next()){
							c=i;
							while(c!=0){
								c--;
								System.out.format("%33s",rs.getString(i-c));
							}
							System.out.println();
						}
						break;
					case "One":
						System.out.println("Enter the ID of the Sportsperson coached");
						String id;
						id=input.next();
						query="select * from Coach where MemID=?";
						PreparedStatement st1 = con.prepareStatement(query);
						st1.setString(1,id);
						ResultSet rs1 = st1.executeQuery();
						ResultSetMetaData rsmd1=rs1.getMetaData();
						int c1=rsmd1.getColumnCount();
						int i1=c1;
						while(c1!=0){
							c1--;
							System.out.format("%33s",rsmd1.getColumnName(i1-c1));  
						}
						System.out.println();
						while(rs1.next()){
							c1=i1;
							while(c1!=0){
								c1--;
								System.out.format("%33s",rs1.getString(i1-c1));
							}
							System.out.println();
						}
						break;
					case "Misc":
						System.out.println("Enter your query in MYSQL");
						String temp=input.nextLine();
						query=input.nextLine();
						Statement st2 = con.createStatement();
						ResultSet rs2 = st2.executeQuery(query);
						ResultSetMetaData rsmd2=rs2.getMetaData();
						int c2=rsmd2.getColumnCount();
						int i2=c2;
						while(c2!=0){
							c2--;
							System.out.format("%33s",rsmd2.getColumnName(i2-c2));  
						}
						System.out.println();
						while(rs2.next()){
							c2=i2;
							while(c2!=0){
								c2--;
								System.out.format("%33s",rs2.getString(i2-c2));
							}
							System.out.println();
						}
						break;
					}
					System.out.println("\nDo you want to continue viewing Coaches' information?(Yes/No)");
					field=input.next();
				}while(field.equals("Yes"));
				break;
			case "Events":
				do{
					System.out.println("Do you want to\n1.Read\n2.Insert\n3.UpdateWinner");
					field=input.next();
					switch(field){
					case "Read":
						do{
						String query="";
						System.out.println("Do you want to view the information of\n1.All\n2.One\nEvents?\nType \"Misc\" for a query of your own");
						field=input.next();
						switch(field){
						case "All":
							query="select * from Event";
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery(query);
							ResultSetMetaData rsmd=rs.getMetaData();
							int c=rsmd.getColumnCount();
							int i=c;
							while(c!=0){
								c--;
								System.out.format("%17s",rsmd.getColumnName(i-c));  
							}
							System.out.println();
							while(rs.next()){
								c=i;
								while(c!=0){
									c--;
									System.out.format("%17s",rs.getString(i-c));
								}
								System.out.println();
							}
							break;
						case "One":
							System.out.println("Enter the name of the event");
							String id;
							id=input.next();
							do{
							System.out.println("1.Basic\n2.Participants\n3.Managers");
							field=input.next();
							switch(field){
							case "Basic":
							query="select * from Event where EventName=?";
							break;
							case "Participants":
								query="select MemID,FirstName,MiddleName,LastName from Member natural join Sportsperson natural join Participate where EventName=?";
								System.out.println("The following sportspersons participated in " + id);
								break;
							case "Managers":
								query="select MemID,FirstName,MiddleName,LastName from Member natural join Official natural join Manage where EventName=?";
								System.out.println("The following officials managed " + id);
								break;
							}
							PreparedStatement st1 = con.prepareStatement(query);
							st1.setString(1,id);
							ResultSet rs1 = st1.executeQuery();
							ResultSetMetaData rsmd1=rs1.getMetaData();
							int c1=rsmd1.getColumnCount();
							int i1=c1;
							while(c1!=0){
								c1--;
								System.out.format("%17s",rsmd1.getColumnName(i1-c1));  
							}
							System.out.println();
							while(rs1.next()){
								c1=i1;
								while(c1!=0){
									c1--;
									System.out.format("%17s",rs1.getString(i1-c1));
								}
								System.out.println();
							}
							System.out.println("\nDo you want to continue viewing information for event " + id + "?(Yes/No)");
							field=input.next();
							}while(field.equals("Yes"));
							break;
						case "Misc":
							System.out.println("Enter your query in MYSQL");
							String temp=input.nextLine();
							query=input.nextLine();
							Statement st2 = con.createStatement();
							ResultSet rs2 = st2.executeQuery(query);
							ResultSetMetaData rsmd2=rs2.getMetaData();
							int c2=rsmd2.getColumnCount();
							int i2=c2;
							while(c2!=0){
								c2--;
								System.out.format("%17s",rsmd2.getColumnName(i2-c2));  
							}
							System.out.println("");
							while(rs2.next()){
								c2=i2;
								while(c2!=0){
									c2--;
									System.out.format("%17s",rs2.getString(i2-c2));
								}
								System.out.println("");
							}
							break;
						}
						System.out.println("\nDo you want to continue viewing Events' information?(Yes/No)");
						field=input.next();
						}while(field.equals("Yes"));
						break;
					case "Insert":
						do{
						System.out.println("Insert a new\n1.Event\n2.Participant\n3.Manager");
						field=input.next();
						switch(field){
						case "Event":
						String query = "insert into Event values(?,?,?,?,?,?)";
						PreparedStatement st = con.prepareStatement(query);
						System.out.println("Enter Event Name");
						String temp;
						temp=input.next();
						st.setString(1, temp);
						System.out.println("Enter date of the event(YYYY-MM-DD)");
						temp=input.next();
						st.setString(2, temp);
						System.out.println("Enter time of the event(hh:mm:ss)");
						temp=input.next();
						st.setString(3, temp);
						System.out.println("Enter the price of the ticket");
						temp=input.next();
						st.setString(5, temp);
						System.out.println("Enter the venue of the event");
						temp=input.next();
						st.setString(6, temp);
						st.setString(4, null);
						int count = st.executeUpdate();
						if(count==1)
							System.out.println("Successful insertion");
						break;
						case "Participant":
							String query2="insert into Participate values(?,?)";
							System.out.println("Enter the ID of the sportsperson and the name of the event he's participating in");
							PreparedStatement st2 = con.prepareStatement(query2);
							String temp2=input.next();
							String temp3=input.next();
							st2.setString(1, temp2);
							st2.setString(2, temp3);
							int count2=st2.executeUpdate();
							if(count2==1)
								System.out.println("Successful Insertion");
							break;
						case "Manager":
							String query3="insert into Manage values(?,?)";
							System.out.println("Enter the ID of the official and the name of the event he's managing");
							PreparedStatement st3 = con.prepareStatement(query3);
							String temp4=input.next();
							String temp5=input.next();
							st3.setString(1, temp4);
							st3.setString(2, temp5);
							int count4=st3.executeUpdate();
							if(count4==1)
								System.out.println("Successful Insertion");
							break;
						}
						System.out.println("\nDo you want to continue inserting?(Yes/No)");
						field=input.next();
						}while(field.equals("Yes"));
						break;
					case "UpdateWinner":
						System.out.println("Enter the name of the event and the ID of the winning sportsperson");
						String query="update Event set Winner=? where EventName=?";
						PreparedStatement st = con.prepareStatement(query);
						String temp,temp1;
						temp=input.next();
						st.setString(2, temp);
						temp1=input.next();
						st.setString(1, temp1);
						int count=st.executeUpdate();
						if(count==1)
							System.out.println(temp1 + " has been updated as the winner of " + temp);
					break;
					}
					System.out.println("\nDo you want to continue working with Events?(Yes/No)");
					field=input.next();
					}while(field.equals("Yes"));
				break;
			case "Accommodation":
				do{
					System.out.println("Do you want to\n1.Read\n2.Insert");
					field=input.next();
					switch(field){
					case "Read":
						do{
						String query="";
						System.out.println("Do you want to view the information of\n1.All\n2.One\nAccommodations?\nType \"Misc\" for a query of your own");
						field=input.next();
						switch(field){
						case "All":
							query="select * from AccommodationFullDetails";
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery(query);
							ResultSetMetaData rsmd=rs.getMetaData();
							int c=rsmd.getColumnCount();
							int i=c;
							while(c!=0){
								c--;
								System.out.format("%16s",rsmd.getColumnName(i-c));  
							}
							System.out.println();
							while(rs.next()){
								c=i;
								while(c!=0){
									c--;
									System.out.format("%16s",rs.getString(i-c));
								}
								System.out.println();
							}
							break;
						case "One":
							System.out.println("Enter the name of the accommodation");
							String id;
							id=input.next();
							do{
							System.out.println("1.Basic\n2.Inhabitants");
							field=input.next();
							switch(field){
							case "Basic":
							query="select * from AccommodationFullDetails where PlaceName=?";
							break;
							case "Inhabitants":
								query="select MemID,FirstName,MiddleName,LastName from Member where PlaceName=?";
								System.out.println("The following members live in " + id);
								break;
							}
							PreparedStatement st1 = con.prepareStatement(query);
							st1.setString(1,id);
							ResultSet rs1 = st1.executeQuery();
							ResultSetMetaData rsmd1=rs1.getMetaData();
							int c1=rsmd1.getColumnCount();
							int i1=c1;
							while(c1!=0){
								c1--;
								System.out.format("%16s",rsmd1.getColumnName(i1-c1));  
							}
							System.out.println();
							while(rs1.next()){
								c1=i1;
								while(c1!=0){
									c1--;
									System.out.format("%16s",rs1.getString(i1-c1));
								}
								System.out.println();
							}
							System.out.println("\nDo you want to continue viewing information for accommodation " + id + "?(Yes/No)");
							field=input.next();
							}while(field.equals("Yes"));
							break;
						case "Misc":
							System.out.println("Enter your query in MYSQL");
							String temp=input.nextLine();
							query=input.nextLine();
							Statement st2 = con.createStatement();
							ResultSet rs2 = st2.executeQuery(query);
							ResultSetMetaData rsmd2=rs2.getMetaData();
							int c2=rsmd2.getColumnCount();
							int i2=c2;
							while(c2!=0){
								c2--;
								System.out.format("%16s",rsmd2.getColumnName(i2-c2));  
							}
							System.out.println();
							while(rs2.next()){
								c2=i2;
								while(c2!=0){
									c2--;
									System.out.format("%16s",rs2.getString(i2-c2));
								}
								System.out.println();
							}
							break;
						}
						System.out.println("\nDo you want to continue viewing Accommodations' information?(Yes/No)");
						field=input.next();
						}while(field.equals("Yes"));
						break;
					case "Insert":
						do{
						System.out.println("Insert a new\n1.Accommodation\n2.Inhabitant");
						field=input.next();
						switch(field){
						case "Accommodation":
						String query = "insert into Place values(?,?,?,?,?)";
						String query1 = "insert into Accommodation values(?,?)";
						PreparedStatement st = con.prepareStatement(query);
						PreparedStatement st1 = con.prepareStatement(query1);
						st1.setInt(2, 0);
						System.out.println("Enter name of the accommodation");
						String temp;
						temp=input.next();
						st.setString(1, temp);
						st1.setString(1, temp);
						System.out.println("Enter the plot number");
						temp=input.next();
						st.setString(2, temp);
						System.out.println("Enter the street name");
						temp=input.next();
						st.setString(3, temp);
						System.out.println("Enter the locality");
						temp=input.next();
						st.setString(4, temp);
						System.out.println("Enter the pincode");
						temp=input.next();
						st.setString(5, temp);
						System.out.println("Enter the capacity of the accommodation");
						temp=input.next();
						st1.setString(2, temp);
						int count = st.executeUpdate();
						int count1 = st1.executeUpdate();
						if(count==1&&count1==1)
							System.out.println("Successful insertion");
						break;
						case "Inhabitant":
							do{
								System.out.println("1.Sportsperson\n2.Official");
								field=input.next();
								switch(field){
								case "Sportsperson":
									do{
										String query2 = "insert into Member values(?,?,?,?,?,?,?,?)";
										String query3 = "insert into Sportsperson values(?,?)";
										PreparedStatement st2 = con.prepareStatement(query2);
										PreparedStatement st3 = con.prepareStatement(query3);
										st3.setInt(2, 0);
										System.out.println("Enter Member ID");
										String temp1;
										temp1=input.next();
										st2.setString(1, temp1);
										st3.setString(1, temp1);
										System.out.println("Enter First Name");
										temp1=input.next();
										st2.setString(2, temp1);
										System.out.println("Do you want to enter a Middle Name?(Yes/No)");
										field=input.next();
										if(field.equals("Yes")){
										System.out.println("Enter a Middle Name");
										temp=input.next();
										st2.setString(3, temp);}
										else
										st2.setString(3, null);
										System.out.println("Do you want to enter a Last Name?(Yes/No)");
										field=input.next();
										if(field.equals("Yes")){
										System.out.println("Enter a Last Name");
										temp=input.next();
										st2.setString(4, temp);}
										else
										st2.setString(4, null);
										System.out.println("Enter DOB(YYYY-MM-DD)");
										temp=input.next();
										st2.setString(5, temp1);
										System.out.println("Enter Nationality");
										temp=input.next();
										st2.setString(6, temp1);
										System.out.println("Enter Accommodation Name");
										aux=input.nextLine();
										temp=input.nextLine();
										st2.setString(7, temp1);
										System.out.println("Enter Room number");
										int temp2=input.nextInt();
										st2.setInt(8, temp2);
										int count2 = st2.executeUpdate();
										int count3 = st3.executeUpdate();
										if(count2==1&&count3==1)
											System.out.println("Successful insertion");
										System.out.println("\nDo you want to continue inserting sportspersons?(Yes/No)");
										field=input.next();
									}while(field.equals("Yes"));
									break;
								case "Official":
									String query2 = "insert into Member values(?,?,?,?,?,?,?,?)";
									String query3 = "insert into Official values(?,?)";
									PreparedStatement st2 = con.prepareStatement(query2);
									PreparedStatement st3 = con.prepareStatement(query3);
									System.out.println("Enter Member ID");
									String temp1;
									temp1=input.next();
									st2.setString(1, temp1);
									st3.setString(1, temp1);
									System.out.println("Enter First Name");
									temp1=input.next();
									st2.setString(2, temp1);
									System.out.println("Do you want to enter a Middle Name?(Yes/No)");
									field=input.next();
									if(field.equals("Yes")){
									System.out.println("Enter a Middle Name");
									temp=input.next();
									st2.setString(3, temp);}
									else
									st2.setString(3, null);
									System.out.println("Do you want to enter a Last Name?(Yes/No)");
									field=input.next();
									if(field.equals("Yes")){
									System.out.println("Enter a Last Name");
									temp=input.next();
									st2.setString(4, temp);}
									else
									st2.setString(4, null);
									System.out.println("Enter DOB(YYYY-MM-DD)");
									temp1=input.next();
									st2.setString(5, temp1);
									System.out.println("Enter Nationality");
									temp1=input.next();
									st2.setString(6, temp1);
									System.out.println("Enter Accommodation Name");
									aux=input.nextLine();
									temp1=input.nextLine();
									st2.setString(7, temp1);
									System.out.println("Enter Room number");
									int temp2=input.nextInt();
									st2.setInt(8, temp2);
									System.out.println("Enter Department");
									temp1=input.next();
									st3.setString(2, temp1);
									System.out.println("Enter Salary");
									temp1=input.next();
									st3.setString(3, temp1);
									int count2 = st2.executeUpdate();
									int count3 = st3.executeUpdate();
									if(count2==1&&count3==1)
										System.out.println("Successful insertion");
									break;
								}
								System.out.println("\nDo you want to continue inserting inhabitants?(Yes/No)");
								field=input.next();
							}while(field.equals("Yes"));
							break;
						}
						System.out.println("\nDo you want to continue inserting?(Yes/No)");
						field=input.next();
						}while(field.equals("Yes"));
						break;
					}
					System.out.println("\nDo you want to continue working with Accommodations?(Yes/No)");
					field=input.next();
					}while(field.equals("Yes"));
				break;
			case "SportsVenues":
				do{
					System.out.println("Do you want to\n1.Read\n2.Insert");
					field=input.next();
					switch(field){
					case "Read":
						do{
						String query="";
						System.out.println("Do you want to view the information of\n1.All\n2.One\nSports Venues?\nType \"Misc\" for a query of your own");
						field=input.next();
						switch(field){
						case "All":
							query="select * from SportsVenueFullDetails";
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery(query);
							ResultSetMetaData rsmd=rs.getMetaData();
							int c=rsmd.getColumnCount();
							int i=c;
							while(c!=0){
								c--;
								System.out.format("%16s",rsmd.getColumnName(i-c));  
							}
							System.out.println();
							while(rs.next()){
								c=i;
								while(c!=0){
									c--;
									System.out.format("%16s",rs.getString(i-c));
								}
								System.out.println();
							}
							break;
						case "One":
							System.out.println("Enter the name of the sports venue");
							String id;
							id=input.next();
							do{
							System.out.println("1.Basic\n2.Events\n3.Travels");
							field=input.next();
							switch(field){
							case "Basic":
							query="select * from SportsVenueFullDetails where PlaceName=?";
							break;
							case "Events":
								query="select EventName from Event where PlaceName=?";
								System.out.println("Events at " + id);
								break;
							case "Travels":
								query="select MemID,Date from TravelTo where PlaceName=?";
								System.out.println("Journeys to " + id);
								break;
							}
							PreparedStatement st1 = con.prepareStatement(query);
							st1.setString(1,id);
							ResultSet rs1 = st1.executeQuery();
							ResultSetMetaData rsmd1=rs1.getMetaData();
							int c1=rsmd1.getColumnCount();
							int i1=c1;
							while(c1!=0){
								c1--;
								System.out.format("%16s",rsmd1.getColumnName(i1-c1));  
							}
							System.out.println();
							while(rs1.next()){
								c1=i1;
								while(c1!=0){
									c1--;
									System.out.format("%16s",rs1.getString(i1-c1));
								}
								System.out.println();
							}
							System.out.println("\nDo you want to continue viewing information for sportsvenue " + id + "?(Yes/No)");
							field=input.next();
							}while(field.equals("Yes"));
							break;
						case "Misc":
							System.out.println("Enter your query in MYSQL");
							String temp=input.nextLine();
							query=input.nextLine();
							Statement st2 = con.createStatement();
							ResultSet rs2 = st2.executeQuery(query);
							ResultSetMetaData rsmd2=rs2.getMetaData();
							int c2=rsmd2.getColumnCount();
							int i2=c2;
							while(c2!=0){
								c2--;
								System.out.format("%16s",rsmd2.getColumnName(i2-c2));  
							}
							System.out.println();
							while(rs2.next()){
								c2=i2;
								while(c2!=0){
									c2--;
									System.out.format("%16s",rs2.getString(i2-c2));
								}
								System.out.println();
							}
							break;
						}
						System.out.println("\nDo you want to continue viewing Sportsvenues' information?(Yes/No)");
						field=input.next();
						}while(field.equals("Yes"));
						break;
					case "Insert":
						do{
						System.out.println("Insert a new\n1.Sportsvenue");
						field=input.next();
						switch(field){
						case "Sportsvenue":
							String query = "insert into Place values(?,?,?,?,?)";
							String query1 = "insert into SportsVenue values(?,?)";
							PreparedStatement st = con.prepareStatement(query);
							PreparedStatement st1 = con.prepareStatement(query1);
							st1.setInt(2, 0);
							System.out.println("Enter name of the sports venue");
							String temp;
							temp=input.next();
							st.setString(1, temp);
							st1.setString(1, temp);
							System.out.println("Enter the plot number");
							temp=input.next();
							st.setString(2, temp);
							System.out.println("Enter the street name");
							temp=input.next();
							st.setString(3, temp);
							System.out.println("Enter the locality");
							temp=input.next();
							st.setString(4, temp);
							System.out.println("Enter the pincode");
							temp=input.next();
							st.setString(5, temp);
							System.out.println("Enter the seating capacity of the sports venue");
							temp=input.next();
							st1.setString(2, temp);
							int count = st.executeUpdate();
							int count1 = st1.executeUpdate();
							if(count==1&&count1==1)
								System.out.println("Successful insertion");
						break;
						}
						System.out.println("\nDo you want to continue inserting?(Yes/No)");
						field=input.next();
						}while(field.equals("Yes"));
						break;
					}
					System.out.println("\nDo you want to continue working with SportsVenues?(Yes/No)");
					field=input.next();
					}while(field.equals("Yes"));
				break;
			}
			System.out.println("\nDo you want to continue working in other fields?(Yes/No)");
			field=input.next();
		}while(field.equals("Yes"));
		System.out.println("ThankYou!");
		input.close();
		con.close();
	}
}
