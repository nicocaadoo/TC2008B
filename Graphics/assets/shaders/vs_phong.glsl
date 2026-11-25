#version 300 es
in vec4 a_position;
in vec3 a_normal;

uniform mat4 u_worldViewProjection;
uniform mat4 u_worldInverseTransform;

uniform mat4 u_world;
uniform mat4 u_normalMat;

uniform vec3 u_lightWorldPosition;
uniform vec3 u_viewWorldPosition;

//Varying to share data with the fragment shader
out vec3 v_normalVector;
out vec3 v_surfToLight;
out vec3 v_surfToView;

void main() {
    //Transform 
    v_normalVector = (u_worldInverseTransform * vec4(a_normal,0)).xyz;

    vec3 transformedPos = (u_world * a_position).xyz;

    v_surfToLight = u_lightWorldPosition - transformedPos;
    v_surfToView = u_viewWorldPosition - transformedPos;


    gl_Position = u_worldViewProjection * a_position;
}