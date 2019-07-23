Shader "Test/Test Capsule"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Color2 ("Color 2",Color)=(1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Percent ("Percent", Range(0,1)) = 1
        
        f1("float1",float)=1
    }
    SubShader
    {
    
    

        CGPROGRAM
        
        
        #pragma surface surf Lambert
        
        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };
        half _Percent;
        
        float4 _Color;
        float4 _Color2;
        float f1;
        //uniform float4 _CTest;
        //_CTest=float4(1,0,0,1);
        
        void surf (Input IN, inout SurfaceOutput o)
        {
        
            o.Albedo=_Color.rgb;
            
            o.Albedo=float4(f1,0.5,-0.5,1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
