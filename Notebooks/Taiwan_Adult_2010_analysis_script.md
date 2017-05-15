# Program List and Versions
* fastqc
* fastq-mcf
* multiqc
* hmmer-3.1
* signalp-4.1
* Trinotate-3.0.1
* tmhmm-2.0
* hmmer-3.1
* ncbi-blast-2.6.0+
* TransDecoder-3.0.1
* DESeq2
* InterProScan

# Analysis for 
Data uploaded and analyzed on Poire 
```ssh username@galaxy.geodata.hawaii.edu```

# Upload data to server
### add 12 Adult P acuta libraries
```scp -r /Volumes/NGS_DATA/Taiwan_Pdam/Adult_Summer_2010 hputnam@galaxy.geodata.hawaii.edu:/~Pdam_Taiwan_2010/Assembly_Data/RawData```

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

```md5sum *.gz > Server_Taiwan_data_checksum.md5```

##### Server Checksum
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

### add 6 larval P acuta libraries
```scp -r /Volumes/NGS_DATA/Taiwan_Pdam/Larvae_Spring_2010/*.fastq.gz hputnam@galaxy.geodata.hawaii.edu:~/Pdam_Taiwan_2010/Larvae/Larvae_Spring_2010```

#### Origin Checksum
* 30cd8b4ed64c907930287badc7efed8f  10--17_AGTCAA_L002_R1_001.fastq.gz
* 8f6bc51dd82fe63063e599a531ccd380  10--17_AGTCAA_L002_R1_002.fastq.gz
* 9db7df0e4a71a753a55bfa31985bb901  10--17_AGTCAA_L002_R2_001.fastq.gz
* 79449c35c0e46945bbd6cb622ba5d74e  10--17_AGTCAA_L002_R2_002.fastq.gz
* e0263fc7412313c44ab308468e5d01ce  10--18_AGTTCC_L002_R1_001.fastq.gz
* d04b0ffa54a4f05034a99fc0e82f207b  10--18_AGTTCC_L002_R1_002.fastq.gz
* 6a5acb23eb29efe3ae20b3523eba4ed5  10--18_AGTTCC_L002_R2_001.fastq.gz
* 78ae1fc9dadd755f61dcb6a36c2a9cc0  10--18_AGTTCC_L002_R2_002.fastq.gz
* e59adfa360ff20b7c2b8ef84a9cb34b5  10--20_ATGTCA_L002_R1_001.fastq.gz
* 840af5b9881b0d0f365898b4b331bb43  10--20_ATGTCA_L002_R1_002.fastq.gz
* 5f22fe04cd8ac1397f758d738f1f1245  10--20_ATGTCA_L002_R2_001.fastq.gz
* 86d30b0a7f0eda971d199e3eb48c288e  10--20_ATGTCA_L002_R2_002.fastq.gz
* 6303398969794661ff26f38bfb827e69  10--28_CCGTCC_L002_R1_001.fastq.gz
* bd58fd127e91b8a82e5d766d7e769093  10--28_CCGTCC_L002_R1_002.fastq.gz
* 33dcee7fa3f90d94ce976b5ba8ca41f3  10--28_CCGTCC_L002_R1_003.fastq.gz
* b3a002cdf0b21c84862dddcd8fcf05f2  10--28_CCGTCC_L002_R2_001.fastq.gz
* 20060af8a5db36587194ccc060692256  10--28_CCGTCC_L002_R2_002.fastq.gz
* c71a48b6958deffbc18010f3b9464fdf  10--28_CCGTCC_L002_R2_003.fastq.gz
* e34e1474dfdc63c959e4a39d3fcdec55  10--30_GTCCGC_L002_R1_001.fastq.gz
* 44b4ab03baa7420debf34f41b1707b35  10--30_GTCCGC_L002_R1_002.fastq.gz
* a23efd025423c6ea2d4a2ef6e83e0441  10--30_GTCCGC_L002_R2_001.fastq.gz
* 2e0035b07aec9d1983634781fcc88907  10--30_GTCCGC_L002_R2_002.fastq.gz
* e6861e70a40d958ef493368f277f2301  10--32_GTGAAA_L002_R1_001.fastq.gz
* b18e76938d2d1d82f85d573d74500a0d  10--32_GTGAAA_L002_R1_002.fastq.gz
* d7f7fabf1e7cb1089bee33215653ffb6  10--32_GTGAAA_L002_R2_001.fastq.gz
* 0cdf4f5248176c1fe22a1e8c7c8dd47e  10--32_GTGAAA_L002_R2_002.fastq.gz

