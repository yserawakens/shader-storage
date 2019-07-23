Shader "Holistic/Dot Product"
{
    Properties
    {
        _Color("Color",Color)=(1,1,1,1)
        //test
        _InnerColor("Inner Color",Color)=(1,1,1,1)
        _OuterColor("Outer Color",Color)=(1,1,1,1)
        _Multi("Multi",Range(0,3))=1
        _AoE("Area of Effect",Range(-1,1))=0
    }
    SubShader
    {
        Tags
        {
            "LightMode" = "ForwardBase"
            "PassFlags" = "OnlyDirectional"
        }
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert
        
        float4 _Color;
        //test
        float4 _InnerColor;
        float4 _OuterColor;
        
        float _Multi;
        float _AoE;
        //sampler2D _MainTex;

        struct Input
        {
            float3 viewDir;
        };
        
        
        
        void surf (Input IN, inout SurfaceOutput o)
        {
        
        }   
        
        / Inside the appdata struct.
        struct appdata(){
        }
float3 normal : NORMAL;

…

// Inside the v2f struct.
float3 worldNormal : NORMAL;
        ENDCG
    }
    FallBack "Diffuse"
}
