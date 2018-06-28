
# coding: utf-8

# In[ ]:

## Import warnings. Supress warnings (for  matplotlib)
import warnings
warnings.filterwarnings("ignore")


# In[ ]:

## Import analysis modules
import pandas as p
from pandas.tools.plotting import scatter_matrix
from sklearn.preprocessing import Imputer

## Import visualization modules
import matplotlib.pyplot as plt
import matplotlib.mlab as mlab


# In[ ]:

## Read in file
data = p.read_csv('F:\\DePaul\\IS467 - Winter 2016\\Week3\\loan.csv',delimiter='~}',na_values='nan')


# In[ ]:

## Basic information about the data 
data.info()


# In[ ]:

## To view a small sample of a Series or DataFrame object, use .head() and .tail() methods
data.head()


# In[ ]:

## To view a small sample of a Series or DataFrame object, use .head() and .tail() methods
data.tail(3)


# In[ ]:

## Get feature (column) names
data.columns


# In[ ]:

## Get instances (rows) in multidimensional array
data.values


# In[ ]:

## Indexing and selecting data w/ .loc position (primarily label based; useful w/ index labels)
data.loc[0]


# In[ ]:

## Indexing and selecting data w/ .loc position (primarily label based)
data.loc[0,['id','member_id']]


# In[ ]:

## Indexing and selecting data w/ .loc position (primarily label based)
data.loc[0:2,['id','member_id']]


# In[ ]:

## Indexing and selecting data w/ .iloc position (primarily integer / position based)
data.iloc[0]


# In[ ]:

## Indexing and selecting data w/ .iloc position (primarily integer / position based)
data.iloc[0:2,0:3]


# In[ ]:

## Indexing and selecting data w/ "[]" aka __getitem__ (useful for selecting lower-dimension slices)
data['loan_amnt'][0:5]


# In[ ]:

## Indexing and selecting data w/ "[]" aka __getitem__ (useful for selecting lower-dimension slices)
data[['member_id','loan_amnt']][0:5]


# In[ ]:

## Indexing and selecting data w/ attributes
data.member_id[0:5]


# In[ ]:

## More advanced Indexing and selecting 
data[(data['loan_amnt']==5000)]


# In[ ]:

## More advanced Indexing and selecting 
data[(data['loan_amnt']<5000) & (data['grade']=='B')]


# In[ ]:

## More advanced Indexing and selecting 
data.query("(loan_amnt < 5000) & (grade == 'B')")


# In[ ]:

## More advanced Indexing and Selecting
data[data['loan_amnt'].isin([4500,5000])]


# In[ ]:

## Selecting random samples w/ replacement
data.sample(n=3,replace=True,random_state=2)


# In[ ]:

## Count of instances and features
rows, columns = data.shape
print data.shape


# In[ ]:

## Get basic statistics for continuous features
numeric = data.describe(include=['number']).T.reset_index()
numeric.rename(columns={'index':'feature'},inplace=True)
numeric.insert(1,'missing',(rows - numeric['count'])/ float(rows))
numeric[0:5]


# In[ ]:

## Examine features with count missing > .60
numeric[numeric['missing']>.60][0:5]


# In[ ]:

## Examine features with std == 0 
numeric[numeric['std']==0]


# In[ ]:

## How many features can we eliminate?
drop = numeric[(numeric['missing']==1) | (numeric['std']==0)]
drop


# In[ ]:

## Drop the unhelpful features from the base and numeric table
data = data.drop(drop['feature'],axis=1)
numeric = numeric[~numeric['feature'].isin(drop['feature'])]


# In[ ]:

## Get basic statistics for discrete features
discrete = data.describe(include=['object']).T.reset_index()
discrete.rename(columns={'index':'feature'},inplace=True)
discrete.insert(1,'missing',(rows - discrete['count'])/ float(rows))
discrete[0:5]


# In[ ]:

## Examine features with frequency == rows
discrete[discrete['freq']==rows]


# In[ ]:

## Examine features with missing >.60
discrete[discrete['missing']>.60]


# In[ ]:

## How many features can we eliminate?
ddrop = discrete[(discrete['missing']>.6) | (discrete['unique']==1)]
ddrop


# In[ ]:

## Drop unhelpful features from the base table
data = data.drop(ddrop['feature'],axis=1)
discrete = discrete[~discrete['feature'].isin(ddrop['feature'])]


# In[ ]:

## How many columns do we have left?
data.shape


# In[ ]:

data


# In[ ]:

## Let's see if we have any nulls
data.isnull().any()


# In[ ]:

## Impute missing cases
imp = Imputer(missing_values='NaN',strategy='median',axis=0)
data['delinq_2yrs'] = imp.fit_transform(data['delinq_2yrs'].reshape(-1,1))


# In[ ]:

## Standard histograms with pandas
data.loc[:,['loan_amnt','installment','dti','delinq_2yrs']].hist()
plt.show()


# In[ ]:

## Iter over a few numeric feature distributions with matplotlib
for col in ['loan_amnt','installment','dti','delinq_2yrs']:
    row = numeric[numeric['feature']==col]
    mu, sig = row['mean'], row['std']
    n, bins, patches = plt.hist(data[col],bins=10, normed=1)
    y = mlab.normpdf(bins, float(mu), float(sig))
    plt.plot(bins, y, 'r--')
    plt.xlabel(col)
    plt.ylabel('Probability')
    plt.title('Histogram of ' + col)
    plt.show()


# In[ ]:

## Standard box plots with pandas
data['loan_amnt'].plot.box()
plt.show()


# In[ ]:

## Standard scatter plot with pandas
data.plot.scatter(x='loan_amnt',y='funded_amnt')
plt.xlim(0,40000)
plt.ylim(0,40000)
plt.show()


# In[ ]:

## Let's calculate pearsons' correlation
pearson = data.loc[:,numeric['feature'][2:]].corr(method='pearson')


# In[ ]:

## Plot correlation coefficients
plt.matshow(pearson)
plt.show()


# In[ ]:

pearson


# In[ ]:

## Let's create a scatter plot matrix 
scatter_matrix(data.loc[:,numeric.loc[2:5,'feature']], alpha=0.2, figsize=(4, 4), diagonal='kde')
plt.show()


# In[ ]:

## Bar chart
data['term'].value_counts().plot(kind='bar')
plt.show()


# In[ ]:

## Pie chart
data['term'].value_counts().plot(kind='pie')
plt.show()


# In[ ]:

## Let's take a look at a string feature
data['term'][0]


# In[ ]:

## Address by stripping leading space
data['term'] = data['term'].str.strip()


# In[ ]:

## Check if that worked
data['term'][0]


# In[ ]:

## Seperate input features from target feature
x = data.drop('loan_status',1)
y = data['loan_status']


# In[ ]:

x[0:5]


# In[ ]:

y

