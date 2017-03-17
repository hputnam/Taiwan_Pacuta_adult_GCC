# Analysis for 
Data uploaded and analyzed on Poire 
ssh hputnam@galaxy.geodata.hawaii.edu

# Upload data to server
scp -r /Volumes/NGS_DATA/Taiwan Pdam/Adult_Summer_2010 hputnam@galaxy.geodata.hawaii.edu:/home/hputnam/Pdam_Taiwan_2010/Adult

# Used the following adapter files to make barcodes file
>TruSeq_universal_F
AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT
> Genomic_DNA_oligonucleotide_sequences_Adapters
AGATCGGAAGAGCACACGTCTGAACTCCAGTCA
> Genomic_DNA_oligonucleotide_sequences_Adapters_Read2
AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT
> Genomic_DNA_Sequencing_Primer
ACACTCTTTCCCTACACGACGCTCTTCCGATCT
>TruSeq_idx_Adapter_AR001
GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR002
GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGATGTATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR003
GATCGGAAGAGCACACGTCTGAACTCCAGTCACTTAGGCATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR004
GATCGGAAGAGCACACGTCTGAACTCCAGTCACTGACCAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR005
GATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR006
GATCGGAAGAGCACACGTCTGAACTCCAGTCACGCCAATATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR007
GATCGGAAGAGCACACGTCTGAACTCCAGTCACCAGATCATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR008
GATCGGAAGAGCACACGTCTGAACTCCAGTCACACTTGAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR009
GATCGGAAGAGCACACGTCTGAACTCCAGTCACGATCAGATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR010
GATCGGAAGAGCACACGTCTGAACTCCAGTCACTAGCTTATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR011
GATCGGAAGAGCACACGTCTGAACTCCAGTCACGGCTACATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR012
GATCGGAAGAGCACACGTCTGAACTCCAGTCACCTTGTAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR013
GATCGGAAGAGCACACGTCTGAACTCCAGTCAAGTCAAAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR014
GATCGGAAGAGCACACGTCTGAACTCCAGTCAAGTTCCAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR015
GATCGGAAGAGCACACGTCTGAACTCCAGTCAATGTCAAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR016
GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGTCCAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR018
GATCGGAAGAGCACACGTCTGAACTCCAGTCAGTCCGCAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR019
GATCGGAAGAGCACACGTCTGAACTCCAGTCAGTGAAAAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR020
GATCGGAAGAGCACACGTCTGAACTCCAGTCAGTGGCCAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR021
GATCGGAAGAGCACACGTCTGAACTCCAGTCAGTTTCGAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR022
GATCGGAAGAGCACACGTCTGAACTCCAGTCACGTACGAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR023
GATCGGAAGAGCACACGTCTGAACTCCAGTCAGAGTGGAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR025
GATCGGAAGAGCACACGTCTGAACTCCAGTCAACTGATAATCTCGTATGCCGTCTTCTGCTTG
>TruSeq_idx_Adapter_AR027
GATCGGAAGAGCACACGTCTGAACTCCAGTCAATTCCTAATCTCGTATGCCGTCTTCTGCTTG

# Count RAW Reads
```zgrep -c "@HW" *.fastq.gz```
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


# Cat run files (1 and 2) AND Count File Reads or rename if single files
```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/12-14A_AGTCAA_L005_R1_001.fastq.gz /home/hputnam/Pdam_Taiwan_2010/Adult/Data/12-14A_AGTCAA_L005_R1_002.fastq.gz > 12-14A_R1.fastq.gz```

```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/12-14A_AGTCAA_L005_R2_001.fastq.gz /home/hputnam/Pdam_Taiwan_2010/Adult/Data/12-14A_AGTCAA_L005_R2_002.fastq.gz > 12-14A_R2.fastq.gz```

```mv 12-2B_TGACCA_L005_R1_001.fastq.gz 12-2B_R1.fastq.gz```
```mv 12-2B_TGACCA_L005_R2_001.fastq.gz 12-2B_R2.fastq.gz```

```mv 12-7A_CGATGT_L005_R1_001.fastq.gz 12-7A_R1.fastq.gz```
```mv 12-7A_CGATGT_L005_R2_001.fastq.gz 12-7A_R2.fastq.gz```

