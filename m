Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C7CCD98D2
	for <ath11k@archiver.kernel.org>; Thu, 11 Jun 2026 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yanaRHSayxwfAY3It1ezK9zv57klScwZdrWFXBHHX20=; b=c21kKShjxVpWt5NoXvhmjg7wbA
	0URY+6+ERtjZKcvwqH8i5otERsJeGC4syVYEC8a9T1RxP/l1PyWBg4KcXTE25o2B5qKXQ3o1LWBql
	rYuhaGzJTUNtoUYAt/OXPpdooPeT9K4HaVxcK6SbRveB1jSp9Opp+XqAUSghiOvKI5ahuQYZx+TE7
	zJFHAmqAEfKCfljW6F8c2AOypHM9tMIB3IxPozN8fYjNYYZ+y5pjEJhlXmgNvNqgxflWFHReM1yWo
	SptLZ3loVEslpDLf/JIn0zL5QkHekgzk8dK6FWv7djcws3a5UOV8oAdpnlkJeUGJ632vpi9NUHpcs
	/eR02S+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeE4-00000009N2g-3vGV;
	Thu, 11 Jun 2026 12:09:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeE1-00000009N2A-3Fa8
	for ath11k@lists.infradead.org;
	Thu, 11 Jun 2026 12:09:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA07cD319093
	for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 12:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yanaRHSayxwfAY3It1ezK9zv57klScwZdrWFXBHHX20=; b=fX+52gJamw398GVK
	gyubigFeKdi3+9/GX+7kBBj6HY42+3HdRKhPsu9mXy5dbUXS90EJqjsSHDC3G8CC
	ujFt7Rt0wqppB+I402QBxcq3vY6l3hU4eZmp4tlXDqXI3o46pazyIElutRHRxWLJ
	aEgj3/0kX0o5BsLwO/PzMC5X2dBUcJhBZI3XcbFvhnMqDvi5OELS82WE6F5sH6hI
	hYNgSUlZlUqqSTneeKkl00PR+tpsBSZNrbtsjmaeyjjYMC7MqNVdmDXHOXFSbqgD
	///S7kA36MeheAERQvf+Mhsvk4jn96lMD7qFNpb2p9Ce9BLpMN2HwqV1Y3COO66A
	0wy0GQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6skbaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 12:09:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517647fbff1so26066651cf.2
        for <ath11k@lists.infradead.org>; Thu, 11 Jun 2026 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179772; x=1781784572; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yanaRHSayxwfAY3It1ezK9zv57klScwZdrWFXBHHX20=;
        b=Dc1mvloF5FHAaw05LZpN/0ehAf0+6eIb4SzBEQDkLb3yYfhWD5jgEpR9gyabPqvyBY
         J0rJLqVNc4lw0OuvumXKIvxANgsqpwrqqUYIwi5O1nX86nl+haQBfbE3AVg72CitMuwg
         +DAKXPM3k1zC2vC5moVKhyxGkB3rmXXKMiI3X1e8fBdRXAqnMJLbUDnQ8L7QbNw7Hr2v
         l4fjjUPnYqkoH1F0p2si1tHYIQTMWVtIAM1n/FGRmiQ8WBmukN8NfnGq1C9SkMQh+9O/
         zDRIZMWx8CN66s76fUlRepBnErBOlhWLK9sMp+qv0lSWTjOEKXkvA59+MU64YHJZkHP7
         fM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179772; x=1781784572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yanaRHSayxwfAY3It1ezK9zv57klScwZdrWFXBHHX20=;
        b=WGFr1+Hs0KU/AVhVSuXU9lYgtajowgIFEJRp+cErTSBNYnGyrW3ERNg+se+nhBOnjI
         YJUmmp5Diy7BzP1uavcX4YE9QNgcqzakMUxIi0KG5kKLLQpwht080jmSNa5S1RE9s8Uf
         PQTHoC1tYv5/jVPbJptV2yHMNwNboXhKYrFLCXOzRJDqBM41vTMRfk2+9KvFdBpYNzyu
         9RcUnur/6XglA80WbDnx2vu9LhpTGRu5J2F9vB+pZRassH50MdllCMtsbMiTmfmVuKLF
         NLU7RxNgLZ5MvBmeiQ2m/Zn1dnu7SLXmM6R+1r9aElnaa36hwQSMnQ3acbXM/cCjCypz
         R9aA==
X-Forwarded-Encrypted: i=1; AFNElJ/Pg/kmUi3VnN9AueZlSn64JieRbHq2kOKbPNuqcLu8fn1dVvBtuHf5wSfzjW2NxeWXw/61I+Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYGlqld5Ltqp3hAZ9TIvpoF/d9XBHQM97JsOpTlbCl/OL7sqt0
	1Pv6L9R7YTwBzs7SAkwRqez7gzdVhJVOv9n2HBhmsnaNWen/uVnxTW26K741kJvOfFh4YN3J8zw
	bs+nXFiZUM8mBrN8fpT10zxyWIeuygrjqFJOVEXbpF6eyXKIiqAmBd9UTLbw1dWQ8
