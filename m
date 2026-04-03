Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB2BE8538E
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/uAuFTU63ZTQFXA0UTCPixzBtzDQ6AHfdS8W91kFzo=; b=KyhX6rMJ5F5AinmfRYGvWXzPCr
	Pgqt+IX31cWjN0c9o+rv7q/gemOZI0/mqQ9OT9An8tbugH57EuAAlRfGs8AN53hTM2QpzS+yarTFs
	9Z+3DOlpaWpYxAcGdBtbMp+f3E+PdGSH9zma7iXT8yBHyAyzDhbUx5URC9lBThYN5buzRSxmX/GP0
	Ur7Nd+lK9Lji5Rdg9z/EEjs137V1cxMeCVBUJE7slQkctzI8IS7fyofUqk1hexdYXsPqPnMuva3uY
	se00oC6F3h6jZfRUJcbjAzGFdBbzg8spimcAU+0M1q5hUwjH30hXnnciFLn1NoDNoiinuDAaUudDh
	2AgICmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kIW-00000002USL-3bdt;
	Fri, 03 Apr 2026 19:35:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8kIU-00000002URw-0Pvp
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 19:35:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FvDNB259302
	for <ath11k@lists.infradead.org>; Fri, 3 Apr 2026 19:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O/uAuFTU63ZTQFXA0UTCPixz
	BtzDQ6AHfdS8W91kFzo=; b=NAwY1iFN7wES1XbF+qYwbMkPS/sIEb1shxK9mmMQ
	eQhYi3VUmLjeESXKzt3ThRo/F63wV4qQb7INbB1W3UOrR80an/6Hu47gExXYbYb3
	nHSG/SnWFMD1bJBwL9ZkVF/uEGSxrdA+ZLkm0Oc2pIe9um/B9b7aVOq9NoaHuk/Y
	ZXDUJMyDkZgVrCtbqIRC4h++0cWg+4u7+eLls4PzX7Ot5eKmXeu1r3c//X8rzLeg
	c+zSjZ6YK/IHh0+0mnTtRD6BCkfjzaNfZLJgalQAqt2ej1oPRuhpY9r9wxbsGVuJ
	J+XT89XCIWwLlh0JqQldJALVd73Eo2cqrI9k4g4dYboqTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dagn20k15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 19:35:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso30552271cf.2
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244912; x=1775849712; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/uAuFTU63ZTQFXA0UTCPixzBtzDQ6AHfdS8W91kFzo=;
        b=KgBHVjtgobVqLbG1vEOMozuLaId6q4MuoG563ZzDXGQrzIqLP11qToNRNaJKlYrsTU
         I4DXFitexQEHd4RY+a4LyBvG4F49q5jNIROc+ZZZxDzlps2iLRmcNNxiQAHkDIYYbenr
         8GgYdQqPPmrV4fEk/4BY6soSPDDg8L4jYydI3T4QBWGDno+BLi8crYkVYUjCSx1LQZIN
         QlpxuaR3OtDNBOnzjVCY4aZraWGQEEi//sDcGidJv0X2IazmVP1PQijMYbCa2JdwUCSR
         +e95UxBu0tqrDB1ZMbb7KB/x4v9CyGw0nhU/wMi/X4y9PCq2TCafORWRLy1FkvJLtkqj
         n+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244912; x=1775849712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/uAuFTU63ZTQFXA0UTCPixzBtzDQ6AHfdS8W91kFzo=;
        b=DSdKaEwZRwBjlfJneH0Ir/dQ+W5tkrwFVUj1jb2ZpDV8D5LNf4320imydnWMpKT6Co
         +auYZlgj5MTlg5LaljgeU/xAH6PDJr0LeBQpHu0RJfyizhvi6hIzjHn/OWniuODNi1in
         QNWi27yBMVuLGDDHKkD+H3wC1GEPtYvZnS1d41cywKZtAHXNPTjYsUoLQGlSDRSoRKWt
         eSoyI1RkSEbXgvZnDB0rJi0gTz0mNrh5YCW8F8+bMTdTNaU1nVvNC1AVHMoW3phKYjS8
         LxYYvPcc+Cmv3+4hW1cagZtxf4flwyFtvGKBcIO3En2hYLKQohJqq9DgstOEkeAeWiUT
         zEZw==
X-Forwarded-Encrypted: i=1; AJvYcCUi8YHHyr6F8VCOM+CUw73yFaTOmURREZS91FazZNc6qkjbmU6WE+PsFrUlNpjqkNhxkjZWXXM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyrpGAPp4zx45WEtD3yU8nzGBIgs9f3EkF1NKihb+yCjloHfoZ
	X0HFy2rRF+YJ5JueL5ttG4BkxFqcvF+eU9e9SGiT7/z8qx/LGuOh51BjMthFKen2z5aTqRFupm8
	n8jMSNOjO0VTNj0ghVG1hQIRVMmYV8jC7brAIe9t5tuRkSuQV5qgTQYOMi4Zdw744