```mv 13-10A_AGTTCC_L005_R1_001.fastq.gz 13-10A_R1.fastq.gz```
```mv 13-10A_AGTTCC_L005_R2_001.fastq.gz 13-10A_R2.fastq.gz```

```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-13A_GTCCGC_L005_R1_001.fastq.gz /home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-13A_GTCCGC_L005_R1_002.fastq.gz > 13-13A_R1.fastq.gz```

```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-13A_GTCCGC_L005_R2_001.fastq.gz /home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-13A_GTCCGC_L005_R2_002.fastq.gz > 13-13A_R2.fastq.gz```

```mv 13-16A_GCCAAT_L005_R1_001.fastq.gz 13-16A_R1.fastq.gz```
```mv 13-16A_GCCAAT_L005_R2_001.fastq.gz 13-16A_R2.fastq.gz```

```mv 13-9A_backup_CAGATC_L005_R1_001.fastq.gz 13-9A_R1.fastq.gz```
```mv 13-9A_backup_CAGATC_L005_R2_001.fastq.gz 13-9A_R2.fastq.gz```

```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-11A_backup_ACAGTG_L005_R1_001.fastq.gz /home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-11A_backup_ACAGTG_L005_R1_002.fastq.gz > 14-11A_R1.fastq.gz```

```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-11A_backup_ACAGTG_L005_R2_001.fastq.gz /home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-11A_backup_ACAGTG_L005_R2_002.fastq.gz > 14-11A_R2.fastq.gz```

```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-12A_CCGTCC_L005_R1_001.fastq.gz /home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-12A_CCGTCC_L005_R1_002.fastq.gz > 14-12A_R1.fastq.gz```

```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-12A_CCGTCC_L005_R2_001.fastq.gz /home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-12A_CCGTCC_L005_R2_002.fastq.gz > 14-12A_R2.fastq.gz```

```mv 14-8A_backup_ATGTCA_L005_R1_001.fastq.gz 14-8A_R1.fastq.gz```
```mv 14-8A_backup_ATGTCA_L005_R2_001.fastq.gz 14-8A_R2.fastq.gz```

```mv 15-3A_GTGAAA_L005_R1_001.fastq.gz 15-3A_R1.fastq.gz```
```mv 15-3A_GTGAAA_L005_R2_001.fastq.gz 15-3A_R2.fastq.gz```

```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/15-6A_CTTGTA_L005_R1_001.fastq.gz /home/hputnam/Pdam_Taiwan_2010/Adult/Data/15-6A_CTTGTA_L005_R1_002.fastq.gz > 15-6A_R1.fastq.gz```

```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/15-6A_CTTGTA_L005_R2_001.fastq.gz /home/hputnam/Pdam_Taiwan_2010/Adult/Data/15-6A_CTTGTA_L005_R2_002.fastq.gz > 15-6A_R2.fastq.gz```


```zgrep -c "@HW" *.fastq.gz```
12-14A_R1.fastq.gz:4153808
12-14A_R2.fastq.gz:4153808
12-2B_R1.fastq.gz:3257535
12-2B_R2.fastq.gz:3257535
12-7A_R1.fastq.gz:3492526
12-7A_R2.fastq.gz:3492526
13-10A_R1.fastq.gz:3246564
13-10A_R2.fastq.gz:3246564
13-13A_R1.fastq.gz:4133291
13-13A_R2.fastq.gz:4133291
13-16A_R1.fastq.gz:161
13-16A_R2.fastq.gz:161
13-9A_R1.fastq.gz:3866849
13-9A_R2.fastq.gz:3866849
14-11A_R1.fastq.gz:7720664
14-11A_R2.fastq.gz:7720664
14-12A_R1.fastq.gz:4186133
14-12A_R2.fastq.gz:4186133
14-8A_R1.fastq.gz:3571099
14-8A_R2.fastq.gz:3571099
15-3A_R1.fastq.gz:3588814
15-3A_R2.fastq.gz:3588814
15-6A_R1.fastq.gz:4757944
15-6A_R2.fastq.gz:4757944

#Run FASTQC to examine data quality
```/home/hputnam/programs/FastQC/fastqc /home/hputnam/Pdam_Taiwan_2010/Adult/Data/*fastq.gz -o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Raw_QC_Files```

#Examine FASTQC Results of raw files
```scp -r hputnam@galaxy.geodata.hawaii.edu:/home/hputnam/Mcap_Spawn/Data/Raw_QC_Files /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Raw_QC_Files```