X-Gm-Gg: Acq92OFrTOt1D8ETz+3TJ9v9IvVNOgGz79PRbwOw+aLX0BPyfBDcHpBX8n8PVw6PZO5
	9CgJEBpAGjspgXcqPM7sjW8YGjPTXlljA56Nf+r2EjruW5gQuRw8yjFEkyRaMgnfyeg8WX5sQRi
	TOc6h6X4WM4v2RcHBvLHYG4rUv4wmgdqPalhvcM2NO3rp6biBfW2UY+wJQJpNhEpEzBhaDdjhiQ
	DTBi9xct5l18QpZiHkwKt1jggc/1LbZ7TPey8QDc7ERsniQVtmUMXneT13CQMZhcDCOKoamVh6s
	YO+w0RtRQGwzpadXCSo0oMydnpSA+lUu7VvUlxPfKzjbo3OjFrE9pU1/iYLfSD7OkRuP/d+okgw
	5vCJ6o1H4SXUV7YkIJP2qnQ+o4XgMEfXMzrwkJfvaP7wWko7W5FsYwKPL
X-Received: by 2002:a05:622a:1449:b0:517:8999:6c4b with SMTP id d75a77b69052e-517ee262f43mr23989011cf.7.1781179771919;
        Thu, 11 Jun 2026 05:09:31 -0700 (PDT)
X-Received: by 2002:a05:622a:1449:b0:517:8999:6c4b with SMTP id d75a77b69052e-517ee262f43mr23988691cf.7.1781179771522;
        Thu, 11 Jun 2026 05:09:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb60ae379sm56540366b.50.2026.06.11.05.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:09:30 -0700 (PDT)
Message-ID: <955691e1-e40d-4584-861e-8f29db4ba8a9@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:09:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
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
 <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WgjMeQFsPedz9xbJ0d9bLMlvSd8JIjvk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMiBTYWx0ZWRfXyCMkRDj2/b5u
 /Uo+zPYVLxy0buT3rz9cNQDNRE7cAub8sRJ1kCiTc56rIw30f4LijZu59VXIMEB313Miel1GrvW
 uALRb96GeFj657Ma42MalNUXzM16nVw=
X-Proofpoint-ORIG-GUID: WgjMeQFsPedz9xbJ0d9bLMlvSd8JIjvk
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2aa57c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VQxyErZXnhhA2ehoMNgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMiBTYWx0ZWRfXwN573KwuHlYo
 mJrC0J4tNsbU96jOVMVyaYTgmQRcPYh7mYz9yxg7S2EKS9LcNI17YUxyaKd3PMbiW2oJEv7uUkS
 TEkTNf3QnxmEuIUyLOUY0RBrnfrjEIHn/i/KBvXG3TXk++yCGHv6V4JvDoOl2C2UvvehQcaLcs2
 H8tYFbHvAeKgeBBARUMHfUhZEtbmaHr/eDMGDrh2FE2R1+9y/QHxoHOim/NQTgV6o8vRPmSauIT
 r/AxkvzJa4X5/EYWLDY6GRFH16sfgY9KnH+Er0a9S5F7c0EByrpiZcokbegqGu8lOND5MdBuKi7
 4HGvwhOMoIHGWTUS0Yv5vc9+oGZn3uv/VWRa+DycimA9Q3L2nCS+lOO0NXzU04LJMbiWCpQJv28
 WPfIchZSqlLlypp9DnYL5bAQFnv11+Za05mtilxF3nIA8fHInwdxIlUT3MS5RwWv4W85GEh5hN6
 qNoReUm+srNFpf2DQQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_050933_958135_6415ADE2 
X-CRM114-Status: GOOD (  13.20  )
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
> The SM8350 HDK has onboard WiFi/BT chip, WCN6851. It is an earlier
> version of well-known WCN6855 WiFI/BT SoC. Describe the PMU, BT and WiFI
> parts of the device.

[...]

> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6851-pmu", "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&bt_en>, <&wlan_en>, <&swctrl>;
> +		pinctrl-names = "default";
> +
> +		wlan-enable-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
> +		swctrl-gpios = <&tlmm 153 GPIO_ACTIVE_HIGH>;
> +
> +		vddio-supply = <&vreg_s10b_1p8>;
> +		vddaon-supply = <&vreg_s11b_0p95>;
> +		vddpmu-supply = <&vreg_s11b_0p95>;
> +		vddpmumx-supply = <&vreg_s2e_0p85>;
> +		vddpmucx-supply = <&vreg_s11b_0p95>;
> +		vddrfa0p95-supply = <&vreg_s11b_0p95>;
> +		vddrfa1p3-supply = <&vreg_s12b_1p25>;
> +		vddrfa1p9-supply = <&vreg_s1c_1p86>;
> +		vddpcie1p3-supply = <&vreg_s12b_1p25>;
> +		vddpcie1p9-supply = <&vreg_s1c_1p86>;

[...]

> @@ -373,6 +437,13 @@ vreg_l7e_2p8: ldo7 {
>  			regulator-name = "vreg_l7e_2p8";
>  			regulator-min-microvolt = <2800000>;
>  			regulator-max-microvolt = <2800000>;
> +
> +			/*
> +			 * This is used by the RF front-end for which there is
> +			 * no way to represent it in DT (yet?).
> +			 */
> +			regulator-boot-on;
> +			regulator-always-on;

msm-5.4 maps this to bt-vdd-asd-supply (asd being a keyboard smash,
perhaps?) - what is its actual use?

Konrad

