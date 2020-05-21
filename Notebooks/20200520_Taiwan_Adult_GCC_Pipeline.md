# Program List and Versions
FastQC v0.11.8
MultiQC v1.7 
fastp 0.20.0
samtools 1.9 
hisat2-align-s version 2.1.0
stringtie v2.1.1


# Analysis for Pocillopora acuta adult Taiwan Samples (Mayfield et al XXXX0
Data uploaded and analyzed on KITT

# Upload data to server
### add 12 Adult P acuta libraries
```scp -P 2292 /Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/Adult_Summer_2010/*.fastq.gz hputnam@kitt.uri.edu:/home/hputnam/Taiwan_Pacuta_Adult_GCC```

#### Origin Checksum
* f75d8e3fd1c9c940a823cc76757dae47  12-14A_AGTCAA_L005_R1_001.fastq.gz
* 670c45943a846b0195521ba46f77b37c  12-14A_AGTCAA_L005_R1_002.fastq.gz
* 567d0e62d6a082053e13728e10e7da7b  12-14A_AGTCAA_L005_R2_001.fastq.gz
* c73f0d51a0bfbba902581d147aad7753  12-14A_AGTCAA_L005_R2_002.fastq.gz
* 9db1faa0bcfc6e50042e9c23f6d83805  12-2B_TGACCA_L005_R1_001.fastq.gz
* e3bcadd245c972a155f163f205861db2  12-2B_TGACCA_L005_R2_001.fastq.gz
* 617b03dad7764e36cfd0cf357dc6a630  12-7A_CGATGT_L005_R1_001.fastq.gz
* d15095ace9a0a4321f600e5c963fa7e2  12-7A_CGATGT_L005_R2_001.fastq.gz
* df4b02a369ec6a53451ffbcf89cd91b0  13-10A_AGTTCC_L005_R1_001.fastq.gz
* deff5731b4220367036c10b40b36d772  13-10A_AGTTCC_L005_R2_001.fastq.gz
* 1f632536465d974108d2c72757964b5b  13-13A_GTCCGC_L005_R1_001.fastq.gz
* ba3d5b2fba1f5322304abfe718644215  13-13A_GTCCGC_L005_R1_002.fastq.gz
* ce5bf412e68d35032149fe573a471a00  13-13A_GTCCGC_L005_R2_001.fastq.gz
* 0bd87606b7af08264d8a90bdf7bb7779  13-13A_GTCCGC_L005_R2_002.fastq.gz
* d9d9a4fd788fc19dbd00850993179591  13-16A_GCCAAT_L005_R1_001.fastq.gz
* ada2d4073b4f516aa19575dadc97e12b  13-16A_GCCAAT_L005_R2_001.fastq.gz
* 6bdd9ec3a7162d1f6b43bd0a8c614f6d  13-9A_backup_CAGATC_L005_R1_001.fastq.gz
* 3f54b3039ef0205c0b11b69a31234c2d  13-9A_backup_CAGATC_L005_R2_001.fastq.gz
* 94d2502f93133ecebd2fb259778a13aa  14-11A_backup_ACAGTG_L005_R1_001.fastq.gz
* 7bc88c1940a5209dc62507a958749317  14-11A_backup_ACAGTG_L005_R1_002.fastq.gz
* db8bc5174d50dfae4f1f069a44093276  14-11A_backup_ACAGTG_L005_R2_001.fastq.gz
* 808c5168948e3a87659cc0ee81d33be6  14-11A_backup_ACAGTG_L005_R2_002.fastq.gz
* 5f6f0bd040abe89f9811ed4697fa9d91  14-12A_CCGTCC_L005_R1_001.fastq.gz
* a7ffb6849698b148e77541e6850e6104  14-12A_CCGTCC_L005_R1_002.fastq.gz
* 6d6aad01873ceec54645a957da3c28c3  14-12A_CCGTCC_L005_R2_001.fastq.gz
* 11d238e0e600fffc0eadc2b25ee33d99  14-12A_CCGTCC_L005_R2_002.fastq.gz
* 2d6fac3b9888797d48cc63880c847a20  14-8A_backup_ATGTCA_L005_R1_001.fastq.gz
* a88abcf4ceb9b3cf7431d4a3fd903c25  14-8A_backup_ATGTCA_L005_R2_001.fastq.gz
* 3b5132018aa8fa3c8753c59b6b935c44  15-3A_GTGAAA_L005_R1_001.fastq.gz
* f8cf232ca49e87c9814e450b5c20190e  15-3A_GTGAAA_L005_R2_001.fastq.gz
* 8194f1e05619f3ccbba0638b77697166  15-6A_CTTGTA_L005_R1_001.fastq.gz
* 5fb997c8d1ee9fc4e2c82e3f87959593  15-6A_CTTGTA_L005_R1_002.fastq.gz
* 5213e6b60b4c31cdee9e2d000b166e17  15-6A_CTTGTA_L005_R2_001.fastq.gz
* c9cd83e735b83e8d6eb43eb5453dc3d1  15-6A_CTTGTA_L005_R2_002.fastq.gz


