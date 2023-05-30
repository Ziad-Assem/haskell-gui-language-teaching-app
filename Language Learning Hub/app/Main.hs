import Graphics.UI.Gtk

main :: IO ()
main = do

  --initializes the GUI for haskell
  initGUI

---------------------------------Setting the windows of every page----------------------------------------------------

  ---Creates the windows we need to go to according to which button is clicked, these pages will store a an invisible table that will help align the widgets
  spanishWindow  <- windowNew
  mainMenuWindow <- windowNew
  polishWindow <- windowNew

  ---setting the window up by choosing the title, border, width, & height
  set mainMenuWindow [windowTitle := "AASTMT Language Hub: Main Menu", containerBorderWidth := 10,
              windowDefaultWidth := 600, windowDefaultHeight := 800]

  set spanishWindow [windowTitle := "AASTMT Language Hub: Español Language", containerBorderWidth := 50,
              windowDefaultWidth := 600, windowDefaultHeight := 800]

  set polishWindow [windowTitle := "AASTMT Language Hub: Polish Language", containerBorderWidth := 50,
              windowDefaultWidth := 600, windowDefaultHeight := 800]

  windowFullscreen mainMenuWindow
  windowFullscreen spanishWindow
  windowFullscreen polishWindow

  ---creates an invisible table for each window so that it can used for adding widgets in an aligned manner 
  tableSpanish   <- tableNew 14 14 True
  containerAdd spanishWindow tableSpanish

  tableMainMenu   <- tableNew 14 14 True
  containerAdd mainMenuWindow tableMainMenu

  tablePolish   <- tableNew 14 14 True
  containerAdd polishWindow tablePolish


----------------------------------------------------------------------------------------------------------------------

------------------------------------START MAIN MENU WINDOW-----------------------------------------------------

-----Start main menu logo------------------------

  -- this loads an image using the fall path then is applied on the table 
  polishFlagMain <- imageNewFromFile "/home/ziad/Desktop/Haskell Project/Trial 3/app/Images/poland.png"
  widgetSetSizeRequest polishFlagMain 30 30
  tableAttachDefaults tableMainMenu polishFlagMain 1 5 0 5

  logo <- imageNewFromFile "/home/ziad/Desktop/Haskell Project/Trial 3/app/Images/logo.png"
  widgetSetSizeRequest logo 25 25
  tableAttachDefaults tableMainMenu logo 5 9 0 5

  spanishFlagMain <- imageNewFromFile "/home/ziad/Desktop/Haskell Project/Trial 3/app/Images/spain.png"
  widgetSetSizeRequest spanishFlagMain 30 30
  tableAttachDefaults tableMainMenu spanishFlagMain 9 13 0 5

-----End main menu logo------------------------

-----Start Choose spanish window button-----

  -- creates a button that when activated, it will hide the window it's in and displays the window it's being directed to
  buttonChooseSpanishWindow <- buttonNewWithLabel "Español"
  tableAttachDefaults tableMainMenu buttonChooseSpanishWindow 5 9 7 8
  on buttonChooseSpanishWindow buttonActivated $ do
    widgetHide mainMenuWindow
    widgetShowAll spanishWindow


  -----End Choose spanish window button-----

-----Start Choose polish window button-----


  -- creates a button that when activated, it will hide the window it's in and displays the window it's being directed to
  buttonChoosePolishWindow <- buttonNewWithLabel "Polski"
  tableAttachDefaults tableMainMenu buttonChoosePolishWindow 5 9 9 10
  on buttonChoosePolishWindow buttonActivated $ do
    widgetHide mainMenuWindow
    widgetShowAll polishWindow


  -----End Choose polish window button-----


-----Start EXIT Main Menu Button-----

  --creates a button that when activated, it will destroy the window it's in
  buttonExitMainMenu <- buttonNewWithLabel "Exit"
  tableAttachDefaults tableMainMenu buttonExitMainMenu 5 9 11 12
  on buttonExitMainMenu buttonActivated $ do
    widgetDestroy mainMenuWindow

  -----End EXIT Main Menu Button-----