X-Gm-Gg: ATEYQzx2cEUwXX4suQQx4tc8tz3x+e33knuu7PDyToF/kekK6rs72pJHs7QmyEGR8T5
	2cuh5nI9pz/O52cbIm4x2z7znrpBwTL8A6hEBFvvMkbvVNFcczP6LVDrdHDm+Sql/AA/QEoA+FX
	TZxOc217bdpSg7syTWim5RXRkx9Y58FQD2G1EkFGddfn+GLe5Ud6y5gZVe0mcG+PFzCMLKlgqtT
	p/TNsWz9sz/l9jKR5LUkbaPdYHgM+OEASEaON8/fWbk8rd3IeDhOUP0kDDgn06fO13g+Zuf2Eas
	8kBWtxKBQJCgjZKMDIrjoqcL2vPjNh76GeN2yzigMzh3REC5P/NYBLA/Cvb/5Q7vxnzIHnFdNyj
	w397gkZyOkxNXB6B/hi9zITgea6zyUClUNTmu8lRRL/N+8tqQxGs97lMR2y/OvBZCStUq+fK7y7
	wYn063lGZl/LpRTc2GezNU2T2Ag6135UdrymM=
X-Received: by 2002:a05:622a:1f0d:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50d628bda1fmr64484871cf.18.1775244911970;
        Fri, 03 Apr 2026 12:35:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50d628bda1fmr64484211cf.18.1775244911443;
        Fri, 03 Apr 2026 12:35:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c951b1sm1664908e87.6.2026.04.03.12.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:35:09 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:35:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
Message-ID: <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfX7g5bkLjYMB19
 U99+PVDI2ogKrW9wteASSBJwOlsvQ/iZ10P5s1SQRz5VVClUlOgDAN9ePpj4TqPJ3CTyqogMc7b
 orjFR49C7NrySJ+jHGyUpQUK7eLsJB8F1wi6wmJnnSqWoj03/reLZgc7z+F4f05Sqa/xA2KSUdH
 53hqHTUdTHxea/DRlra3FtoEBlEvYbIc7k5ptWYuyFFvhyI6f0gvNqTG/XS5I0GM1LttWYxiM8z
 GJmDJ9OwP2r4YF3fuEqVR2aKqc0/11GUTSdvkpEO2cayxXkgSzI5jwjSy8EOlryzb0SR2A3oiIN
 QaSpFivmfeTLESchQxYA/0Vpxtj9WsZcLgqzgMZgycHcdJAjJUqjurZGDIQbUnUN8IC4sEViOni
 d6t8Ds2HQbynSMYJrDWjz+qUBYHt40DTdPxB898jO9q3h31sCPLfVwek+3fLiGIPdaO9HY1bbDF
 qbyYTw5cUDMrxCTDWTA==
X-Authority-Analysis: v=2.4 cv=Cc4FJbrl c=1 sm=1 tr=0 ts=69d01670 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Ae2tQB4DPc1jRJoPbowA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: lkTtkyRkflaBx5kv1RGP0ooGxXr4FcN0
X-Proofpoint-ORIG-GUID: lkTtkyRkflaBx5kv1RGP0ooGxXr4FcN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_123514_294008_6EABB6D1 
X-CRM114-Status: GOOD (  21.73  )
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

On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> the missing pinctrl to make the WPSS stop crashing.
> 
> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index db72418b7195..d8ac495ca7c8 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -242,7 +242,7 @@ wcn6750-pmu {
>  
>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>  
> -		pinctrl-0 = <&bluetooth_enable_default>;
> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>  		pinctrl-names = "default";
>  
>  		regulators {
> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>  };
>  
> +&pmk8550_gpios {
> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
> +		pins = "gpio5";
> +		function = "func1";
> +		input-disable;
> +		output-enable;

Hmm, if it's a sleep_clk, should it not be handled via the power
sequencer?

> +		bias-disable;
> +		power-source = <0>;
> +	};
> +};
> +
>  &pmr735b_gpios {
>  	s1j_enable_default: s1j-enable-default-state {
>  		pins = "gpio1";
> @@ -1049,3 +1060,9 @@ &usb_1_hsphy {
>  
>  	status = "okay";
>  };
> +
> +&wifi {
> +	qcom,calibration-variant = "Fairphone_Gen_6";
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

