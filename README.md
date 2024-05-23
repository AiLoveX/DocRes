## Preface
Link to article [DocRes: A Generalist Model Toward Unifying Document Image Restoration Tasks](https://arxiv.org/abs/2405.04408).


Link to original repository [DocRes](https://github.com/zzzhang-jx/docres)


## Instructions 
1. Clone repository
1. Clone repository
```shell script
  git clone https://github.com/AiLoveX/DocRes.git
```
2. Put MBD model weights [mbd.pkl](https://1drv.ms/f/s!Ak15mSdV3Wy4iahoKckhDPVP5e2Czw?e=iClwdK) to `./data/MBD/checkpoint/`
3. Put DocRes model weights [docres.pkl](https://1drv.ms/f/s!Ak15mSdV3Wy4iahoKckhDPVP5e2Czw?e=iClwdK) to `./checkpoints/`
4. Create folder `./docker_output/`
5. Launch Docker Desktop
6. Run `create_docker.bat` and wait about 15 min
7. Run `run_docker.bat` for default parameters
8. Check the result in "docker_output" folder

## For your images 
If you want to use your own images
1. Follow the first 5 steps of the Instructions
2. Place your images in `./input/`
3. Run `create_docker.bat` and wait about 15 min
4. At the command line, forward to your folder and enter
```bash

run_docker.bat ./input/your_image task false
```
- `first argument`: the path of input document image
- `second argument`:task that need to be executed, it must be one of _dewarping_, _deshadowing_, _appearance_, _deblurring_, _binarization_, or _end2end_
- `third argument`: it is a choice whether to use pixel-by-pixel image comparison or not. The default is set to `true`, with the test for default parameters. If you don't need it, enter `false`. 

If you want to compare your image with the received one, then enter 
```bash
run_docker.bat ./input/your_image task true ./folder/your_image1 ./folder/your_image2
```
- `fourth argument`: path to the first image we want to compare pixel by pixel
- `fifth argument`: path to the second image we want to compare

In Docker, all output goes to the `./restorted/` folder. If you want to compare a picture with a picture that is displayed in it, then their names are usually formed as `your_image_task` and the format of the input image.

