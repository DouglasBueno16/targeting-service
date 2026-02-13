### **Arquivo de etapas do projeto**



##### **Erros encontrados:**

1. Biblioteca psycopg2-binary na versão 2.9.5 não é compatível com o python 3.14
2. Flask 2.2.2, ao baixar sua dependência werkzeug, baixa a versão mais recente, o que causou uma incompatibilidade entre as versões



##### Soluções

1. Foi utilizado o python 3.9 conforme recomendado pelo `README.md`
2. Adicionado o Werkzeug em sua versão 2.2.3 no arquivo de requirements.txt para melhor compatibilidade com o Flask