##### Server Checksum
* 30cd8b4ed64c907930287badc7efed8f  10--17_AGTCAA_L002_R1_001.fastq.gz
* 8f6bc51dd82fe63063e599a531ccd380  10--17_AGTCAA_L002_R1_002.fastq.gz
* 9db7df0e4a71a753a55bfa31985bb901  10--17_AGTCAA_L002_R2_001.fastq.gz
* 79449c35c0e46945bbd6cb622ba5d74e  10--17_AGTCAA_L002_R2_002.fastq.gz
* e0263fc7412313c44ab308468e5d01ce  10--18_AGTTCC_L002_R1_001.fastq.gz
* d04b0ffa54a4f05034a99fc0e82f207b  10--18_AGTTCC_L002_R1_002.fastq.gz
* 6a5acb23eb29efe3ae20b3523eba4ed5  10--18_AGTTCC_L002_R2_001.fastq.gz
* 78ae1fc9dadd755f61dcb6a36c2a9cc0  10--18_AGTTCC_L002_R2_002.fastq.gz
* e59adfa360ff20b7c2b8ef84a9cb34b5  10--20_ATGTCA_L002_R1_001.fastq.gz
* 840af5b9881b0d0f365898b4b331bb43  10--20_ATGTCA_L002_R1_002.fastq.gz
* 5f22fe04cd8ac1397f758d738f1f1245  10--20_ATGTCA_L002_R2_001.fastq.gz
* 86d30b0a7f0eda971d199e3eb48c288e  10--20_ATGTCA_L002_R2_002.fastq.gz
* 6303398969794661ff26f38bfb827e69  10--28_CCGTCC_L002_R1_001.fastq.gz
* bd58fd127e91b8a82e5d766d7e769093  10--28_CCGTCC_L002_R1_002.fastq.gz
* 33dcee7fa3f90d94ce976b5ba8ca41f3  10--28_CCGTCC_L002_R1_003.fastq.gz
* b3a002cdf0b21c84862dddcd8fcf05f2  10--28_CCGTCC_L002_R2_001.fastq.gz
* 20060af8a5db36587194ccc060692256  10--28_CCGTCC_L002_R2_002.fastq.gz
* c71a48b6958deffbc18010f3b9464fdf  10--28_CCGTCC_L002_R2_003.fastq.gz
* e34e1474dfdc63c959e4a39d3fcdec55  10--30_GTCCGC_L002_R1_001.fastq.gz
* 44b4ab03baa7420debf34f41b1707b35  10--30_GTCCGC_L002_R1_002.fastq.gz
* a23efd025423c6ea2d4a2ef6e83e0441  10--30_GTCCGC_L002_R2_001.fastq.gz
* 2e0035b07aec9d1983634781fcc88907  10--30_GTCCGC_L002_R2_002.fastq.gz
* e6861e70a40d958ef493368f277f2301  10--32_GTGAAA_L002_R1_001.fastq.gz
* b18e76938d2d1d82f85d573d74500a0d  10--32_GTGAAA_L002_R1_002.fastq.gz
* d7f7fabf1e7cb1089bee33215653ffb6  10--32_GTGAAA_L002_R2_001.fastq.gz
* 0cdf4f5248176c1fe22a1e8c7c8dd47e  10--32_GTGAAA_L002_R2_002.fastq.gz

### add Mayfield 12 Adult P acuta libraries
https://www.ncbi.nlm.nih.gov//sra/?term=SRP033085

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C2T1S2_r1.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C2T1S2_r2.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C2T2S2_r1.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C2T2S2_r2.fastq.gz``` 

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C2T3S1_r1.fastq.gz``` 

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C2T3S1_r2.fastq.gz``` 

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C36T1S1_r1.fastq.gz``` 

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C36T1S1_r2.fastq.gz``` 

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C36T2S1_r1.fastq.gz``` 

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C36T2S1_r2.fastq.gz``` 

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C36T3S1_r1.fastq.gz``` 

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/C36T3S1_r2.fastq.gz``` 

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H2T1S2_r1.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H2T1S2_r2.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H2T2S1_r1.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H2T2S1_r2.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H2T3S2_r1.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H2T3S2_r2.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H36T1S1_r1.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H36T1S1_r2.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H36T2S1_r1.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H36T2S1_r2.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H36T3S1_r1.fastq.gz```

```wget http://symbiont.iis.sinica.edu.tw/coral_pdltte/static/doc/data/H36T3S1_r2.fastq.gz```


# Adapter File
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


# Compile Data into 2 files per sample
* cat R1_001 and R1_002 files prior to cleaning

```cat 10--17_AGTCAA_L002_R1_001.fastq.gz 10--17_AGTCAA_L002_R1_002.fastq.gz > 10-17_R1.fastq.gz```
```cat 10--17_AGTCAA_L002_R2_001.fastq.gz 10--17_AGTCAA_L002_R2_002.fastq.gz > 10-17_R2.fastq.gz```
```cat 10--18_AGTTCC_L002_R1_001.fastq.gz 10--18_AGTTCC_L002_R1_002.fastq.gz > 10-18_R1.fastq.gz```
```cat 10--18_AGTTCC_L002_R2_001.fastq.gz 10--18_AGTTCC_L002_R2_002.fastq.gz > 10-18_R2.fastq.gz```
```cat 10--20_ATGTCA_L002_R1_001.fastq.gz 10--20_ATGTCA_L002_R1_002.fastq.gz > 10-20_R1.fastq.gz```
```cat 10--20_ATGTCA_L002_R2_001.fastq.gz 10--20_ATGTCA_L002_R2_002.fastq.gz > 10-20_R2.fastq.gz```
```cat 10--28_CCGTCC_L002_R1_001.fastq.gz 10--28_CCGTCC_L002_R1_002.fastq.gz 10--28_CCGTCC_L002_R1_003.fastq.gz > 10-28_R1.fastq.gz```
```cat 10--28_CCGTCC_L002_R2_001.fastq.gz 10--28_CCGTCC_L002_R2_002.fastq.gz 10--28_CCGTCC_L002_R2_003.fastq.gz > 10-28_R2.fastq.gz```
```cat 10--30_GTCCGC_L002_R1_001.fastq.gz 10--30_GTCCGC_L002_R1_002.fastq.gz > 10-30_R1.fastq.gz```
```cat 10--30_GTCCGC_L002_R2_001.fastq.gz 10--30_GTCCGC_L002_R2_002.fastq.gz > 10-30_R2.fastq.gz```
```cat 10--32_GTGAAA_L002_R1_001.fastq.gz 10--32_GTGAAA_L002_R1_002.fastq.gz > 10-32_R1.fastq.gz```
```cat 10--32_GTGAAA_L002_R2_001.fastq.gz 10--32_GTGAAA_L002_R2_002.fastq.gz > 10-32_R2.fastq.gz```