##### Server Checksum
```md5sum *.gz > Server_Taiwan_data_checksum.md5```
f75d8e3fd1c9c940a823cc76757dae47  12-14A_AGTCAA_L005_R1_001.fastq.gz
670c45943a846b0195521ba46f77b37c  12-14A_AGTCAA_L005_R1_002.fastq.gz
567d0e62d6a082053e13728e10e7da7b  12-14A_AGTCAA_L005_R2_001.fastq.gz
c73f0d51a0bfbba902581d147aad7753  12-14A_AGTCAA_L005_R2_002.fastq.gz
9db1faa0bcfc6e50042e9c23f6d83805  12-2B_TGACCA_L005_R1_001.fastq.gz
e3bcadd245c972a155f163f205861db2  12-2B_TGACCA_L005_R2_001.fastq.gz
617b03dad7764e36cfd0cf357dc6a630  12-7A_CGATGT_L005_R1_001.fastq.gz
d15095ace9a0a4321f600e5c963fa7e2  12-7A_CGATGT_L005_R2_001.fastq.gz
df4b02a369ec6a53451ffbcf89cd91b0  13-10A_AGTTCC_L005_R1_001.fastq.gz
deff5731b4220367036c10b40b36d772  13-10A_AGTTCC_L005_R2_001.fastq.gz
1f632536465d974108d2c72757964b5b  13-13A_GTCCGC_L005_R1_001.fastq.gz
ba3d5b2fba1f5322304abfe718644215  13-13A_GTCCGC_L005_R1_002.fastq.gz
ce5bf412e68d35032149fe573a471a00  13-13A_GTCCGC_L005_R2_001.fastq.gz
0bd87606b7af08264d8a90bdf7bb7779  13-13A_GTCCGC_L005_R2_002.fastq.gz
d9d9a4fd788fc19dbd00850993179591  13-16A_GCCAAT_L005_R1_001.fastq.gz
ada2d4073b4f516aa19575dadc97e12b  13-16A_GCCAAT_L005_R2_001.fastq.gz
6bdd9ec3a7162d1f6b43bd0a8c614f6d  13-9A_backup_CAGATC_L005_R1_001.fastq.gz
3f54b3039ef0205c0b11b69a31234c2d  13-9A_backup_CAGATC_L005_R2_001.fastq.gz
94d2502f93133ecebd2fb259778a13aa  14-11A_backup_ACAGTG_L005_R1_001.fastq.gz
7bc88c1940a5209dc62507a958749317  14-11A_backup_ACAGTG_L005_R1_002.fastq.gz
db8bc5174d50dfae4f1f069a44093276  14-11A_backup_ACAGTG_L005_R2_001.fastq.gz
808c5168948e3a87659cc0ee81d33be6  14-11A_backup_ACAGTG_L005_R2_002.fastq.gz
5f6f0bd040abe89f9811ed4697fa9d91  14-12A_CCGTCC_L005_R1_001.fastq.gz
a7ffb6849698b148e77541e6850e6104  14-12A_CCGTCC_L005_R1_002.fastq.gz
6d6aad01873ceec54645a957da3c28c3  14-12A_CCGTCC_L005_R2_001.fastq.gz
11d238e0e600fffc0eadc2b25ee33d99  14-12A_CCGTCC_L005_R2_002.fastq.gz
2d6fac3b9888797d48cc63880c847a20  14-8A_backup_ATGTCA_L005_R1_001.fastq.gz
a88abcf4ceb9b3cf7431d4a3fd903c25  14-8A_backup_ATGTCA_L005_R2_001.fastq.gz
3b5132018aa8fa3c8753c59b6b935c44  15-3A_GTGAAA_L005_R1_001.fastq.gz
f8cf232ca49e87c9814e450b5c20190e  15-3A_GTGAAA_L005_R2_001.fastq.gz
8194f1e05619f3ccbba0638b77697166  15-6A_CTTGTA_L005_R1_001.fastq.gz
5fb997c8d1ee9fc4e2c82e3f87959593  15-6A_CTTGTA_L005_R1_002.fastq.gz
5213e6b60b4c31cdee9e2d000b166e17  15-6A_CTTGTA_L005_R2_001.fastq.gz
c9cd83e735b83e8d6eb43eb5453dc3d1  15-6A_CTTGTA_L005_R2_002.fastq.gz