#Run multicq from raw qc folder to combine results from all files
http://multiqc.info/

```multiqc .```


#Trim Adapters and poor quality
```mkdir /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data```

### Used FastqMcf fastq-mcf sequence quality filter, clipping and processor to trim adapters.
https://expressionanalysis.github.io/ea-utils/
https://github.com/ExpressionAnalysis/ea-utils
-o = output
-l = minimum remaining sequence length (=150)
-q = quality threshold causing base removal (=20)
-w = window size for quality trimming (=5)
-x = 'N' bad read percentage causing cycle removal (=10)
-u = Force disable/enable Illumina PF filtering default = auto
-P = Phred-scale default = auto

#FastqMcf 

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/12-14A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/12-14A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/12-14A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/12-14A_R2_cleaned.fastq &>12-14A.log```

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/12-2B_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/12-2B_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/12-2B_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/12-2B_R2_cleaned.fastq &>12-2B.log```

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/12-7A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/12-7A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/12-7A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/12-7A_R2_cleaned.fastq &>12-7A.log```

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-10A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-10A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/13-10A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/13-10A_R2_cleaned.fastq &>13-10A.log```

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-13A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-13A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/13-13A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/13-13A_R2_cleaned.fastq &>13-13A.log```

### Failed RUN or bad demultiplexing?
```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-16A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-16A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/13-16A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/13-16A_R2_cleaned.fastq &>13-16A.log```

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-9A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/13-9A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/13-9A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/13-9A_R2_cleaned.fastq &>13-9A.log```

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-11A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-11A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/14-11A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/14-11A_R2_cleaned.fastq &>14-11A.log```

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-12A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-12A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/14-12A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/14-12A_R2_cleaned.fastq &>14-12A.log```

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-8A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/14-8A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/14-8A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/14-8A_R2_cleaned.fastq &>14-8A.log```

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/15-3A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/15-3A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/15-3A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/15-3A_R2_cleaned.fastq &>15-3A.log```

```/home/hputnam/programs/ea-utils.1.1.2-806/fastq-mcf -l 16 -q 20 -w 5 -x 10 -u -P 33 \
/home/hputnam/Mcap_Spawn/Refs/barcodes.fa \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/15-6A_R1.fastq.gz \
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/15-6A_R2.fastq.gz \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/15-6A_R1_cleaned.fastq \
-o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/15-6A_R2_cleaned.fastq &>15-6A.log```


# Count Cleaned Reads
```grep -c "@HW" /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/*.fastq```

12-14A_R1_cleaned.fastq:4083263
12-14A_R2_cleaned.fastq:4083263
12-2B_R1_cleaned.fastq:3207281
12-2B_R2_cleaned.fastq:3207281
12-7A_R1_cleaned.fastq:3449700
12-7A_R2_cleaned.fastq:3449700
13-10A_R1_cleaned.fastq:3199817
13-10A_R2_cleaned.fastq:3199817
13-13A_R1_cleaned.fastq:4078850
13-13A_R2_cleaned.fastq:4078850
13-16A_R1_cleaned.fastq:148
13-16A_R2_cleaned.fastq:148
13-9A_R1_cleaned.fastq:3813784
13-9A_R2_cleaned.fastq:3813784
14-11A_R1_cleaned.fastq:7580651
14-11A_R2_cleaned.fastq:7580651
14-12A_R1_cleaned.fastq:4027340
14-12A_R2_cleaned.fastq:4027340
14-8A_R1_cleaned.fastq:3505685
14-8A_R2_cleaned.fastq:3505685
15-3A_R1_cleaned.fastq:3534235
15-3A_R2_cleaned.fastq:3534235
15-6A_R1_cleaned.fastq:4689430
15-6A_R2_cleaned.fastq:4689430

#Run Fastqc on cleaned files
```mkdir cleaned_QC_Files```

```/home/hputnam/programs/FastQC/fastqc /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/*fastq -o /home/hputnam/Pdam_Taiwan_2010/Adult/Data/cleaned_QC_Files```

#Examine FASTQC Results of cleaned files
```scp -r hputnam@galaxy.geodata.hawaii.edu:/home/hputnam/Pdam_Taiwan_2010/Adult/Data/cleaned_QC_Files /Volumes/NGS_DATA/Taiwan_Pdam/Adult_Summer_2010/Data/cleaned_QC_Files```


