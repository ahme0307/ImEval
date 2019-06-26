# Matlab Gui for side by side image comparison
Tool for ranking images side by side. It takes four images at a time asks user to rate each image in rank order. 
Equal ranking is not allowed. The images should have the same name in all 4 folders. The images are displayed in random order. 

The output is written on a text file

>Data.txt

with the following format


| Folder  | Image |  Score  | RandDispOrder |  randlist |  Origsort |  tElapsed |  Clock  | Name  | Email | 
| ---     | ---   |  ---    |---            | ---       |   ---     | ---       |---      | --- | --- |
| Image1 |  C2_cut3.png  | 1 |  4 |  1  | 3 |  14.9291651155988 |  2019.6.26.18.47.19 |  Fred |  fred@gmail.com | 

## Screenshots

![alt text](https://github.com/ahme0307/ImEval/blob/master/readme/fig5.png)

## Reference
If you find this code useful please cite

>Mohammed, Ahmed, Ivar Farup, Marius Pedersen, Øistein Hovde, and Sule Yildirim Yayilgan. "Stochastic capsule endoscopy image enhancement." Journal of Imaging 4, no. 6 (2018): 75.


@article{mohammed2018stochastic,
  title={Stochastic capsule endoscopy image enhancement},
  author={Mohammed, Ahmed and Farup, Ivar and Pedersen, Marius and Hovde, {\O}istein and Yildirim Yayilgan, Sule},
  journal={Journal of Imaging},
  volume={4},
  number={6},
  pages={75},
  year={2018},
  publisher={Multidisciplinary Digital Publishing Institute}
}