#### Check Read Counts based on header
```zgrep -c "@HWUSI" *.fastq.gz```
12-14A_AGTCAA_L005_R1_001.fastq.gz:4000000
12-14A_AGTCAA_L005_R1_002.fastq.gz:153808
12-14A_AGTCAA_L005_R2_001.fastq.gz:4000000
12-14A_AGTCAA_L005_R2_002.fastq.gz:153808
12-2B_TGACCA_L005_R1_001.fastq.gz:3257535
12-2B_TGACCA_L005_R2_001.fastq.gz:3257535
12-7A_CGATGT_L005_R1_001.fastq.gz:3492526
12-7A_CGATGT_L005_R2_001.fastq.gz:3492526
13-10A_AGTTCC_L005_R1_001.fastq.gz:3246564
13-10A_AGTTCC_L005_R2_001.fastq.gz:3246564
13-13A_GTCCGC_L005_R1_001.fastq.gz:4000000
13-13A_GTCCGC_L005_R1_002.fastq.gz:133291
13-13A_GTCCGC_L005_R2_001.fastq.gz:4000000
13-13A_GTCCGC_L005_R2_002.fastq.gz:133291
13-16A_GCCAAT_L005_R1_001.fastq.gz:161
13-16A_GCCAAT_L005_R2_001.fastq.gz:161
13-9A_backup_CAGATC_L005_R1_001.fastq.gz:3866849
13-9A_backup_CAGATC_L005_R2_001.fastq.gz:3866849
14-11A_backup_ACAGTG_L005_R1_001.fastq.gz:4000000
14-11A_backup_ACAGTG_L005_R1_002.fastq.gz:3720664
14-11A_backup_ACAGTG_L005_R2_001.fastq.gz:4000000
14-11A_backup_ACAGTG_L005_R2_002.fastq.gz:3720664
14-12A_CCGTCC_L005_R1_001.fastq.gz:4000000
14-12A_CCGTCC_L005_R1_002.fastq.gz:186133
14-12A_CCGTCC_L005_R2_001.fastq.gz:4000000
14-12A_CCGTCC_L005_R2_002.fastq.gz:186133
14-8A_backup_ATGTCA_L005_R1_001.fastq.gz:3571099
14-8A_backup_ATGTCA_L005_R2_001.fastq.gz:3571099
15-3A_GTGAAA_L005_R1_001.fastq.gz:3588814
15-3A_GTGAAA_L005_R2_001.fastq.gz:3588814
15-6A_CTTGTA_L005_R1_001.fastq.gz:4000000
15-6A_CTTGTA_L005_R1_002.fastq.gz:757944
15-6A_CTTGTA_L005_R2_001.fastq.gz:4000000
15-6A_CTTGTA_L005_R2_002.fastq.gz:757944

# Compile Data into 2 files per sample
* cat R1_001 and R1_002 files prior to cleaning