```cat 12-14A_AGTCAA_L005_R1_001.fastq.gz 12-14A_AGTCAA_L005_R1_002.fastq.gz > 12-14_R1.fastq.gz```
```cat 12-14A_AGTCAA_L005_R2_001.fastq.gz 12-14A_AGTCAA_L005_R2_002.fastq.gz > 12-14_R2.fastq.gz```
```cp 12-2B_TGACCA_L005_R1_001.fastq.gz  12-2_R1.fastq.gz```
```cp 12-2B_TGACCA_L005_R2_001.fastq.gz  12-2_R2.fastq.gz```
```cp 12-7A_CGATGT_L005_R1_001.fastq.gz  12-7_R1.fastq.gz```
```cp 12-7A_CGATGT_L005_R2_001.fastq.gz  12-7_R2.fastq.gz```
```cp 13-10A_AGTTCC_L005_R1_001.fastq.gz 13-10_R1.fastq.gz```
```cp 13-10A_AGTTCC_L005_R2_001.fastq.gz 13-10_R2.fastq.gz```
```cat 13-13A_GTCCGC_L005_R1_001.fastq.gz 13-13A_GTCCGC_L005_R1_002.fastq.gz > 13-13_R1.fastq.gz```
```cat 13-13A_GTCCGC_L005_R2_001.fastq.gz 13-13A_GTCCGC_L005_R2_002.fastq.gz > 13-13_R2.fastq.gz```
```cp 13-16A_GCCAAT_L005_R1_001.fastq.gz 13-16_R1.fastq.gz```
```cp 13-16A_GCCAAT_L005_R2_001.fastq.gz 13-16_R2.fastq.gz```
```cp 13-9A_backup_CAGATC_L005_R1_001.fastq.gz 13-9_R1.fastq.gz```
```cp 13-9A_backup_CAGATC_L005_R2_001.fastq.gz 13-9_R2.fastq.gz```
```cat 14-11A_backup_ACAGTG_L005_R1_001.fastq.gz 14-11A_backup_ACAGTG_L005_R1_002.fastq.gz > 14-11_R1.fastq.gz```
```cat 14-11A_backup_ACAGTG_L005_R2_001.fastq.gz 14-11A_backup_ACAGTG_L005_R2_002.fastq.gz > 14-11_R2.fastq.gz```
```cat 14-12A_CCGTCC_L005_R1_001.fastq.gz 14-12A_CCGTCC_L005_R1_002.fastq.gz > 14-12_R1.fastq.gz```
```cat 14-12A_CCGTCC_L005_R2_001.fastq.gz 14-12A_CCGTCC_L005_R2_002.fastq.gz > 14-12_R2.fastq.gz```
```cp 14-8A_backup_ATGTCA_L005_R1_001.fastq.gz 14-8_R1.fastq.gz```
```cp 14-8A_backup_ATGTCA_L005_R2_001.fastq.gz 14-8_R2.fastq.gz```
```cp 15-3A_GTGAAA_L005_R1_001.fastq.gz 15-3_R1.fastq.gz```
```cp 15-3A_GTGAAA_L005_R2_001.fastq.gz 15-3_R2.fastq.gz```
```cat 15-6A_CTTGTA_L005_R1_001.fastq.gz 15-6A_CTTGTA_L005_R1_002.fastq.gz > 15-6_R1.fastq.gz```
```cat 15-6A_CTTGTA_L005_R2_001.fastq.gz 15-6A_CTTGTA_L005_R2_002.fastq.gz > 15-6_R2.fastq.gz```

## Compare number of sequences between original and concatenated files
```zgrep -c "@HWUSI" *.fastq.gz```

