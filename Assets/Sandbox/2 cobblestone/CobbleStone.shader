Shader "SandBox/CobbleStone"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _NormalMap("Normal Map",2D)="Bump"{}
        _DepthVolume("Depth Volume",float)=1 
        _Tilling("Tilling",float)=1
        
        _SkyboxTex("Skybox",CUBE)="white"{}
        _SkyboxVolume("Skybox Volume",Range(0,4))=1
    }
    SubShader
    {
    
        CGPROGRAM
        
        
        #pragma surface surf Lambert
        
        sampler2D _MainTex;
        sampler2D _NormalMap;
        samplerCUBE _SkyboxTex;
        float _SkyboxVolume;
        
        
        float _DepthVolume;
        float _Tilling;
        struct Input
        {
            float2 uv_MainTex;
            float2 uv_NormalMap;
            float3 worldRefl; INTERNAL_DATA
        };
        
        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo=_Color.rgb;
            //o.Albedo=tex2D(_MainTex,IN.uv_MainTex+float2(_Tilling,_Tilling));
//            o.Albedo=tex2D(_MainTex,float2(IN.uv_MainTex.x+_Tilling,   IN.uv_MainTex.y+_Tilling));
            o.Albedo=tex2D(_MainTex,IN.uv_MainTex*_Tilling);
            
            o.Normal=UnpackNormal(   tex2D(_NormalMap,(IN.uv_NormalMap*_Tilling  )    ));
            o.Normal*=float3(_DepthVolume,_DepthVolume,1);
            
            o.Emission = texCUBE (_SkyboxTex, WorldReflectionVector (IN, o.Normal)).rgb*_SkyboxVolume;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
