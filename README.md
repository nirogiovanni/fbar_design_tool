



***<!-- PROJECT LOGO 
***<br />
***<div align="center">
***  <a href="https://github.com/othneildrew/Best-README-Template">
***    <img src="images/logo.png" alt="Logo" width="80" height="80">
***  </a>
-->
  <h3 align="center">FBAR design tool</h3>

  <p align="center">
    Rapid Prototyping thin film bulk acoustic wave resonator.
    <br />
    <a href="https://github.com/nirogiovanni/fbar_design_tool"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/nirogiovanni/fbar_design_tool/examples">View Examples</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

Thin-Film Bulk Acoustic wave Resonators (FBARs) represent one of the most promising resonators technology.
Their structure is composed of a piezoelectric material having thickness of few micrometers, sandwiched between two electrodes.

The faster is the acoustic wave propagating into the cavity the higher is the frequency:
$f_r=v_p d$

Where $f_r$  is the resonance value, d is the piezoelectric layer and $v_p$ is the phase velocity of the acoustic-wave.

The big advantage of our tool is that the only information needed is the dependence between the phase velocity and the metal over piezoelectric thickness ratio ( $\frac{h}{d}$ ). 

This information is stored and reused by our design tool in the form of calibration curves. 
We arranged the curves in a library, and new materials can be easily added using our systematic procedure.

Our tool is very fast and can provide a design of a resonator even including fabrication tolerances in less than 5 minutes.

<b>Here's why:</b>
* The algorithm provides a set of solutions having different piezoelectric thicknesses in a very fast way as it is based on calibration curves.
* Differently from other methods, we can evaluate the probability density function of the resonance considering Fabrication tolerances  through Montecarlo simulations.
* New calibration curves can be included without any modification to the code.
* Calibration curves can be derived from simulations or from experimental data, allowing the reuse of information in new processes.

The only limitation is that all the layers under the piezoelectric layer have to be specified.

Please remember to cite us if you found our work useful for your research activities.

 How to cite: " ".

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Matlab][Matlab.js]][Matlab-url]


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started



### Prerequisites

Install the latest version of Matlab [Matlab-url]

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/nirogiovanni/fbar_design_tool
   ```
<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage
<b>Before any operation please check that your Matlab working folder is positioned at the central folder of the design-algorithm</b>
### 1. How to Design a Resonator
#### a. Decision Maker 
The design of a resonator starts by specifying the input parameters, the resonant-frequency and the forming materials.

If a piezoelectric thickness has been specified the decision maker will design a resonator for that value, if it hasn't the decision maker will return a set of possible stacks having different piezoelectric thicknesses

Once all the input parameters have been inserted the design starts pressing the corresponding button.

At the end of the decision-maker operations a specific solution can be chosen from the corresponding menu.

#### b. Random perturbator 
The random-perturbator estimates the p.d.f. of the resonance value for that specific solution considering the fabrication tolerances (_the recommended maximum errors are of the 5% of the thickness of the piezoelectric and the top-electrode layers_).

As a first specify a solution from the set returned by the decision-maker and the maximum relative error your deposition processes could have.
Then press on the corresponding button to start Montecarlo study.
At the end the cumulative distributed function and the probability density function of the resonance value will be given.
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### 2. How to Insert New Calibration Curves
To obtain a calibration curve, the thicknesses of the piezoelectric material and all the layers below need to be fixed. Then, resonators having different heights of the top-electrode are fabricated.
The resonant frequency is measured for each resonator having a different height of the top electrode (h) and its corresponding value of the phase velocity is taken from the equation above

Once this correspondence have been obtained the calibration curve can be inserted into the central knowledge of the algorithm following the steps below:

0. Back-up your materials list. The file is "materials.txt" in the central folder. If you get any trouble you can copy past the original file!.
1. Open the "new-material" tab.
2. Specify the name of your new material.
3. Insert the path of the file created before ( $v_p|_h$ ).
4. Specify the minimum and the maximum metal and the piezoelectric thicknesses.
5. Click on the preview button to check if the new calibration curve has been derived correctly from the software.
6. Click on the save button.

(_It is strongly recommended to preview the calibration curve before inserting it into the library_).



### Load and Save resonators
It is also possible to load/save resonators by pressing on the menu tab and choosing the desired option.

<!-- ROADMAP -->
## Roadmap

- [ ] Add new piezoelectric materials-
- [ ] Increase the capabilities of the algorithm for the design of FBAR-Filters including fabrication tolerances.
- [ ] Include a menu for the editing of the material library.
- [ ] Multi-language Support
    - [ ] Chinese

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@your_twitter](https://twitter.com/your_username) - email@example.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

![alt iit-cbn](https://cbn.iit.it/image/layout_set_logo?img_id=381422&t=1661362597853)
![alt poliba-dei](https://deipoliba.azurewebsites.net/wp-content/uploads/2020/04/cropped-DEIlogo1.png)


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Matlab.js]: https://1000logos.net/wp-content/uploads/2021/04/MATLAB-logo-500x281.png
[Matlab-url]: https://it.mathworks.com/products/matlab.html?style={width:10%}
[iit.js]: https://cbn.iit.it/image/layout_set_logo?img_id=381422&t=1661362597853