* 10--17_AGTCAA_L002_R1_001.fastq.gz:4000000
* 10--17_AGTCAA_L002_R1_002.fastq.gz:2567688
* 10--17_AGTCAA_L002_R2_001.fastq.gz:4000000
* 10--17_AGTCAA_L002_R2_002.fastq.gz:2567688
* 10-17_R1.fastq.gz:6567688
* 10-17_R2.fastq.gz:6567688
* 10--18_AGTTCC_L002_R1_001.fastq.gz:4000000
* 10--18_AGTTCC_L002_R1_002.fastq.gz:1986188
* 10--18_AGTTCC_L002_R2_001.fastq.gz:4000000
* 10--18_AGTTCC_L002_R2_002.fastq.gz:1986188
* 10-18_R1.fastq.gz:5986188
* 10-18_R2.fastq.gz:5986188
* 10--20_ATGTCA_L002_R1_001.fastq.gz:4000000
* 10--20_ATGTCA_L002_R1_002.fastq.gz:3793951
* 10--20_ATGTCA_L002_R2_001.fastq.gz:4000000
* 10--20_ATGTCA_L002_R2_002.fastq.gz:3793951
* 10-20_R1.fastq.gz:7793951
* 10-20_R2.fastq.gz:7793951
* 10--28_CCGTCC_L002_R1_001.fastq.gz:4000000
* 10--28_CCGTCC_L002_R1_002.fastq.gz:4000000
* 10--28_CCGTCC_L002_R1_003.fastq.gz:302479
* 10--28_CCGTCC_L002_R2_001.fastq.gz:4000000
* 10--28_CCGTCC_L002_R2_002.fastq.gz:4000000
* 10--28_CCGTCC_L002_R2_003.fastq.gz:302479
* 10-28_R1.fastq.gz:8302479
* 10-28_R2.fastq.gz:8302479
* 10--30_GTCCGC_L002_R1_001.fastq.gz:4000000
* 10--30_GTCCGC_L002_R1_002.fastq.gz:2581372
* 10--30_GTCCGC_L002_R2_001.fastq.gz:4000000
* 10--30_GTCCGC_L002_R2_002.fastq.gz:2581372
* 10-30_R1.fastq.gz:6581372
* 10-30_R2.fastq.gz:6581372
* 10--32_GTGAAA_L002_R1_001.fastq.gz:4000000
* 10--32_GTGAAA_L002_R1_002.fastq.gz:2493985
* 10--32_GTGAAA_L002_R2_001.fastq.gz:4000000
* 10--32_GTGAAA_L002_R2_002.fastq.gz:2493985
* 10-32_R1.fastq.gz:6493985
* 10-32_R2.fastq.gz:6493985
* 12-14A_AGTCAA_L005_R1_001.fastq.gz:4000000
* 12-14A_AGTCAA_L005_R1_002.fastq.gz:153808
* 12-14A_AGTCAA_L005_R2_001.fastq.gz:4000000
* 12-14A_AGTCAA_L005_R2_002.fastq.gz:153808
* 12-14_R1.fastq.gz:4153808
* 12-14_R2.fastq.gz:4153808
* 12-2B_TGACCA_L005_R1_001.fastq.gz:3257535
* 12-2B_TGACCA_L005_R2_001.fastq.gz:3257535
* 12-2_R1.fastq.gz:3257535
* 12-2_R2.fastq.gz:3257535
* 12-7A_CGATGT_L005_R1_001.fastq.gz:3492526
* 12-7A_CGATGT_L005_R2_001.fastq.gz:3492526
* 12-7_R1.fastq.gz:3492526
* 12-7_R2.fastq.gz:3492526
* 13-10A_AGTTCC_L005_R1_001.fastq.gz:3246564
* 13-10A_AGTTCC_L005_R2_001.fastq.gz:3246564
* 13-10_R1.fastq.gz:3246564
* 13-10_R2.fastq.gz:3246564
* 13-13A_GTCCGC_L005_R1_001.fastq.gz:4000000
* 13-13A_GTCCGC_L005_R1_002.fastq.gz:133291
* 13-13A_GTCCGC_L005_R2_001.fastq.gz:4000000
* 13-13A_GTCCGC_L005_R2_002.fastq.gz:133291
* 13-13_R1.fastq.gz:4133291
* 13-13_R2.fastq.gz:4133291
* 13-16A_GCCAAT_L005_R1_001.fastq.gz:161
* 13-16A_GCCAAT_L005_R2_001.fastq.gz:161
* 13-16_R1.fastq.gz:161
* 13-16_R2.fastq.gz:161
* 13-9A_backup_CAGATC_L005_R1_001.fastq.gz:3866849
* 13-9A_backup_CAGATC_L005_R2_001.fastq.gz:3866849
* 13-9_R1.fastq.gz:3866849
* 13-9_R2.fastq.gz:3866849
* 14-11A_backup_ACAGTG_L005_R1_001.fastq.gz:4000000
* 14-11A_backup_ACAGTG_L005_R1_002.fastq.gz:3720664
* 14-11A_backup_ACAGTG_L005_R2_001.fastq.gz:4000000
* 14-11A_backup_ACAGTG_L005_R2_002.fastq.gz:3720664
* 14-11_R1.fastq.gz:7720664
* 14-11_R2.fastq.gz:7720664
* 14-12A_CCGTCC_L005_R1_001.fastq.gz:4000000
* 14-12A_CCGTCC_L005_R1_002.fastq.gz:186133
* 14-12A_CCGTCC_L005_R2_001.fastq.gz:4000000
* 14-12A_CCGTCC_L005_R2_002.fastq.gz:186133
* 14-12_R1.fastq.gz:4186133
* 14-12_R2.fastq.gz:4186133
* 14-8A_backup_ATGTCA_L005_R1_001.fastq.gz:3571099
* 14-8A_backup_ATGTCA_L005_R2_001.fastq.gz:3571099
* 14-8_R1.fastq.gz:3571099
* 14-8_R2.fastq.gz:3571099
* 15-3A_GTGAAA_L005_R1_001.fastq.gz:3588814
* 15-3A_GTGAAA_L005_R2_001.fastq.gz:3588814
* 15-3_R1.fastq.gz:3588814
* 15-3_R2.fastq.gz:3588814
* 15-6A_CTTGTA_L005_R1_001.fastq.gz:4000000
* 15-6A_CTTGTA_L005_R1_002.fastq.gz:757944
* 15-6A_CTTGTA_L005_R2_001.fastq.gz:4000000
* 15-6A_CTTGTA_L005_R2_002.fastq.gz:757944
* 15-6_R1.fastq.gz:4757944
* 15-6_R2.fastq.gz:4757944

* C2T1S2_r1.fastq.gz:4404647
* C2T1S2_r2.fastq.gz:4404647
* C2T2S2_r1.fastq.gz:2786443
* C2T2S2_r2.fastq.gz:2786443
* C2T3S1_r1.fastq.gz:4380357
* C2T3S1_r2.fastq.gz:4380357
* C36T1S1_r1.fastq.gz:3667021
* C36T1S1_r2.fastq.gz:3667021
* C36T2S1_r1.fastq.gz:6186073
* C36T2S1_r2.fastq.gz:6186073
* C36T3S1_r1.fastq.gz:4670898
* C36T3S1_r2.fastq.gz:4670898
* H2T1S2_r1.fastq.gz:3201370
* H2T1S2_r2.fastq.gz:3201370
* H2T2S1_r1.fastq.gz:3480910
* H2T2S1_r2.fastq.gz:3480910
* H2T3S2_r1.fastq.gz:3118683
* H2T3S2_r2.fastq.gz:3118683
* H36T1S1_r1.fastq.gz:3488972
* H36T1S1_r2.fastq.gz:3488972
* H36T2S1_r1.fastq.gz:3501343
* H36T2S1_r2.fastq.gz:3501343
* H36T3S1_r1.fastq.gz:3775325
* H36T3S1_r2.fastq.gz:3775325

