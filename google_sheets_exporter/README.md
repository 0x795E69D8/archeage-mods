# Auction house prices to Google Sheet exporter

Allows you read a Google Sheet document with ArcheAge item IDs to then export the auction house prices for those items back to the Google Sheet.

To make this work you have to create a project for your Google Sheet in Google Cloud Console.  
Next you create a service account for that project and give it access to your google sheet.  
Download the private key for your service account and extract the modulus and exponent from the key, just google what this means.

To install this addon create a `lib` folder inside your ArcheAge game folder (where you can also find bin32/bin64 etc).  
Next copy [base64.lua](lib/base64.lua), [rs256.lua](lib/rs256.lua) and [BigNum.lua](https://github.com/ennorehling/euler/blob/master/BigNum.lua) into that folder.  
Next compile [helper.cpp](lib/helper.cpp) with [Crypto++](https://cryptopp.com/) and [cBigNumber](https://www.imach.uran.ru/cbignum/) or download `helper.exe` from the [Release](../../../releases/latest) tab and also put it into the `lib` folder you created earlier.

Finally install the [esc_menu](../../../tree/main/esc_menu) mod with the corresponding [plugin](../esc_menu/plugins/google.lua).  
Open the [google.lua](../esc_menu/plugins/google.lua) file and configure it as follows under mod config (line 8):

    local price_config = "dailyAvg" -- this can be either dailyAvg, weeklyAvg, minPrice or maxPrice depending on what you want to export
    local spreadsheetId = "yourSpreadsheetId" -- your google spreadsheet id, you find it in the url like docs.google.com/spreadsheets/d/<id>
    local sheetId = "sheet name" -- the name of your sheet page at the bottom of the page
    local service_account = "account@project.iam.gserviceaccount.com" -- the service account address you created earlier
    local private_key_id = "privateKeyId" -- the ID of your private key you downloaded earlier
    local private_key_modulus = "privateKeyModulus" -- the modulus you extracted from your private key earlier (this is a very long number)
    local private_key_exponent = "privateKeyExponent" -- the exponent you extracted from your private key earlier (this number is also very long)

The Google Sheet you create for this has to look like this:  
![Spreadsheet](https://drive.usercontent.google.com/download?id=1nT3YPZdcIN0-iMoo2MKtpMCpmECKWJzV)  
You have to give the desired item ID and the desired grade to be able to find the correct prices.  
Item grades are `0` for basic, `1` for crude and `2` through `12` for grand through eternal

Demonstration:  
[Check out a demo video here](https://drive.google.com/file/d/1K4l3DlznMC8hLBFOwrElm8-mZZVmRIKi/preview)  

The [base64.lua](lib/base64.lua) used here is a modified version of the one by Alex Kloss found [here](http://lua-users.org/wiki/BaseSixtyFour).  
I changed the character string `b` to include the correct characters for the JWT token, deleted the command line version, and put the other functions into an object for easier import into the rest of my script.  