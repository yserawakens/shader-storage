Shader "SandBox/4"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _NoiseMap("Noise Map",2D)="white"{}
        //_TopLevel("Top level",float)=2
        _Center("Center",float)=0
        //_BottomLevel("Bottom level",float)=-2
        _Speed("Speed",float)=20
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        Pass{
            ZWrite on
            ColorMask 0
        }
        
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert alpha:fade
        sampler2D _MainTex;
        sampler2D _NoiseMap;
        
        float _Center;
        float _Speed;
        struct Input
        {
            float2 uv_MainTex;
            float2 uv_NoiseMap;
            float3 worldPos;
            float3 viewDir;
        };
        
        fixed4 _Color;
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo=_Color;
            o.Alpha=0;
            //half rim=1-saturate(dot(normalize(IN.viewDir),o.Normal));
            float t= _Time*_Speed;
            t=sin(t)*_Center;
            //o.Alpha= IN.worldPos.y-0.5 < t ? 1 : 0;  // basit yükselen çizgi
            
            
            
            
            //                                                    0.5      +_Time-y
            //o.Alpha=clamp(                     tex2D(_NoiseMap,IN.uv_NoiseMap).r+_Time-0.8+IN.uv_NoiseMap.y,      0,1);
            half ti=_Time;
            o.Alpha=clamp(tex2D(_NoiseMap,IN.uv_NoiseMap).r+(-IN.worldPos.y+_Time*10-1.3)                          ,0,1 );
            o.Alpha= IN.worldPos.y-0.0 < _Time*10 ? o.Alpha : 0;
            
            
            //o.Albedo = IN.worldPos.y-0.0 < ti * 5 && IN.worldPos.y+0.5 > ti * 5 ? fixed3(0,0,1) : fixed3(0,0,0);    
                         
            //o.Alpha=-IN.worldPos.y+_Time*6-1;
        }
        ENDCG
        
        
        /*
            half rim=1-saturate(dot(normalize(IN.viewDir),o.Normal));
            o.Emission=IN.worldPos.y>1 ? float3(0,1,0): float3(1,0,0);
            //o.Albedo=IN.worldPos.y>1 ? float3(0,1,0): float3(1,0,0);
            o.Emission=frac(IN.worldPos.y*10*0.5)>0.4 ? float3(0,1,0)*rim: float3(1,0,0)*rim;
        */
    }
    FallBack "Diffuse"
}