* 268,726,186 Raw reads for assembly
* 91,950,776 Raw reads for temp and pH analysis


## Check quality of Raw datafiles
* fastqc https://github.com/ExpressionAnalysis/ea-utils/blob/wiki/FastqMcf.md

```mkdir ~/Pdam_Taiwan_2010/Assembly_Data/Raw_QC_Files```

```~/programs/FastQC/fastqc ~/Pdam_Taiwan_2010/Assembly_Data/RawData/*_R*.fastq.gz -o ~/Pdam_Taiwan_2010/Assembly_Data/Raw_QC_Files```

```~/programs/FastQC/fastqc ~/Pdam_Taiwan_2010/Assembly_Data/RawData/*_r*.fastq.gz -o ~/Pdam_Taiwan_2010/Assembly_Data/Raw_QC_Files```

## Examine FASTQC Results of raw files
```scp -r hputnam@galaxy.geodata.hawaii.edu:~/Pdam_Taiwan_2010/Assembly_Data/Raw_QC_Files ~/MyProjects/Taiwan_Pacuta_adult_GCC/BioInf/Raw_QC_Files```


## Run multicq from raw qc folder to combine results from all files
http://multiqc.info/

```~/MultiQC/scripts/multiqc .```

* 13-16_R1 failed and only has 161 sequences. This library will not be used in further analyses
* 14-11 has ~ 2x more than any other library in this set of temp and pH conditions

## Clean files

### Mayfield Data
```mkdir ~/Pdam_Taiwan_2010/Assembly_Data/Cleaned_Data```

```nohup sh -c 'for file in "C2T1S2" "C2T2S2" "C2T3S1" "C36T1S1" "C36T2S1" "C36T3S1" "H2T1S2" "H2T2S1" "H2T3S2" "H36T1S1" "H36T2S1" "H36T3S1"
do
~/programs/ea-utils.1.1.2-806/fastq-mcf \
~/Mcap_Spawn/Refs/barcodes.fa \
~/Pdam_Taiwan_2010/Assembly_Data/RawData/${file}_r1.fastq.gz \
~/Pdam_Taiwan_2010/Assembly_Data/RawData/${file}_r2.fastq.gz \
-l 75 \
-q 20 \
-w 5 \
-x 10 \
-u \
-P 33 \
-o ${file}_R1_75_cleaned.fastq \
-o ${file}_R2_75_cleaned.fastq &> ${file}_75.log
done'```

### Adult and Larval Data

```nohup sh -c 'for file in "10-17" "10-18" "10-20" "10-28" "10-30" "10-32" "12-14" \
"12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"
do
~/programs/ea-utils.1.1.2-806/fastq-mcf \
~/Mcap_Spawn/Refs/barcodes.fa \
~/Pdam_Taiwan_2010/Assembly_Data/RawData/${file}_R1.fastq.gz \
~/Pdam_Taiwan_2010/Assembly_Data/RawData/${file}_R2.fastq.gz \
-l 75 \
-q 20 \
-w 5 \
-x 10 \
-u \
-P 33 \
-o ${file}_R1_75_cleaned.fastq \
-o ${file}_R2_75_cleaned.fastq &> ${file}_75.log
done'```

## Check quality of Cleaned datafiles
* fastqc

```~/programs/FastQC/fastqc H*_cleaned.fastq -o ~/Pdam_Taiwan_2010/Assembly_Data/Cleaned_QC_Files```

```scp -r hputnam@galaxy.geodata.hawaii.edu:~/Pdam_Taiwan_2010/Assembly_Data/Cleaned_QC_Files ~/MyProjects/Taiwan_Pacuta_adult_GCC/BioInf/Cleaned_QC_Files```

```~/MultiQC/scripts/multiqc .```

# Count Cleaned Reads