-------------------------------------------------------------------------------------------------------------

  cal <- calendarNew
  (year, month, day) <- calendarGetDate cal

  mainMenuDate <- labelNew(Just ("Date: " ++ (show day) ++ " / " ++ (show (month+1)) ++ " / "++ (show year)))
  tableAttachDefaults tableMainMenu mainMenuDate 5 9 15 16

  mainMenuDevs <- labelNew (Just "Developed by: Ziad Assem & Youssel El Habrouk")
  tableAttachDefaults tableMainMenu mainMenuDevs 1 5 15 16

  mainMenuWelcome <- labelNew (Just "Welcome to AASTMT Language Hub")
  tableAttachDefaults tableMainMenu mainMenuWelcome 5 9 5 6

  mainMenuChoose <- labelNew (Just "Pick a language:")
  tableAttachDefaults tableMainMenu mainMenuChoose 5 9 6 7
  
  mainMenuVersion <- labelNew (Just "V 1.0.0")
  tableAttachDefaults tableMainMenu mainMenuVersion 9 13 15 16

  font <- fontDescriptionFromString "Dyuthi 20"

  widgetModifyFont mainMenuDevs (Just font)
  widgetModifyFont mainMenuChoose (Just font)
  widgetModifyFont mainMenuVersion (Just font)
  widgetModifyFont mainMenuDate (Just font)
  widgetModifyFont mainMenuWelcome (Just font)

-------------------------------------------------------------------------------------------------------------

------------------------------------END MAIN MENU WINDOW-----------------------------------------------------



------------------------------------START SPANISH WINDOW-----------------------------------------------------

  ------Start of image of spanish window------

  spanishFlag <- imageNewFromFile "/home/ziad/Desktop/Haskell Project/Trial 3/app/Images/spain.png"
  widgetSetSizeRequest spanishFlag 25 25
  tableAttachDefaults tableSpanish spanishFlag 0 15 0 2

  ------End of image of spanish window------

  -----Start of Button 1 with label 1-----

  spanishButton1 <- buttonNewWithLabel "Hola"
  onClicked spanishButton1 (buttonSwitchSpanish spanishButton1)
  tableAttachDefaults tableSpanish spanishButton1 0 2 3 5

  spanishLabel1 <- labelNew (Just "Español")
  onClicked spanishButton1 (textSwitchSpanish spanishLabel1)
  tableAttachDefaults tableSpanish spanishLabel1 0 2 5 6

   -----End of Button 1 with label 1 -----


  -----Start of Button 2 with label 2-----

  spanishButton2 <- buttonNewWithLabel "Como estas?"
  onClicked spanishButton2 (buttonSwitchSpanish spanishButton2)
  tableAttachDefaults tableSpanish spanishButton2 3 5 3 5

  spanishLabel2 <- labelNew (Just "Español")
  onClicked spanishButton2 (textSwitchSpanish spanishLabel2)
  tableAttachDefaults tableSpanish spanishLabel2 3 5 5 6

  -----End of Button 2 with label 2-----


  -----Start of Button 3 with label 3-----

  spanishButton3 <- buttonNewWithLabel "Bien!"
  onClicked spanishButton3 (buttonSwitchSpanish spanishButton3)
  tableAttachDefaults tableSpanish spanishButton3 6 8 3 5

  spanishLabel3 <- labelNew (Just "Español")
  onClicked spanishButton3 (textSwitchSpanish spanishLabel3)
  tableAttachDefaults tableSpanish spanishLabel3 6 8 5 6

  -----End of Button 3 with label 3-----

  -----Start of Button 4 with label 4-----

  spanishButton4 <- buttonNewWithLabel "Gracias!"
  onClicked spanishButton4 (buttonSwitchSpanish spanishButton4)
  tableAttachDefaults tableSpanish spanishButton4 9 11 3 5

  spanishLabel4 <- labelNew (Just "Español")
  onClicked spanishButton4 (textSwitchSpanish spanishLabel4)
  tableAttachDefaults tableSpanish spanishLabel4 9 11 5 6

  -----End of Button 4 with label 4-----

  -----Start of Button 5 with label 5-----

  spanishButton5 <- buttonNewWithLabel "Qué haces?"
  onClicked spanishButton5 (buttonSwitchSpanish spanishButton5)
  tableAttachDefaults tableSpanish spanishButton5 12 14 3 5

  spanishLabel5 <- labelNew (Just "Español")
  onClicked spanishButton5 (textSwitchSpanish spanishLabel5)
  tableAttachDefaults tableSpanish spanishLabel5 12 14 5 6

  -----End of Button 5 with label 5-----

  -----Start of Button 6 with label 6-----

  spanishButton6 <- buttonNewWithLabel "Buenos días!"
  onClicked spanishButton6 (buttonSwitchSpanish spanishButton6)
  tableAttachDefaults tableSpanish spanishButton6 0 2 7 9

  spanishLabel6 <- labelNew (Just "Español")
  onClicked spanishButton6 (textSwitchSpanish spanishLabel6)
  tableAttachDefaults tableSpanish spanishLabel6 0 2 9 10

  -----End of Button 6 with label 6-----

  -----Start of Button 7 with label 7-----

  spanishButton7 <- buttonNewWithLabel "Bienvenido!"
  onClicked spanishButton7 (buttonSwitchSpanish spanishButton7)
  tableAttachDefaults tableSpanish spanishButton7 3 5 7 9

  spanishLabel7 <- labelNew (Just "Español")
  onClicked spanishButton7 (textSwitchSpanish spanishLabel7)
  tableAttachDefaults tableSpanish spanishLabel7 3 5 9 10

  -----End of Button 7 with label 7-----

    -----Start of Button 8 with label 8-----

  spanishButton8 <- buttonNewWithLabel "Por favor"
  onClicked spanishButton8 (buttonSwitchSpanish spanishButton8)
  tableAttachDefaults tableSpanish spanishButton8 6 8 7 9

  spanishLabel8 <- labelNew (Just "Español")
  onClicked spanishButton8 (textSwitchSpanish spanishLabel8)
  tableAttachDefaults tableSpanish spanishLabel8 6 8 9 10

  -----End of Button 8 with label 8-----

    -----Start of Button 9 with label 9-----

  spanishButton9 <- buttonNewWithLabel "Perdone!"
  onClicked spanishButton9 (buttonSwitchSpanish spanishButton9)
  tableAttachDefaults tableSpanish spanishButton9 9 11 7 9

  spanishLabel9 <- labelNew (Just "Español")
  onClicked spanishButton9 (textSwitchSpanish spanishLabel9)
  tableAttachDefaults tableSpanish spanishLabel9 9 11 9 10

  -----End of Button 9 with label 9-----

  -----Start of Button 10 with label 10-----

  spanishButton10 <- buttonNewWithLabel "Lo siento!"
  onClicked spanishButton10 (buttonSwitchSpanish spanishButton10)
  tableAttachDefaults tableSpanish spanishButton10 12 14 7 9

  spanishLabel10 <- labelNew (Just "Español")
  onClicked spanishButton10 (textSwitchSpanish spanishLabel10)
  tableAttachDefaults tableSpanish spanishLabel10 12 14 9 10

  -----End of Button 10 with label 10-----

  -----Start of GO TO Main Menu button-----
  
  --creates a button that when activated, it will go to the main menu window
  buttonMainMenu <- buttonNewWithLabel "Main Menu"
  tableAttachDefaults tableSpanish buttonMainMenu 4 6 14 15

  on buttonMainMenu buttonActivated $ do
    widgetHide spanishWindow
    widgetShowAll mainMenuWindow

  -----End of GO TO Main Menu button-----

  -----Start of EXIT spanish button----

  --creates a button that when activated, it will destroy the window it's in
  buttonExitSpanish <- buttonNewWithLabel "Exit"
  tableAttachDefaults tableSpanish buttonExitSpanish 8 10 14 15
  on buttonExitSpanish buttonActivated $ do
    widgetDestroy  spanishWindow


  -----ENd of EXIT spanish button-----

