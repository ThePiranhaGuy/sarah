# Note:
In order for watch plugin to access omdb database, it reqires a API key.
Please add the API key to a .env file in the `../sarah/plugins/watch/` directory.

## Steps:
1. Create a `.env ` file
    ```zsh
    touch .env
    ```
2. open the `.env` file in a text editor of your choice. or just use `nano editor` in the terminal
    ```zsh
    nano .env
    ```
3. Add the following lines and replace the phrase `yourKeyHere` with your API key from the website[https://www.omdbapi.com/apikey.aspx].
    ```zsh
    API_KEY = "yourKeyHere"
    ```
    Note: donot add any quotations around the key. Just paste it.

4. Done

### Now you can build the sarah application in your terminal and it'll work 