```cat 12-14A_AGTCAA_L005_R1_001.fastq.gz 12-14A_AGTCAA_L005_R1_002.fastq.gz > raw/12-14_R1.fastq.gz```
```cat 12-14A_AGTCAA_L005_R2_001.fastq.gz 12-14A_AGTCAA_L005_R2_002.fastq.gz > raw/12-14_R2.fastq.gz```
```mv 12-2B_TGACCA_L005_R1_001.fastq.gz  raw/12-2_R1.fastq.gz```
```mv 12-2B_TGACCA_L005_R2_001.fastq.gz  raw/12-2_R2.fastq.gz```
```mv 12-7A_CGATGT_L005_R1_001.fastq.gz  raw/12-7_R1.fastq.gz```
```mv 12-7A_CGATGT_L005_R2_001.fastq.gz  raw/12-7_R2.fastq.gz```
```mv 13-10A_AGTTCC_L005_R1_001.fastq.gz raw/13-10_R1.fastq.gz```
```mv 13-10A_AGTTCC_L005_R2_001.fastq.gz raw/13-10_R2.fastq.gz```
```cat 13-13A_GTCCGC_L005_R1_001.fastq.gz 13-13A_GTCCGC_L005_R1_002.fastq.gz > raw/13-13_R1.fastq.gz```
```cat 13-13A_GTCCGC_L005_R2_001.fastq.gz 13-13A_GTCCGC_L005_R2_002.fastq.gz > raw/13-13_R2.fastq.gz```
```mv 13-16A_GCCAAT_L005_R1_001.fastq.gz raw/13-16_R1.fastq.gz```
```mv 13-16A_GCCAAT_L005_R2_001.fastq.gz raw/13-16_R2.fastq.gz```
```mv 13-9A_backup_CAGATC_L005_R1_001.fastq.gz raw/13-9_R1.fastq.gz```
```mv 13-9A_backup_CAGATC_L005_R2_001.fastq.gz raw/13-9_R2.fastq.gz```
```cat 14-11A_backup_ACAGTG_L005_R1_001.fastq.gz 14-11A_backup_ACAGTG_L005_R1_002.fastq.gz > raw/14-11_R1.fastq.gz```
```cat 14-11A_backup_ACAGTG_L005_R2_001.fastq.gz 14-11A_backup_ACAGTG_L005_R2_002.fastq.gz > raw/14-11_R2.fastq.gz```
```cat 14-12A_CCGTCC_L005_R1_001.fastq.gz 14-12A_CCGTCC_L005_R1_002.fastq.gz > raw/14-12_R1.fastq.gz```
```cat 14-12A_CCGTCC_L005_R2_001.fastq.gz 14-12A_CCGTCC_L005_R2_002.fastq.gz > raw/14-12_R2.fastq.gz```
```mv 14-8A_backup_ATGTCA_L005_R1_001.fastq.gz raw/14-8_R1.fastq.gz```
```mv 14-8A_backup_ATGTCA_L005_R2_001.fastq.gz raw/14-8_R2.fastq.gz```
```mv 15-3A_GTGAAA_L005_R1_001.fastq.gz raw/15-3_R1.fastq.gz```
```mv 15-3A_GTGAAA_L005_R2_001.fastq.gz raw/15-3_R2.fastq.gz```
```cat 15-6A_CTTGTA_L005_R1_001.fastq.gz 15-6A_CTTGTA_L005_R1_002.fastq.gz > raw/15-6_R1.fastq.gz```
```cat 15-6A_CTTGTA_L005_R2_001.fastq.gz 15-6A_CTTGTA_L005_R2_002.fastq.gz > raw/15-6_R2.fastq.gz```

