Shader "SandBox/Skybox text"
{
    Properties{
        _myColor("Color",Color)=(1,1,1,1)
        //_myRange("float value between",Range(0,5))=1
        _myTex("Texture",2D)="white"{}
        _myCube("Cube map texture",CUBE)=""{}             //like skybox
        skyboxVolume("Skybox Volume",Range(0,5))=1
        emissionToneColor("Emission Tone Color",Color)=(1,1,1,1)
        
        
        _myfloat("Example Float",float)=0.5
        _myVector("Vector",Vector)=(0.5,1,1,1)
        
        _myTex3D("3D Texture",3D)="white"{}
    }
    SubShader
    {
        CGPROGRAM
        
        #pragma surface surf Lambert
        sampler2D _myTex;
        float4 _myColor;
        //float _myRange;
        samplerCUBE _myCube;
        float skyboxVolume;
        float4 emissionToneColor;
        float _myFloat;
        float4 _myVector;
        struct Input
        {
            float2 uv_Tex;
            float3 worldRefl;
        };
        
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            //o.Albedo=tex2D(_myTex,IN.uv_Tex);
            o.Albedo=float3(1,0,0);
            o.Albedo=_myColor;
            //o.Emission=texCUBE(_myCube,IN.worldRefl)*skyboxVolume*emissionToneColor;
            o.Emission=texCUBE(_myCube,IN.worldRefl)*emissionToneColor*skyboxVolume;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
