Use EmadeDev

Select  *
From  EmadeStores

--ETL using bulk insert



bulk insert EmadeCategoriesBulk from 'C:\Users\sunka\Documents\Emade Consulting IT Training\5-Month IT Career Program ClassWork+Assignments\ETL\ETL Assignment1\EmadeCategories.csv'with(format='csv', firstrow = 2,fieldterminator=',',rowterminator='0x0a');

