Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E04E7716E
	for <ath11k@archiver.kernel.org>; Thu,  5 Dec 2024 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGB2VGYlhX305z9jWjglG6rpxzgkZKcg+qU0mnNMISk=; b=JFyRzfxaz7Xj312f/Az8Rq/8he
	Bi98gEBpwrGmJ8ktwWnpf4Xpsd18Zcp+sa6uznWduUT3fp7Jo7fJMga30HbGjgdunjCbz4gRihWom
	4Nu7sK/YtmsOwtWC/kEvWb1GylOzSR2ANEgmn/I/Ze8zUqk63FxT6nXYN7Y49mESb2OzZxAltzsg/
	4b4PChI6PlXa9YpJ71AYvZSiz8lfE5b951PrTe1KhR9gZuOnb0rnJU3pmMZVk1dKOod0OVSENqEgw
	HpXocRk+WwRG8okPQ/T8eaBgTd+g91lRSZh1QLnJzIR1LCD5kZT2Nel6EBrBtJZbx2AUgDzJGQAlc
	Yblm0qCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFa7-0000000Gw4v-2Wze;
	Thu, 05 Dec 2024 17:24:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFRG-0000000Gtvj-1of6
	for ath11k@lists.infradead.org;
	Thu, 05 Dec 2024 17:14:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5FFDoR004414
	for <ath11k@lists.infradead.org>; Thu, 5 Dec 2024 17:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGB2VGYlhX305z9jWjglG6rpxzgkZKcg+qU0mnNMISk=; b=KtKGDj2sRAbHxqd2
	HJTodTKpseHicN5sBIFn5SVMufRHF5XN29jh2U1Fnos89L/H88OFWnfuzJwLE4Ty
	DN6Yuhy9GrYyWO5xoy5ELBLCjuHPyoOJ9hOEArFVYpG64aVVRK1DbL8zbbLICqAE
	5lTdMtODQ9FnX+wAymREQTHtJq9oYH2rktcqB1ObwB68k6I1H/vvcT86TisGNdb5
	SPAGDEc7eU7YB5JaD7zZrz3aVnmUfHgH0eJDILlmiTzJR6SPdDD8kelNzTr0tAFN
	Tn1+jL2X/s6LqP9jojq2Mcm3Bv7JTDWqMS5xzTJJ5NLzq2LGnNzyZfvA0AP/8c4K
	A0v7KQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben88c5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 05 Dec 2024 17:14:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8a3cb9dbfso2922746d6.1
        for <ath11k@lists.infradead.org>; Thu, 05 Dec 2024 09:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418892; x=1734023692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGB2VGYlhX305z9jWjglG6rpxzgkZKcg+qU0mnNMISk=;
        b=SW6VgA/gyWo7mLd8oJeq1oP3sDFenVjcbx+UbKVp8hnO4Ew0/0NdhwYR4ILaoTmVp9
         EgfZ8P9S23ab3rlF7HwWpgWxU52vKeOzOsDStMw3ypeips4Lzh1j13pn7Hm41zeww7k4
         IhurnkncgwMKbgbog+oYpecYNVMMLUYbcz3mBV/hAtbXL/NwhCu+wTgSD5ciwm1+1cw5
         458Fva/nPECefPEA43ZpxfDp+/9ThtZke/4YqbDcs9nXu6r91acE400oa1NjVlnJXtHZ
         n3YzDILfToQFpWdRkZMqT4+Rd/SsE68mIQWtoj3xDtuKeSupm8H51k6OoIDbym+8fI69
         XAdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR2OHLDfn5x+ZA7Fb6XYObt1MhnnBtYbH7h5Zxs6I8gRZgPZS6LkkrFOAa2s47XnO0E1w8ENk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyNwjHjwkzPTS7v+HAXdL83IEd1BKxrR9lac6hFkupI0zIuDBh
	LAVsSLaKMukmVSt5qldZfhL9w9aZ4t1mrn430cDI8ZRCJBtOyXwGhdTJ8AtJkeI9wFZ97JNMlit
	hVBjyTQFwJy/VqcP/sFEOag0k9Cu/bif+NYNXCWbWTx3GGPYpuIEOf+f/YbgZ