## Compare number of sequences between original and concatenated files by header counts
cd raw
```zgrep -c "@HWUSI" *.fastq.gz```
12-14_R1.fastq.gz:4153808
12-14_R2.fastq.gz:4153808
12-2_R1.fastq.gz:3257535
12-2_R2.fastq.gz:3257535
12-7_R1.fastq.gz:3492526
12-7_R2.fastq.gz:3492526
13-10_R1.fastq.gz:3246564
13-10_R2.fastq.gz:3246564
13-13_R1.fastq.gz:4133291
13-13_R2.fastq.gz:4133291
13-16_R1.fastq.gz:161
13-16_R2.fastq.gz:161
13-9_R1.fastq.gz:3866849
13-9_R2.fastq.gz:3866849
14-11_R1.fastq.gz:7720664
14-11_R2.fastq.gz:7720664
14-12_R1.fastq.gz:4186133
14-12_R2.fastq.gz:4186133
14-8_R1.fastq.gz:3571099
14-8_R2.fastq.gz:3571099
15-3_R1.fastq.gz:3588814
15-3_R2.fastq.gz:3588814
15-6_R1.fastq.gz:4757944
15-6_R2.fastq.gz:4757944



# QC raw files

`mkdir fastqc_raw`

`cd fastqc_raw`

`fastqc /home/hputnam/Taiwan_Pacuta_Adult_GCC/raw/*.fastq.gz  -o /home/hputnam/Taiwan_Pacuta_Adult_GCC/fastqc_raw`

## Run multicq from raw qc folder to combine results from all files
http://multiqc.info/

```multiqc .```

## Examine FASTQC Results of raw files
```scp -P 2292 hputnam@kitt.uri.edu:/home/hputnam/Taiwan_Pacuta_Adult_GCC/fastqc_raw/multiqc* ~/MyProjects/Taiwan_Pacuta_adult_GCC/BioInf/```


* 13-16 failed and only has <200 sequences. This library will not be used in further analyses
* Note 14-11 has ~ 2x more than any other library

## Clean files
mkdir cleaned

```
sh -c 'for file in "12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "13-16" "14-11" "14-12" "14-8" "15-3" "15-6"
do
fastp \
--in1 /home/hputnam/Taiwan_Pacuta_Adult_GCC/raw/${file}_R1.fastq.gz \
--in2 /home/hputnam/Taiwan_Pacuta_Adult_GCC/raw/${file}_R2.fastq.gz \
--out1 /home/hputnam/Taiwan_Pacuta_Adult_GCC/cleaned/${file}_R1_clean.fastq.gz \
--out2 /home/hputnam/Taiwan_Pacuta_Adult_GCC/cleaned/${file}_R2_clean.fastq.gz \
--failed_out /home/hputnam/Taiwan_Pacuta_Adult_GCC/cleaned/${file}_failed.txt \
--qualified_quality_phred 20 \
--unqualified_percent_limit 10 \
--length_required 25 detect_adapter_for_pe \
--cut_right cut_right_window_size 5 cut_right_mean_quality 20
done'
```


## Check quality of Cleaned datafiles
mkdir fastqc_cleaned

`fastqc /home/hputnam/Taiwan_Pacuta_Adult_GCC/cleaned/*.fastq.gz  -o /home/hputnam/Taiwan_Pacuta_Adult_GCC/fastqc_cleaned`


## Run multicq from raw qc folder to combine results from all files
http://multiqc.info/

```multiqc .```

## Examine FASTQC Results of clean files
```scp -P 2292 hputnam@kitt.uri.edu:/home/hputnam/Taiwan_Pacuta_Adult_GCC/fastqc_cleaned/multiqc* ~/MyProjects/Taiwan_Pacuta_adult_GCC/BioInf/```



# Count Cleaned Reads
cd cleaned

```zgrep -c "@HWUSI" *.fastq.gz```
12-14_R1_clean.fastq.gz:3834838
12-14_R2_clean.fastq.gz:3834838
12-2_R1_clean.fastq.gz:3011826
12-2_R2_clean.fastq.gz:3011826
12-7_R1_clean.fastq.gz:3265368
12-7_R2_clean.fastq.gz:3265368
13-10_R1_clean.fastq.gz:3019672
13-10_R2_clean.fastq.gz:3019672
13-13_R1_clean.fastq.gz:3843199
13-13_R2_clean.fastq.gz:3843199
13-16_R1_clean.fastq.gz:142
13-16_R2_clean.fastq.gz:142
13-9_R1_clean.fastq.gz:3585383
13-9_R2_clean.fastq.gz:3585383
14-11_R1_clean.fastq.gz:7087369
14-11_R2_clean.fastq.gz:7087369
14-12_R1_clean.fastq.gz:3787151
14-12_R2_clean.fastq.gz:3787151
14-8_R1_clean.fastq.gz:3272221
14-8_R2_clean.fastq.gz:3272221
15-3_R1_clean.fastq.gz:3324452
15-3_R2_clean.fastq.gz:3324452
15-6_R1_clean.fastq.gz:4414622
15-6_R2_clean.fastq.gz:4414622


