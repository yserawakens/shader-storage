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
            //half outerC=1-dot(IN.viewDir,o.Normal);
            //_OuterColor*=outerC;
            //o.Albedo=_InnerColor+_OuterColor;
            
            
            //2.
            half dotp=dot(IN.viewDir,o.Normal);
            
            _OuterColor*=1-dotp  +_AoE     ;
            _OuterColor.xyz=mul(_OuterColor,_Multi);
            _InnerColor*=dotp-_AoE;
            
            
            //_OuterColor=mul(_OuterColor,_AoE);
            
            _InnerColor=clamp(_InnerColor,0,1);
            _OuterColor=clamp(_OuterColor,0,1);
            
            
            o.Albedo=_InnerColor+_OuterColor;
            
            
            
            //half dotp=dot(IN.viewDir,o.Normal);
            //half dotp=1-dot(IN.viewDir,o.Normal);
            //o.Albedo=float3(dotp,0.5,0.5);
            
        }   
        ENDCG
    }
    FallBack "Diffuse"
}