```zgrep -c "@HWUSI" *.fastq```
10-17_R1_75_cleaned.fastq:5174362
10-17_R2_75_cleaned.fastq:5174362
10-18_R1_75_cleaned.fastq:4663935
10-18_R2_75_cleaned.fastq:4663935
10-20_R1_75_cleaned.fastq:6128051
10-20_R2_75_cleaned.fastq:6128051
10-28_R1_75_cleaned.fastq:6575475
10-28_R2_75_cleaned.fastq:6575475
10-30_R1_75_cleaned.fastq:5154386
10-30_R2_75_cleaned.fastq:5154386
10-32_R1_75_cleaned.fastq:5161180
10-32_R2_75_cleaned.fastq:5161180
12-14_R1_75_cleaned.fastq:3567073
12-14_R2_75_cleaned.fastq:3567073
12-2_R1_75_cleaned.fastq:2947856
12-2_R2_75_cleaned.fastq:2947856
12-7_R1_75_cleaned.fastq:3163578
12-7_R2_75_cleaned.fastq:3163578
13-10_R1_75_cleaned.fastq:2876277
13-10_R2_75_cleaned.fastq:2876277
13-13_R1_75_cleaned.fastq:3688976
13-13_R2_75_cleaned.fastq:3688976
13-9_R1_75_cleaned.fastq:3427216
13-9_R2_75_cleaned.fastq:3427216
14-11_R1_75_cleaned.fastq:6491844
14-11_R2_75_cleaned.fastq:6491844
14-12_R1_75_cleaned.fastq:3497455
14-12_R2_75_cleaned.fastq:3497455
14-8_R1_75_cleaned.fastq:3167483
14-8_R2_75_cleaned.fastq:3167483
15-3_R1_75_cleaned.fastq:3179055
15-3_R2_75_cleaned.fastq:3179055
15-6_R1_75_cleaned.fastq:4216439
15-6_R2_75_cleaned.fastq:4216439
C2T1S2_R1_75_cleaned.fastq:3719641
C2T1S2_R2_75_cleaned.fastq:3719641
C2T2S2_R1_75_cleaned.fastq:2350371
C2T2S2_R2_75_cleaned.fastq:2350371
C2T3S1_R1_75_cleaned.fastq:3680082
C2T3S1_R2_75_cleaned.fastq:3680082
C36T1S1_R1_75_cleaned.fastq:3248717
C36T1S1_R2_75_cleaned.fastq:3248717
C36T2S1_R1_75_cleaned.fastq:5369965
C36T2S1_R2_75_cleaned.fastq:5369965
C36T3S1_R1_75_cleaned.fastq:4110206
C36T3S1_R2_75_cleaned.fastq:4110206
H2T1S2_R1_75_cleaned.fastq:2623652
H2T1S2_R2_75_cleaned.fastq:2623652
H2T2S1_R1_75_cleaned.fastq:2908491
H2T2S1_R2_75_cleaned.fastq:2908491
H2T3S2_R1_75_cleaned.fastq:2544796
H2T3S2_R2_75_cleaned.fastq:2544796
H36T1S1_R1_75_cleaned.fastq:3042798
H36T1S1_R2_75_cleaned.fastq:3042798
H36T2S1_R1_75_cleaned.fastq:3032935
H36T2S1_R2_75_cleaned.fastq:3032935
H36T3S1_R1_75_cleaned.fastq:3208417
H36T3S1_R2_75_cleaned.fastq:3208417

* 225,841,424 Clean reads for assembly
* 80,446,504 Clean reads for temp and pH analysis

# Run Fastqc on cleaned files
```mkdir Cleaned_QC_Files```

```~/programs/FastQC/fastqc ~/Pdam_Taiwan_2010/Assembly_Data/Cleaned_Data/*.fastq -o ~/Pdam_Taiwan_2010/Assembly_Data/Cleaned_QC_Files```

# Examine FASTQC Results of cleaned files
```scp -r hputnam@galaxy.geodata.hawaii.edu:~/Pdam_Taiwan_2010/Assembly_Data/Cleaned_QC_Files ~/MyProjects/Taiwan_Pacuta_adult_GCC/BioInf```

```~/MultiQC/scripts/multiqc .```

# Concatenate all R1 and all R2
```cat *R1_75_cleaned.fastq > all_R1_cleaned.fastq```

```cat *R2_75_cleaned.fastq > all_R2_cleaned.fastq```

# Count Reads
```zgrep -c "@HWUSI" all_R*_cleaned.fastq```

* total reads R1: 112,920,712
* total reads R2: 112,920,712

# Run Trinity de novo assembly
```mkdir Trinity_Output```

* run trinity de novo assembly with read normalization (default on v2.4.0)

```nohup ~/programs/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq  --left ~/Pdam_Taiwan_2010/Assembly_Data/Cleaned_Data/all_R1_cleaned.fastq --right ~/Pdam_Taiwan_2010/Assembly_Data/Cleaned_Data/all_R2_cleaned.fastq --CPU 40 --max_memory 400G  --min_contig_length 200```

# Check Trinity Assembly Stats
```/usr/local/opt/trinityrnaseq/util/TrinityStats.pl ~/Pdam_Taiwan_2010/Assembly_Data/Trinity_Output/trinity_out_dir/Trinity.fasta > Trinity.Summary.txt```

## Counts of transcripts, etc.

* Total trinity 'genes':  195054
* Total trinity transcripts:      386809
* Percent GC: 42.90

## Stats based on ALL transcript contigs:

        Contig N10: 5532
        Contig N20: 4068
        Contig N30: 3150
        Contig N40: 2481
        Contig N50: 1961

        Median contig length: 578
        Average contig: 1088.91
        Total assembled bases: 421198256

## Stats based on ONLY LONGEST ISOFORM per 'GENE':


        Contig N10: 5223
        Contig N20: 3591
        Contig N30: 2640
        Contig N40: 2013
        Contig N50: 1545

        Median contig length: 429
        Average contig: 857.73
        Total assembled bases: 167303729



#Run BSUSCO on Trinity.fasta 
* http://busco.ezlab.org/files/BUSCO_userguide.pdf

## Assessing assembly and annotation completeness with Benchmarking Universal Single-Copy Orthologs
```mkdir BUSCO```
```mkdir BUSCO/alv```

```python ~/programs/BUSCO_v1.22/BUSCO_v1.22.py -o Pdam_alv -in ~/Pdam_Taiwan_2010/Assembly_Data/Trinity_Output/trinity_out_dir/Trinity.fasta -l /home/hputnam/Mcap_Spawn/Refs/alveolata_stramenophiles_ensembl -m trans```

        0       Complete BUSCOs
        0       Complete and single-copy BUSCOs
        0       Complete and duplicated BUSCOs
        0       Fragmented BUSCOs
        234     Missing BUSCOs
        234     Total BUSCO groups searched


```mkdir BUSCO/euk```