# Align Reads to Reference Genome
*HISAT2 is a fast and sensitive alignment program for mapping next-generation DNA and RNA sequencing reads to a reference genome.*

## Index the reference genome

Index the reference genome in the reference directory.

++HISAT2-build Alignment Arguments Used++:  
- <reference_in> - name of reference files  
- <gt2_base> -  basename of index files to write  
- -f -  reference file is a FASTA file

```
hisat2-build Pocillopora_acuta_genome_v1.fasta Pact_ref

wget http://symbs.reefgenomics.org/download/SymbC1.Genome.Scaffolds.fasta.gz
gunzip SymbC1.Genome.Scaffolds.fasta.gz

hisat2-build SymbC1.Genome.Scaffolds.fasta SymC1_ref
```


## Pact Mapping
mkdir Pact_hisat
cd Pact_hisat
`
sh -c 'for i in "12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"
do
hisat2 -p 8 --dta -q -x /home/hputnam/Meth_Compare/RiboDep_RNASeq/ref/Pact_ref \
-1 /home/hputnam/Taiwan_Pacuta_Adult_GCC/cleaned/${i}_R1_clean.fastq.gz \
-2 /home/hputnam/Taiwan_Pacuta_Adult_GCC/cleaned/${i}_R2_clean.fastq.gz -S ${i}.sam 
done'
`

## Convert and sort Sam to BAM

`
sh -c 'for i in "12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"
do
samtools sort -@ 8 -o ${i}_Pact.bam ${i}.sam
done'
`


## Remove Sam
`
rm *.sam

`

## C1 Mapping
mkdir C1_hisat
cd C1_hisat
`
sh -c 'for i in "12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"
do
hisat2 -p 8 --dta -q -x /home/hputnam/Meth_Compare/RiboDep_RNASeq/ref/SymC1_ref \
-1 /home/hputnam/Taiwan_Pacuta_Adult_GCC/cleaned/${i}_R1_clean.fastq.gz \
-2 /home/hputnam/Taiwan_Pacuta_Adult_GCC/cleaned/${i}_R2_clean.fastq.gz -S ${i}_C1.sam 
done'
`

## Convert and sort Sam to BAM

`
sh -c 'for i in "12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"
do
samtools sort -@ 8 -o ${i}_C1.bam ${i}_C1.sam
done'
`

