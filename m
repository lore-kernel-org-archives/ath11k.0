Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61765CD8C9F
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noils2TMNs914sTPuUGf6yPxz2nxtQ6POyQJ6i0X/mU=; b=AbHIaizUHM6cK2hpv/UjW1DB9U
	2KNEgttgSkJks0c2xM2l8V2u9CpSmcMaw5Sv+M9yFWSppUWs9PPua9t0P4iTb8MbgXNFBvAJ05Fjd
	tExGT9xqYoaVF4eeGjtThIse7TZ7ihOjZLi7PpUnvDnbo05RaPyuDPz8hPFZE37Aq7I1j1UnjnLeP
	5JZSPXUaO1g0dAGtVTTSes4sBroIJKpsJHR5tFIGcy9z0nwcIJ55MpVqwlrNz5N4Br0+ZZ6GFNGRj
	wxCrtKvD6ZcCiZWgfVdpn0PSBHTLAj8H9ut2y5DIWphhwDm/rvCAH2vCYEPYzQECge3GO5ZzNg0TQ
	2poU62MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWNt-00000003BsN-19gs;
	Mon, 08 Jun 2026 09:35:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWNq-00000003Brp-37dA
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 09:35:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OrgT2274533
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 09:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	noils2TMNs914sTPuUGf6yPxz2nxtQ6POyQJ6i0X/mU=; b=Jm+rzYcWw424UMaf
	a6G4DrKNHyqLC4QeZ+4mXROqjrbFBVZtS4hqLHDHXjUaGZApYU65UUvBnUKOm/tn
	Y+SS9tLch7/LWzt+BLS4+V2eSJs/u1vX5uJPanOb1LFxNiPERp3833DylOPUpWyV
	SoGB/HgM5EjTK6KoK+3tssRvbNYvO7pVtfZmjPiqKv01DCtDgafQLdCtTOXXBvjT
	fl/YHJBDE9mh/pFM2KxCagQnACXM3+N1x4q7PULVm9VI/aWQP0f7GjQ9Tr7zzoSr
	WKBHpndHgqNF+HW5T9HRU2KQJ4PkI4QcGrzJKcCAhw0D2JbJr53YRQYujVW+QCEV
	ZOIjcQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgxtwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 09:35:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd69b9a10so4572836d6.1
        for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911301; x=1781516101; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=noils2TMNs914sTPuUGf6yPxz2nxtQ6POyQJ6i0X/mU=;
        b=bxs4zLqQUZRiH+BpkwcAEWRCUJfJ6QAx2Iva6VfAWSNRj7kNMjyOXrjA0y+XXP4bDG
         5Qlgw0KiQYR32upDiTs6sBsjDwVH3zc3o55kZjATq20Acp3xxArqfxQsExVwGG4ZeivS
         OC+/1rVJ1irLDwRva+fWxATgpW8sbZX5g9B1zhgkv6yAGktQ+UjrvbhFhtaZ6sliV8Vy
         yR8iGZLxe8oyzSuMX+FfPd2eyzBneK4JRDqSr29E0qziDLzI5T7kStXgIoWmTJK1ZNWt
         tKtKuFLDWmCLAu4dTwR0FZdGEwC3qORnhvPJdi+LeIa38xtCuL+6jpqcPnUVIsb8KB3G
         dV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911301; x=1781516101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=noils2TMNs914sTPuUGf6yPxz2nxtQ6POyQJ6i0X/mU=;
        b=klf4CqXlzAG+QdBfYBPamzEHclJX9ldxA2c57+DnMEvoovZY1bX0Tv1/A1FCmjaLl4
         zult4eXUFxQMdv93iXSXYc0rNAsD5kgVLUX38JCa92/fvvgKqRTBqToG+NuIoJ6M1eyq
         n6xGXd5Bb4iw2hAHd/urfgoOjEjZMiYzbOpoIyA5Ia583vxCm/Exhs96uiPFfzm9/n1u
         0MFkPG6eE6GVJv/NHr+o3uH/TTCUxpyE7XAQ2XerGbMaT8bbCTz+V7s3u6gxLoykUVLp
         YW/jiXGgJpaexD2a/q1rdlnCfnxrkbUJ9w/fxw5DAsjSi99TzKy85jmFQq6YT147+QUk
         L2VQ==