X-Gm-Gg: ASbGncumcXaIeL8+7mMrB51Y+iNbcdPomWSZJIecNxMEMI/tPAsclYvub9VoEdJOOzs
	YBNNTVA1F35qlhV8elTy/bcnW7/asBbcSxAZfx8CB1P+4eRlFhN5BI0PhMoaMaTWGiecVok334v
	yOBYpInf4gieeKfh0bWAc5ZLDPYhksM2r1tvWxo7nxyWdKGcQ8U7HnhcyQJiJGiAXVid8qHCg4R
	ycQy4WCRh5ZmkXaivGHJdRjliZwNd7LqeTi1zRtNdRFxAh5fv5R8DteEzGJ8YN/sqqDsg609Lrq
	zik/hm/626idUkDjaCcWzyC39Pk3m6I=
X-Received: by 2002:a05:620a:440b:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7b6a6c31924mr667658585a.9.1733418892280;
        Thu, 05 Dec 2024 09:14:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpQFNNqg7rmu42uahD/Dvr7J0nOr7rhzd/cZhlhHw/kjUQf8AX6RuhDb+fboOYZ38o76LA/A==
X-Received: by 2002:a05:620a:440b:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7b6a6c31924mr667656485a.9.1733418891922;
        Thu, 05 Dec 2024 09:14:51 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601b5d2sm119571966b.93.2024.12.05.09.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:14:51 -0800 (PST)
Message-ID: <1ca062dd-8910-4caf-a133-0e5717b43540@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs615: add WiFi/BT nodes
To: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: agross@kernel.org, ath11k@lists.infradead.org, dmitry.baryshkov@linaro.org,
        konradybcio@kernel.org, kvalo@kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, quic_jjohnson@quicinc.com,
        quic_miaoqing@quicinc.com, quic_vgarodia@quicinc.com,
        stanimir.k.varbanov@gmail.com, quic_jiaymao@quicinc.com
References: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WUSiwsF7102X-ROdPcVAjR-fPXiORko0
X-Proofpoint-GUID: WUSiwsF7102X-ROdPcVAjR-fPXiORko0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_091454_479472_0C573BB4 
X-CRM114-Status: GOOD (  12.78  )
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

On 3.12.2024 7:03 AM, Yu Zhang(Yuriy) wrote:
> Add a node for the PMU module of the WCN6855 present on the qcs615
> board. Assign its LDO power outputs to the existing WiFi/BT module.
> 

subject:

arm64: dts: qcom: qcs615-ride: ....

[...]

> +
> +	vreg_conn_1p8: vreg_conn_1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	vreg_conn_pa: vreg_conn_pa {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_pa";
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
> +	};

Are any of these boot-on?

> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> +		pinctrl-names = "default";
> +
> +		vddio-supply = <&vreg_conn_pa>;
> +		vddaon-supply = <&vreg_s5a>;
> +		vddpmu-supply = <&vreg_conn_1p8>;
> +		vddrfa0p95-supply = <&vreg_s5a>;
> +		vddrfa1p3-supply = <&vreg_s6a>;
> +		vddrfa1p9-supply = <&vreg_l15a>;
> +		vddpcie1p3-supply = <&vreg_s6a>;
> +		vddpcie1p9-supply = <&vreg_l15a>;
> +
> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +		wlan-enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;

Please move these properties above supplies, to match the style in
other recent device trees

[...]

>  &rpmhcc {
>  	clocks = <&xo_board_clk>;
>  };
> @@ -262,12 +363,42 @@ wake-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio98";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-high;
> +		bias-pull-up;
> +	};
> +
> +	bt_en_state: bt-en-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		output-low;
> +		bias-pull-down;
> +	};

These should be sorted by gpio idx

Konrad