## Remove Sam
`
rm *.sam

# Assemble aligned reads and quantify transcripts 
*StringTie is a fast and highly efficient assembler of RNA-Seq alignments into potential transcripts.*

- Reference-guided assembly with novel transcript discovery
- Merge output GTF files and assess the assembly performance
- Merged-GTF guided assembly without novel transcript discovery
- Compilation of GTF-files into gene and transcript count matrices

For our assembly, we will have to run StringTie twice. The first run will be a reference guided assembly that will allow for discovery of novel transcripts (by leaving out the -e option). Then we will merge the output GTF files and examine the sensitivity of our assembly. We will use the merged-GTF from our first assembly to guide our second StringTie run (including the ```-e``` option). This second run is necessary in order to compile our GTF files into gene and transcript count matrices that we will need for our differential expression analysis, because the StringTie script that compiles the GTF files ```prepDE.py``` only runs if the ```-e``` option is "on" during the previous assembly.

#### Reference-guided assembly with novel transcript discovery

++StringTie Arguments Used++:  
- -p - Specify number of processers
- -G - Specify annotation file
- -o - Name of output file

mkdir Pact_stie

#Pact 
mkdir Pact_stie
cd Pact_stie

`
sh -c 'for i in "12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"
do
stringtie /home/hputnam/Taiwan_Pacuta_Adult_GCC/Pact_hisat/${i}_Pact.bam -p 8 -G /home/hputnam/Meth_Compare/RiboDep_RNASeq/ref/Pact.GFFannotation.gff -o ${i}_Pact.gtf 
done'
`


#Sym C1
mkdir C1_stie
SymbC1.Gene_Models.GFF3

"12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"

`
sh -c 'for i in "12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"
do
stringtie /home/hputnam/Taiwan_Pacuta_Adult_GCC/C1_hisat/${i}_C1.bam -p 8 -G /home/hputnam/Meth_Compare/RiboDep_RNASeq/ref/SymbC1.Gene_Models.GFF3 -o ${i}_C1.gtf 
done'
`

#### Assess the performance of the assembly

*Gffcompare is a tool that can compare, merge, annotate and estimate accuracy of GFF/GTF files when compared with a reference annotation*

Using the StringTie merge mode, merge the assembly-generated GTF files to assess how well the predicted transcripts track to the reference annotation file. This step requires the TXT file,  (mergelist.txt). This file lists all of the file names to be merged. *Make sure ```mergelist.txt``` is in the StringTie program directory*.

++StringTie Arguments Used++:  
- --merge - Distinct from the assembly usage mode used above, in the merge mode, StringTie takes as input a list of GTF/GFF files and merges/assembles these transcripts into a non-redundant set of transcripts.
- -p - Specify number of processers
- -G - Specify reference annotation file. With this option, StringTie assembles the transfrags from the input GTF files with the reference sequences
- -o - Name of output file
- <mergelist.txt> - File listing all filenames to be merged. Include full path.


#Pact 
`
nano Pact_mergelist.txt

12-14_Pact.gtf 
12-2_Pact.gtf
12-7_Pact.gtf
13-10_Pact.gtf
13-13_Pact.gtf
13-9_Pact.gtf
14-11_Pact.gtf
14-12_Pact.gtf
14-8_Pact.gtf
15-3_Pact.gtf
15-6_Pact.gtf
`

`
stringtie --merge -p 8 -G /home/hputnam/Meth_Compare/RiboDep_RNASeq/ref/Pact.GFFannotation.gff -o Pact_stringtie_merged.gtf Pact_mergelist.txt
`

#C1 
`
nano C1_mergelist.txt