```python ~/programs/BUSCO_v1.22/BUSCO_v1.22.py -o Pdam_euk -in ~/Pdam_Taiwan_2010/Assembly_Data/Trinity_Output/trinity_out_dir/Trinity.fasta -l /home/hputnam/Mcap_Spawn/Refs/eukaryota_odb9 -m trans```

        291     Complete BUSCOs
        150     Complete and single-copy BUSCOs
        141     Complete and duplicated BUSCOs
        10      Fragmented BUSCOs
        2       Missing BUSCOs
        303     Total BUSCO groups searched

```mkdir BUSCO/meta```

```python ~/programs/BUSCO_v1.22/BUSCO_v1.22.py -o Pdam_meta -in ~/Pdam_Taiwan_2010/Assembly_Data/Trinity_Output/trinity_out_dir/Trinity.fasta -l /home/hputnam/Mcap_Spawn/Refs/metazoa_odb9 -m trans```
        
        915     Complete BUSCOs
        508     Complete and single-copy BUSCOs
        407     Complete and duplicated BUSCOs
        47      Fragmented BUSCOs
        16      Missing BUSCOs
        978     Total BUSCO groups searched

# Estimating Transcript Abundance with RSEM in Trinity
```mkdir ~/Pdam_Taiwan_2010/RSEM```

```nohup sh -c 'for file in "12-14" "12-2" "12-7" "13-10" "13-13" "13-9" "14-11" "14-12" "14-8" "15-3" "15-6"
do
/home/hputnam/programs/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl \
--transcripts ~/Pdam_Taiwan_2010/Assembly_Data/Trinity_Output/trinity_out_dir/Trinity.fasta \
--seqType fq \
--prep_reference \
--left ~/Pdam_Taiwan_2010/Assembly_Data/Cleaned_Data/${file}_R1_75_cleaned.fastq \
--right ~/Pdam_Taiwan_2010/Assembly_Data/Cleaned_Data/${file}_R2_75_cleaned.fastq  \
--est_method RSEM \
--aln_method bowtie2 \
--trinity_mode \
--output_dir ~/Pdam_Taiwan_2010/RSEM \
--output_prefix ${file}
done'```


# Build Transcript and Gene Expression Matrices

```/usr/local/opt/trinityrnaseq/util/abundance_estimates_to_matrix.pl --est_method RSEM --out_prefix isoforms_counts_matrix 12-14.isoforms.results 12-2.isoforms.results 12-7.isoforms.results 13-10.isoforms.results 13-13.isoforms.results 13-9.isoforms.results 14-11.isoforms.results 14-12.isoforms.results 14-8.isoforms.results 15-3.isoforms.results 15-6.isoforms.results```

scp hputnam@galaxy.geodata.hawaii.edu:~/Pdam_Taiwan_2010/RSEM/isoforms_counts_matrix.counts.matrix /Users/hputnam/MyProjects/Taiwan_Pacuta_adult_GCC/RAnalysis/Data/

# Run Differential Expression Analysis

/usr/local/opt/trinityrnaseq/Analysis/DifferentialExpression/run_DE_analysis.pl --matrix ~/Pdam_Taiwan_2010/isoforms_counts_matrix.counts.matrix --method edgeR --samples_file /home/hputnam/Mcap_Spawn/Refs/sample_description.txt 

# Cluster DEG_fpkm
/usr/local/opt/trinityrnaseq/Analysis/DifferentialExpression/analyze_diff_expr.pl --matrix /home/hputnam/Mcap_Spawn/RSEM/isoforms_counts_matrix.TMM.fpkm.matrix -P 0.05 -C 0 --samples /home/hputnam/Mcap_Spawn/Refs/sample_description.txt 


# Cluster Expression Profiles
/usr/local/opt/trinityrnaseq/Analysis/DifferentialExpression//define_clusters_by_cutting_tree.pl \
-R  diffExpr.P0.05_C0.matrix.RData --Ptree 60

# Split into Host and Symbiodinium contigs

# Repeat DEG









# Annotation with Trinotate

#### BLASTx

```nohup ~/programs/ncbi-blast-2.6.0+/bin/blastx -query ~/Pdam_Taiwan_2010/Assembly_Data/Trinity_Output/trinity_out_dir/Trinity.fasta -db ~/programs/Trinotate-3.0.1/uniprot_sprot.pep -num_threads 30 -max_target_seqs 1 -outfmt 6 > blastx.outfmt6```

#### TransDecoder

```mkdir Transdecoder```

```nohup /home/hputnam/programs/TransDecoder-3.0.1/TransDecoder.LongOrfs -t ~/Pdam_Taiwan_2010/Assembly_Data/Trinity_Output/trinity_out_dir/Trinity.fasta```

```nohup ~/programs/TransDecoder-3.0.1/TransDecoder.Predict --cpu 30 -t ~/Pdam_Taiwan_2010/Assembly_Data/Trinity_Output/trinity_out_dir/Trinity.fasta```

#### BLASTp

```nohup ~/programs/ncbi-blast-2.6.0+/bin/blastp -query ~/Pdam_Taiwan_2010/Annot/Transdecoder/Trinity.fasta.transdecoder.pep -db ~/programs/Trinotate-3.0.1/uniprot_sprot.pep -num_threads 30 -max_target_seqs 1 -outfmt 6 > blastp.outfmt6

#### HMMER

```nohup ~/programs/hmmer-3.1b2-linux-intel-x86_64/binaries/hmmscan --cpu 30 --domtblout TrinotatePFAM.out ~/programs/Trinotate-3.0.1/Pfam-A.hmm ~/Pdam_Taiwan_2010/Annot/Transdecoder/Trinity.fasta.transdecoder.pep > pfam.log

#### signalP