X-Forwarded-Encrypted: i=1; AFNElJ9X/Zhhf5EhLzK9sAJ0JRAU+F1MZ94seTlBGuv/FwkgmiVMMp8vHxEuCEXvsI4hjfu2IWTkEOY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb4NcgrT4I7qp3q7p+ORNxFbSdt6dbTimgPlNTGtAvZwSib4nD
	1du3oIcGGCZpsZAC+q8TOMj6smAI13J6UnIu+R2v6Fh32shL00hkPh0mI81dm9blnb7xXF9U99d
	aTnRhMgdJI9Vu98tlxZ+cMicM5yUCWKwuNoz/bIDt26fVM4TFz6aEfoINztE8oZOf
X-Gm-Gg: Acq92OFWKSD3rvfGAidiOJ6MGPV/DUO9MVr3hjTnCTpzEXf7eTXxxidPf00FZV4nYkl
	UlOFsT7iNAy47XCQk03bwB9lACQWN5fkFmCO+2GU/HPdIUagVNk+rE53T+u92NIoULyAqd8pDy/
	e9PvzLMk+m0wjO7wRmbap0hVPSvOCuVJYRHzQJFnVn3j0djtylpoE/J/IF/SKFxunYxO7OPjhT4
	o5E7tRhiLbDEQbzdm60dIxjeiPOp0opImJivJ1O+RhCNDZDdAeAbKrHvbcaA1UEZB6okBMbuROA
	isYhJG2ectcRgQi/iWDh+96AYLdhVdKENGKf5R3TGgrV/Q4tkRtNS5ziEhcX9FJF9rjNEVSE83f
	0Y+x4L+HsnaH47PFfnLDx+H+zmUA0KuBr3c0y4p9ewNFqcjzoykdO8oz1
X-Received: by 2002:a05:620a:6486:b0:8f3:5988:f97c with SMTP id af79cd13be357-915a9d85addmr1243693485a.3.1780911300310;
        Mon, 08 Jun 2026 02:35:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6486:b0:8f3:5988:f97c with SMTP id af79cd13be357-915a9d85addmr1243691085a.3.1780911299749;
        Mon, 08 Jun 2026 02:34:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm838592466b.52.2026.06.08.02.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:34:58 -0700 (PDT)
Message-ID: <a5783c4b-abf6-421c-84cc-b7b565d37fdc@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8350: modernize PCIe entries
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-6-242917d88031@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-6-242917d88031@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a268cc5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bMn7uSZEEfIJnIPTgxAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: iOMNELAwLBs4Hws8PlIndK5F_k_zY2QN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4OSBTYWx0ZWRfXwsrsbTfmxJRo
 lVM8X1EQXMlhMJ1bleZ0a7BUaysTnqKvFbL0gLUAF9MNekyY1VxFPG9wHXjLHcJFeAs9F+Rcfl5
 udIzpGfu1HiMq2JBML7T0+shtTG+P0pViQ0zOb+LTBV+fI2N8vFRSFoVKEqwQl3ficQ4TtH4sDE
 hOUokYDqZnfWwnuHfz2Bn7PRPwRoybw3qIKNJyl8Q7tedqgL1L0zqz+9OBk076nA4Ix4lPpr4Gt
 JLH/gyHCfl3IEllsCDo8HOFdRfKqQMG47j3MQCzs0TQeXf5oCX6M3d/mcT7UgozgUrpyFt2/iPQ
 gsJUNdxS1bl1tLNdkqrZCHn5kz8y0Y7smGPLAK+BM/d7gpyuEhEr/wXtALWTUEIQrWya//SY5qf
 XYkIDvLIuMwvFVVSPHfF7+2ka8PoLfkwNpXZLOgBGI1O0xrOcPGML7xPsbE7froH6Q1hmoF0O/+
 lkmS1Y4EIDmFAdWmvBw==
X-Proofpoint-ORIG-GUID: iOMNELAwLBs4Hws8PlIndK5F_k_zY2QN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_023502_793875_A213884C 
X-CRM114-Status: GOOD (  14.08  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 6/1/26 11:46 AM, Dmitry Baryshkov wrote:
> The recent suggestion is to have PERST# / WAKE pins and PHYs in the PCIe
> port rather than RC device. The kernel recently started warning about
> the older style of DT. Modernize DT for SM8350 platform by moving the
> entries under the root port device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index eb2a795d8edb..136daa444865 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1583,12 +1583,9 @@ pcie0: pcie@1c00000 {
>  
>  			power-domains = <&gcc PCIE_0_GDSC>;
>  
> -			phys = <&pcie0_phy>;
> -			phy-names = "pciephy";
> -
>  			status = "disabled";
>  
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> @@ -1596,6 +1593,7 @@ pcie@0 {
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +				phys = <&pcie0_phy>;

Other socs put this between bus-range and cells

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