------------------------------------End Spanish Window------------------------------------------------------


------------------------------------START POLISH WINDOW-----------------------------------------------------

  ------Start of image of polish window------

  polishFlag <- imageNewFromFile "/home/ziad/Desktop/Haskell Project/Trial 3/app/Images/poland.png"
  widgetSetSizeRequest polishFlag 25 25
  tableAttachDefaults tablePolish polishFlag 0 15 0 2

  ------End of image of polish window------

  -----Start of Button 1 with label 1-----

  polishButton1 <- buttonNewWithLabel "Potrzebuję lekarza."
  onClicked polishButton1 (buttonSwitchPolish polishButton1)
  tableAttachDefaults tablePolish polishButton1 0 2 3 5

  polishLabel1 <- labelNew (Just "Polski")
  onClicked polishButton1 (textSwitchPolish polishLabel1)
  tableAttachDefaults tablePolish polishLabel1 0 2 5 6


   -----End of Button 1 with label 1 -----


  -----Start of Button 2 with label 2-----

  polishButton2 <- buttonNewWithLabel "Pomocy!"
  onClicked polishButton2 (buttonSwitchPolish polishButton2)
  tableAttachDefaults tablePolish polishButton2 3 5 3 5

  polishLabel2 <- labelNew (Just "Polski")
  onClicked polishButton2 (textSwitchPolish polishLabel2)
  tableAttachDefaults tablePolish polishLabel2 3 5 5 6

  -----End of Button 2 with label 2-----


  -----Start of Button 3 with label 3-----

  polishButton3 <- buttonNewWithLabel "Powodzenia!"
  onClicked polishButton3 (buttonSwitchPolish polishButton3)
  tableAttachDefaults tablePolish polishButton3 6 8 3 5

  polishLabel3 <- labelNew (Just "Polski")
  onClicked polishButton3 (textSwitchPolish polishLabel3)
  tableAttachDefaults tablePolish polishLabel3 6 8 5 6

  -----End of Button 3 with label 3-----

  -----Start of Button 4 with label 4-----

  polishButton4 <- buttonNewWithLabel "Cześć!"
  onClicked polishButton4 (buttonSwitchPolish polishButton4)
  tableAttachDefaults tablePolish polishButton4 9 11 3 5

  polishLabel4 <- labelNew (Just "Polski")
  onClicked polishButton4 (textSwitchPolish polishLabel4)
  tableAttachDefaults tablePolish polishLabel4 9 11 5 6

  -----End of Button 4 with label 4-----

  -----Start of Button 5 with label 5-----

  polishButton5 <- buttonNewWithLabel "Co słychać?"
  onClicked polishButton5 (buttonSwitchPolish polishButton5)
  tableAttachDefaults tablePolish polishButton5 12 14 3 5

  polishLabel5 <- labelNew (Just "Polski")
  onClicked polishButton5 (textSwitchPolish polishLabel5)
  tableAttachDefaults tablePolish polishLabel5 12 14 5 6

  -----End of Button 5 with label 5-----

  -----Start of Button 6 with label 6-----

  polishButton6 <- buttonNewWithLabel "Dobranoc!"
  onClicked polishButton6 (buttonSwitchPolish polishButton6)
  tableAttachDefaults tablePolish polishButton6 0 2 7 9

  polishLabel6 <- labelNew (Just "Polski")
  onClicked polishButton6 (textSwitchPolish polishLabel6)
  tableAttachDefaults tablePolish polishLabel6 0 2 9 10

  -----End of Button 6 with label 6-----

  -----Start of Button 7 with label 7-----

  polishButton7 <- buttonNewWithLabel "Miło mi Panią poznać."
  onClicked polishButton7 (buttonSwitchPolish polishButton7)
  tableAttachDefaults tablePolish polishButton7 3 5 7 9

  polishLabel7 <- labelNew (Just "Polski")
  onClicked polishButton7 (textSwitchPolish polishLabel7)
  tableAttachDefaults tablePolish polishLabel7 3 5 9 10

  -----End of Button 7 with label 7-----

    -----Start of Button 8 with label 8-----

  polishButton8 <- buttonNewWithLabel "Dziękuję."
  onClicked polishButton8 (buttonSwitchPolish polishButton8)
  tableAttachDefaults tablePolish polishButton8 6 8 7 9

  polishLabel8 <- labelNew (Just "Polski")
  onClicked polishButton8 (textSwitchPolish polishLabel8)
  tableAttachDefaults tablePolish polishLabel8 6 8 9 10

  -----End of Button 8 with label 8-----

    -----Start of Button 9 with label 9-----

  polishishButton9 <- buttonNewWithLabel "Nie ma za co."
  onClicked polishishButton9 (buttonSwitchPolish polishishButton9)
  tableAttachDefaults tablePolish polishishButton9 9 11 7 9

  polishLabel9 <- labelNew (Just "Polski")
  onClicked polishishButton9 (textSwitchPolish polishLabel9)
  tableAttachDefaults tablePolish polishLabel9 9 11 9 10

  -----End of Button 9 with label 9-----

  -----Start of Button 10 with label 10-----

  polishishButton10 <- buttonNewWithLabel "Przepraszam."
  onClicked polishishButton10 (buttonSwitchPolish polishishButton10)
  tableAttachDefaults tablePolish polishishButton10 12 14 7 9

  polishLabel10 <- labelNew (Just "Polski")
  onClicked polishishButton10 (textSwitchPolish polishLabel10)
  tableAttachDefaults tablePolish polishLabel10 12 14 9 10

  -----End of Button 10 with label 10-----

  -----Start of GO TO Main Menu button-----

  --creates a button that when activated, it will go back to main menu page
  buttonMainMenu <- buttonNewWithLabel "Main Menu"
  tableAttachDefaults tablePolish buttonMainMenu 4 6 14 15

  on buttonMainMenu buttonActivated $ do
    widgetHide polishWindow
    widgetShowAll mainMenuWindow

  -----End of GO TO Main Menu button-----

  -----Start EXIT polish Button-----

  
  --creates a button that when activated, it will destroy the window it's in
  buttonExitPolish <- buttonNewWithLabel "Exit"
  tableAttachDefaults tablePolish buttonExitPolish 8 10 14 15
  on buttonExitPolish buttonActivated $ do
    widgetDestroy  polishWindow

  -----End EXIT polish Button-----