```nohup ~/programs/signalp-4.1/signalp -f short -n signalp.out ~/Pdam_Taiwan_2010/Annot/Transdecoder/Trinity.fasta.transdecoder.pep

#### tmHMM

```nohup ~/programs/tmhmm-2.0c/bin/tmhmm --short < ~/Pdam_Taiwan_2010/Annot/Transdecoder/Trinity.fasta.transdecoder.pep > tmhmm.out

#### RNAMMER

```nohup ~/programs/Trinotate-3.0.1/util/rnammer_support/RnammerTranscriptome.pl --transcriptome ~/Mcap_Spawn/Assembly/trinity_out_dir/Trinity.fasta --path_to_rnammer ~/programs/rnammer

# Build Trinotate SQLite Database

```~/programs/trinityrnaseq-Trinity-v2.4.0/util/support_scripts/get_Trinity_gene_to_trans_map.pl ~/Pdam_Taiwan_2010/Assembly_Data/Trinity_Output/trinity_out_dir/Trinity.fasta >  Trinity.fasta.gene_trans_map

#### Load transcripts and coding regions

```~/programs/Trinotate-3.0.1/Trinotate Trinotate.sqlite init --gene_trans_map ~/Pdam_Taiwan_2010/Annot/SQL_DB/Trinity.fasta.gene_trans_map --transcript_fasta ~/Pdam_Taiwan_2010/Assembly_Data/Trinity_Output/trinity_out_dir/Trinity.fasta --transdecoder_pep ~/Pdam_Taiwan_2010/Annot/Transdecoder/Trinity.fasta.transdecoder.pep

#### Load BLAST homologies

```~/programs/Trinotate-3.0.1/Trinotate Trinotate.sqlite LOAD_swissprot_blastp ~/Pdam_Taiwan_2010/Annot/pep/blastp.outfmt6

```/home/hputnam/programs/Trinotate-3.0.1/Trinotate Trinotate.sqlite LOAD_swissprot_blastx ~/Pdam_Taiwan_2010/Annot/blastx.outfmt6

#### Load PFAM 

```/home/hputnam/programs/Trinotate-3.0.1/Trinotate Trinotate.sqlite LOAD_pfam ~/Pdam_Taiwan_2010/Annot/HMM/TrinotatePFAM.out


#### Load transmembrane domains

```/home/hputnam/programs/Trinotate-3.0.1/Trinotate Trinotate.sqlite LOAD_tmhmm ~/Pdam_Taiwan_2010/Annot/tmHH/tmhmm.out

#### Load signal peptide predictions

```/home/hputnam/programs/Trinotate-3.0.1/Trinotate Trinotate.sqlite LOAD_signalp ~/Pdam_Taiwan_2010/Annot/SP/signalp.out

#### Output Annotation Report

```/home/hputnam/programs/Trinotate-3.0.1/Trinotate Trinotate.sqlite report > trinotate_annotation_report.xls

```scp hputnam@galaxy.geodata.hawaii.edu:/home/hputnam/Mcap_Spawn/Annot/SQL_DB/trinotate_annotation_report.xls /Users/hputnam/MyProjects/Montipora_Spawn_Timing/RAnalysis/Data


#### InterProScan

* https://github.com/ebi-pf-team/interproscan
* interproscan-5.23-62.0
* panther-data-11.1

* ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.24-63.0/interproscan-5.24-63.0-64-bit.tar.gz


input file 
* /home/hputnam/Mcap_Spawn/Annot/TransDecoder/Trinity.fasta.transdecoder.pep

```mkdir IPS```

##### run a test of IPS on IPS test data in installation file

```~/programs/my_interproscan/interproscan-5.23-62.0/interproscan.sh -i ~/programs/my_interproscan/interproscan-5.23-62.0/test_proteins.fasta -f tsv```

* test was successful except new version of IPS is available
* The version of InterProScan you are using is 5.23-62.0
* The version of the lookup service you are using is 5.24-63.0
* As the data in these versions is not the same, you cannot use this match lookup service.

### Prepare data for input to IPS

##### Prepare input file by Removing astrix
```sed 's_*__g' /home/hputnam/Mcap_Spawn/Annot/TransDecoder/Trinity.fasta.transdecoder.pep > ISP.input.predicted.pep```

##### run a test of IPS on our data 

```nano Mcap_test.pep```

```~/programs/my_interproscan/interproscan-5.23-62.0/interproscan.sh -i Mcap_test.pep -f tsv```

The version of InterProScan you are using is 5.23-62.0
The version of the lookup service you are using is 5.24-63.0
As the data in these versions is not the same, you cannot use this match lookup service.
InterProScan will now run locally
If you would like to use the match lookup service, you have the following options:
i) Download the newest version of InterProScan5 from our FTP site by following the instructions on:
   https://www.ebi.ac.uk/interpro/interproscan.html
ii) Download the match lookup service for your version of InterProScan from our FTP site and install it locally.
    You will then need to edit the following property in your configuration file to point to your local installation:
    precalculated.match.lookup.service.url=

In the meantime, the analysis will continue to run locally

* addressed this with -dp disable precalculation

##### Reset the number of processors used

```nano ~/programs/my_interproscan/interproscan-5.23-62.0/interproscan.properties```

* reset to: 
* number.of.embedded.workers=19
* maxnumber.of.embedded.workers=20

##### Run IPS

```nohup ~/programs/my_interproscan/interproscan-5.23-62.0/interproscan.sh \
-d ~/Mcap_Spawn/Annot/IPS \
-dp \
-i ISP.input.predicted.pep \
-f tsv```


# Integrate Trinotate with IPS











##### Software carpentry SQL query Programming from databases R
* https://swcarpentry.github.io/sql-novice-survey/11-prog-R/
* Load as database
* joins
* tidying
### joins in R