12-14_C1.gtf 
12-2_C1.gtf 
12-7_C1.gtf 
13-10_C1.gtf 
13-13_C1.gtf 
13-9_C1.gtf 
14-11_C1.gtf 
14-12_C1.gtf 
14-8_C1.gtf 
15-3_C1.gtf 
15-6_C1.gtf 
`

`
stringtie --merge -p 8 -G /home/hputnam/Meth_Compare/RiboDep_RNASeq/ref/SymbC1.Gene_Models.GFF3 -o C1_stringtie_merged.gtf C1_mergelist.txt
`

Now we can use the program gffcompare to compare the merged GTF to our reference genome.

++Gffcompare Arguments Used++:  
- -r - Specify reference annotation file
- -G - Compare all the transcripts in our input file ```stringtie_merged.gtf```
- -o - Prefix of all output files

#Pact
`
gffcompare -r /home/hputnam/Meth_Compare/RiboDep_RNASeq/ref/Pact.GFFannotation.gff -G -o Pact_merged Pact_stringtie_merged.gtf
`

#C1
`
gffcompare -r /home/hputnam/Meth_Compare/RiboDep_RNASeq/ref/SymbC1.Gene_Models.GFF3 -G -o C1_merged C1_stringtie_merged.gtf
`

Some of the output files you will see are... 
- merged.stats
- merged.tracking
- merged.annotated.gtf
- merged.stringtie_merged.gtf.refmap
- merged.loci
- merged.stringtie_merged.gtf.tmap

We are most interested in the files ```merged.annotated.gtf``` and ```merged.stats```. The file ```merged.annotated.gtf``` tells you how well the predicted transcripts track to the reference annotation file and the file ```merged.stats``` file shows the sensitivity and precision statistics and total number for different features (genes, exons, transcripts).  

#### Merged-GTF guided assembly without novel transcript discovery

Now run StringTie again, but this time the assembly guided by the merged GTF file ```stringtie_merged.gtf```. Here, StringTie skips over novel sequences because we include the ```-e``` option. This is okay now because we identified novel transcripts in the previous StringTie run. The ```-e``` option is the important part of this second run because the ```prepDE.py``` script used in the next step to compile the output GTFs only works if the ```-e``` option is included here.

++StringTie Arguments Used++:  
- -p - Specify number of processers
- -e - Limit the estimation and output of transcripts to only those that match the reference (in this case, our merged GTF)
- -G - Specify annotation file
- -o - Name of output file

#Pact
`
sh -c 'for i in "12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"
do
stringtie /home/hputnam/Taiwan_Pacuta_Adult_GCC/Pact_hisat/${i}_Pact.bam -p 8 -e -G /home/hputnam/Meth_Compare/RiboDep_RNASeq/ref/Pact.GFFannotation.gff -o ${i}_Pact_merged2.gtf 
done'
`

#C1
`
sh -c 'for i in "12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"
do
stringtie /home/hputnam/Taiwan_Pacuta_Adult_GCC/C1_hisat/${i}_C1.bam -p 8 -e -G /home/hputnam/Meth_Compare/RiboDep_RNASeq/ref/SymbC1.Gene_Models.GFF3 -o ${i}_C1_merged2.gtf 
done'
`

#### Compilation of GTF-files into gene and transcript count matrices

The StringTie program includes a script, ```prepDE.py``` that compiles your assembly files into gene and transcript count matrices. This script requires as input the list of sample names and their full file paths, (sample_list.txt).

. Run ```prepDE.py``` to merge assembled files together into a DESeq2-friendly version.

++StringTie prepDE.py Arguments Used++:  
- -i - Specify that input is a TXT file
- -g - Require output gene count file, default name is ```gene_count_matrix.csv```
- -t - Require output transcript count gene count file, default name is ```transcript_count_matrix.csv```


# Pact

nano Pact_sample_list.txt

12-14	12-14_Pact_merged2.gtf 
12-2	12-2_Pact_merged2.gtf
12-7 	12-7_Pact_merged2.gtf
13-10 	13-10_Pact_merged2.gtf
13-13	13-13_Pact_merged2.gtf
13-9	13-9_Pact_merged2.gtf
14-11	14-11_Pact_merged2.gtf
14-12	14-12_Pact_merged2.gtf
14-8	14-8_Pact_merged2.gtf
15-3	15-3_Pact_merged2.gtf
15-6	15-6_Pact_merged2.gtf

`
prepDE.py -i Pact_sample_list.txt -g Pact_gene_count_matrix.csv -t Pact_transcript_count_matrix.csv
`

# C1

nano C1_sample_list.txt

12-14	12-14_C1_merged2.gtf 
12-2	12-2_C1_merged2.gtf
12-7 	12-7_C1_merged2.gtf
13-10 	13-10_C1_merged2.gtf
13-13	13-13_C1_merged2.gtf
13-9	13-9_C1_merged2.gtf
14-11	14-11_C1_merged2.gtf
14-12	14-12_C1_merged2.gtf
14-8	14-8_C1_merged2.gtf
15-3	15-3_C1_merged2.gtf
15-6	15-6_C1_merged2.gtf

`
prepDE.py -i C1_sample_list.txt -g C1_gene_count_matrix.csv -t C1_transcript_count_matrix.csv
`


#download counts matrices
scp -r -P 2292  hputnam@kitt.uri.edu:/home/hputnam/Taiwan_Pacuta_Adult_GCC/Pact_stie/Pact_*_count_matrix.csv /Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Data

scp -r -P 2292  hputnam@kitt.uri.edu:/home/hputnam/Taiwan_Pacuta_Adult_GCC/C1_stie/C1_*_count_matrix.csv /Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Data



# Run Differential Expression Analysis

* See R script for DEG, GOEnrichment