------------------------------------END POLISH WINDOW-----------------------------------------------------


  --- those 3 onDestroy functions terminated all the windows when they're closed or force closed
  onDestroy mainMenuWindow mainQuit
  onDestroy spanishWindow mainQuit
  onDestroy polishWindow mainQuit


  ---- widgetShowALl displays all the widgets on the window
  widgetShowAll mainMenuWindow
  
  ---GUI loop for haskell
  mainGUI


--this function changes the text when spanish button is clicked, if it contains espanol, it'll change to english(to change with the language) and vice versa

textSwitchSpanish :: Label -> IO ()
textSwitchSpanish t = do
  txt <- labelGetLabel t
  let newtxt = case txt of
                  "Español" -> "English"
                  "English" -> "Español"

  labelSetLabel t newtxt

--this function changed the text when polish button is clicked, if it contains polski, it'll change to english(to change with the language) and vice versa

textSwitchPolish :: Label -> IO ()
textSwitchPolish t = do
  txt <- labelGetLabel t
  let newtxt = case txt of
                  "Polski" -> "English"
                  "English" -> "Polski"

  labelSetLabel t newtxt


--this function changed the text when spanish button is clicked, if it contains espanol, it'll change to english(to change with the language) and vice versa

buttonSwitchSpanish :: Button -> IO ()
buttonSwitchSpanish b = do
  txt <- buttonGetLabel b
  let newtxt = case txt of
                  "Hola" -> "Hello"
                  "Como estas?"  -> "How are you?"
                  "Hello" -> "Hola"
                  "How are you?"  -> "Como estas?"
                  "Bien!" -> "Good!"
                  "Good!" -> "Bien!"
                  "Gracias!" -> "Thank you!"
                  "Thank you!" -> "Gracias!"
                  "Qué haces?" -> "What are you doing?"
                  "What are you doing?" -> "Qué haces?"
                  "Buenos días!" -> "Good morning!"
                  "Good morning!" -> "Buenos días!"
                  "Bienvenido!" -> "Welcome!"
                  "Welcome!" -> "Bienvenido!"
                  "Por favor" -> "Please"
                  "Please" -> "Por favor"
                  "Perdone!" -> "Excuse me!"
                  "Excuse me!" -> "Perdone!"
                  "Lo siento!" -> "Sorry!"
                  "Sorry!" -> "Lo siento!"

  buttonSetLabel b newtxt

  ----this function changed the text when polish button is clicked, if it contains polski, it'll change to english(to change with the language) and vice versa
    
