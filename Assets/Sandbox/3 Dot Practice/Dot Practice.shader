Shader "SandBox/Dot Practice"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _InnerColor ("Inner Color", Color) = (1,1,1,1)
        _OuterColor ("Outer Color", Color) = (1,1,1,1)
        _Multi("Multiplier",float)=1
        _AoE("Area of Effect",Range(-1,1) )=0.5
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert
        sampler2D _MainTex;
        fixed4 _Color;
        fixed4 _InnerColor;
        fixed4 _OuterColor;
        float _Multi;
        float _AoE;
        struct Input
        {
            float2 uv_MainTex;
            float3 viewDir;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            half dotp=dot(IN.viewDir,o.Normal);
            
            //dotp=clamp(dotp,0,1);
            
            _OuterColor*=1-dotp  +_AoE     ;
            _OuterColor.xyz=mul(_OuterColor,_Multi);
            _InnerColor*=dotp-_AoE;
            
            
            //_OuterColor=mul(_OuterColor,_AoE);
            
            _InnerColor=clamp(_InnerColor,0,1);
            _OuterColor=clamp(_OuterColor,0,1);
            
            
            o.Albedo=_InnerColor.rgb+_OuterColor.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