# remove prior to proceeding
# 13-16A has per base sequence content flux and only 148 seqs
# likely failed run


#Concatenate all R1 and all R2
```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/*R1_cleaned.fastq  > all_R1_clean.fastq```

```cat /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/*R2_cleaned.fastq  > all_R2_clean.fastq```

# Count Reads
```grep -c "@HW" /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/*clean.fastq```

/home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/all_R1_clean.fastq:45170036
/home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/all_R2_clean.fastq:45170036


#Run Trinity de novo assembly
```/home/hputnam/programs/trinityrnaseq-2.2.0/Trinity --seqType fq  --left /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/all_R1_clean.fastq --right /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/all_R2_clean.fastq --CPU 40 --max_memory 20G  --min_contig_length 100``` 

# Check Trinity Assembly Stats
```/usr/local/opt/trinityrnaseq/util/TrinityStats.pl /home/hputnam/Pdam_Taiwan_2010/Adult/Trinity_Out/trinity_out_dir/Trinity.fasta > /home/hputnam/Pdam_Taiwan_2010/Adult/Trinity_Out/trinity_out_dir/Trinity.Summary.txt```

#Run BSUSCO on Trinity.fasta 
* http://busco.ezlab.org/files/BUSCO_userguide.pdf

## Assessing assembly and annotation completeness with Benchmarking Universal Single-Copy Orthologs

```python /home/hputnam/programs/BUSCO_v1.22/BUSCO_v1.22.py -o Pdam_Adult_BUSCO -in /home/hputnam/Pdam_Taiwan_2010/Adult/Trinity_Out/trinity_out_dir/Trinity.fasta -l /home/hputnam/programs/BUSCO_v1.22/eukaryota -m trans```

# Assessing the Read Content of the Transcriptome Assembly

```bowtie2-build /home/hputnam/Mcap_Spawn/trinity_out_dir/Trinity.fasta /home/hputnam/Mcap_Spawn/trinity_out_dir/Trinity.fasta```

```bowtie2 -p20 --local --no-unal -x /home/hputnam/Mcap_Spawn/trinity_out_dir/Trinity.fasta -q -1 /home/hputnam/Mcap_Spawn/Data/cleaned/all_R1_clean.fastq -2 /home/hputnam/Mcap_Spawn/Data/cleaned/all_R2_clean.fastq | samtools view -Sb - | samtools sort -no - - > bowtie2.nameSorted.bam```


# Estimating Transcript Abundance with RSEM in Trinity
 
```/usr/local/opt/trinityrnaseq/util/align_and_estimate_abundance.pl --transcripts /home/hputnam/Mcap_Spawn/trinity_out_dir/Trinity.fasta --seqType fq --left /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/12-14A_R1_cleaned.fastq --right /home/hputnam/Pdam_Taiwan_2010/Adult/Data/Clean_Data/12-14A_R2_cleaned.fastq  --est_method RSEM  --trinity_mode --output_prefix 12-14A```




# Build Transcript and Gene Expression Matrices

/usr/local/opt/trinityrnaseq/util/abundance_estimates_to_matrix.pl --est_method RSEM --out_prefix isoforms_counts_matrix T4-1.isoforms.results T4-6.isoforms.results T4-8.isoforms.results T5-1.isoforms.results T5-6.isoforms.results T5-8.isoforms.results T7-1.isoforms.results T7-6.isoforms.results T7-8.isoforms.results

# Run Differential Expression Analysis

/usr/local/opt/trinityrnaseq/Analysis/DifferentialExpression/run_DE_analysis.pl --matrix /home/hputnam/Mcap_Spawn/RSEM/isoforms_counts_matrix.counts.matrix --method edgeR --samples_file /home/hputnam/Mcap_Spawn/Refs/sample_description.txt 

# Cluster DEG_fpkm
/usr/local/opt/trinityrnaseq/Analysis/DifferentialExpression/analyze_diff_expr.pl --matrix /home/hputnam/Mcap_Spawn/RSEM/isoforms_counts_matrix.TMM.fpkm.matrix -P 0.05 -C 0 --samples /home/hputnam/Mcap_Spawn/Refs/sample_description.txt 


# Cluster Expression Profiles
/usr/local/opt/trinityrnaseq/Analysis/DifferentialExpression//define_clusters_by_cutting_tree.pl \
-R  diffExpr.P0.05_C0.matrix.RData --Ptree 60