buttonSwitchPolish :: Button -> IO ()
buttonSwitchPolish b = do
  txt <- buttonGetLabel b
  let newtxt = case txt of

                  "Potrzebuję lekarza." -> "I need a doctor."
                  "I need a doctor." -> "Potrzebuję lekarza." 

                  "Pomocy!" -> "Help!"
                  "Help!" -> "Pomocy!"

                  "Powodzenia!" -> "Good Luck!"
                  "Good Luck!" -> "Powodzenia!"

                  "Cześć!" -> "Hello! / Goodbye!"
                  "Hello! / Goodbye!" -> "Cześć!"

                  "Co słychać?" -> "How are you?"
                  "How are you?" -> "Co słychać?"

                  "Miło mi Panią poznać." -> "Nice to meet you."
                  "Nice to meet you." -> "Miło mi Panią poznać."

                  "Dziękuję." -> "Thank you."
                  "Thank you." -> "Dziękuję."

                  "Nie ma za co." -> "You're welcome."
                  "You're welcome." -> "Nie ma za co."

                  "Przepraszam." -> "Excuse me."
                  "Excuse me." -> "Przepraszam."

                  "Dobranoc!" -> "Goodnight!"
                  "Goodnight!" -> "Dobranoc!"

  buttonSetLabel b newtxt