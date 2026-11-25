#version 300 es
precision highp float;

in vec3 v_normalVector;
in vec3 v_surfToLight;
in vec3 v_surfToView;

uniform vec4 u_ambientColor;
uniform vec4 u_diffuseColor;
uniform vec4 u_specularColor;
uniform float u_shininess;

uniform vec4 u_ambientLight;
uniform vec4 u_diffuseLight;
uniform vec4 u_specularLight;

out vec4 outColor;


void main() {

    vec3 Nnormal = normalize(v_normalVector);
    vec3 Nstol = normalize(v_surfToLight);
    vec3 Nstov = normalize(v_surfToView);

    //Ambient color
    vec4 ambient = u_ambientColor * u_ambientLight;

    float diffuseContent = max(dot(Nnormal, Nstol),0.0);
    vec4 diffuseColor = u_diffuseColor * u_diffuseLight * diffuseContent;

    outColor = ambient + diffuseColor;
}