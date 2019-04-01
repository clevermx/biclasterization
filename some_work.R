fileName <- "D:\\Projects\\R\\Data\\test.bed"
my_data<-read.table(fileName, header=TRUE,row.names = 4,sep='\t')[,c(-1,-2,-3)]
print(str(my_data))

listMarts()
ensembl=useMart("ensembl") #¬ыбираем раздел этого биомарта

listDatasets(ensembl) # смотрим доступные бд
ensembl = useDataset("hsapiens_gene_ensembl",mart=ensembl) # выбираем датасет
  filters = listFilters(ensembl)
  atr= listAttributes(ensembl)
  print(atr)
  print(filters)

cut_dot<- function(x){
  sub("[.].*","",x)
}
row_names =  rownames(my_data)
 true_names = unlist(lapply( row_names,cut_dot))


res <- getBM(filters ='ensembl_gene_id', attributes=c('ensembl_gene_id'),values=true_names, mart=ensembl)
print(str(my_data))
print(str(res))
print (str(true_names))
print (length(row_names))
res=res[[1]]

x=0
y=0
z=0
v=0
for (name in true_names) {
  z=z+1
  for (gene in res){
    if(name==gene) {
      x=x+1
      y=1
      break
    }
  }
  if (y==0){
    v=v+1
    cat(v, " ",z," ",name,"\n")
  }
  y=0
}
rm(data_names)
print ("ENSG00000196544" == "ENSG00000196544")
print(x)
print(str(res))