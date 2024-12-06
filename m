Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BBAE7716E
	for <ath11k@archiver.kernel.org>; Fri,  6 Dec 2024 03:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rX9ksoptauVwZaMTq4BluNRMDUE7aiOJRK7NZHAQkqA=; b=nH8Ttz/tcZiST6M9C5pazvVXCI
	5CrmqO1ndd/grphSVYxM5g+8j3bm2585nRzV5465mqeES8AzKwi5Hift55Kq1iY163lPv/m4pS0tK
	GjndO4AuHvhkCVj2VNFoaagafLjm4Rqxvh12MP7LzsbRF23THWN/vzosnKTVlD2+/Ma07ZnIWsUu5
	GOAqGzjgm4zRCM71iqP+/DkICVdRCHbeRiW5Pj35EwLEiUyGTxoer68632xZiYF4/N0QWb5AGMYUJ
	NXYAazhyQIqcXNI4vnlFZWzB7hjv/pZaM2SqcH2Uo2u/Db2AwbXJZOEZOnEWL0kG3FJ2pb8bApaAy
	RXA6t5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOvk-00000000Q7D-44vz;
	Fri, 06 Dec 2024 03:23:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOvh-00000000Q6C-3RnT
	for ath11k@lists.infradead.org;
	Fri, 06 Dec 2024 03:22:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaHKO003743;
	Fri, 6 Dec 2024 03:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rX9ksoptauVwZaMTq4BluNRMDUE7aiOJRK7NZHAQkqA=; b=HQ97b8VYyMgiaX4U
	4hNeYYsQMoVFahnuUyrSNbGdWAOZCG9pMdgiVufDa+KzNZbAK9cF7/KZk1VA75TO
	KKz6m2E6V0tCxuXwzzr/JSUHbuiZ/jiwblAvCskXqP5sXxPWZDPLAt0JvR0Dfy9s
	qr7fiRkGJGAObO04M5fHuqIcYRVxS+gOjQBKJn6j4VQWJQBvvPdgJYhfHEaKQViy
	B0e590/nLhnod+08PU3kMd49LZiv2g03KJtH5aPgLEgBALowvQPrIK6Fc0I85yNS
	ZRndr/WapjWVsK81HlVtJu24Bt431//hUzmAuiyEFHHrBoWdlC9eui3YAfgSaYp+
	HHJwOw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kjeqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 03:22:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B63MrZZ015174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 03:22:53 GMT
Received: from [10.231.194.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 19:22:48 -0800
Message-ID: <649dc6c0-f0e1-4dca-8f93-d0f81803cd70@quicinc.com>
Date: Fri, 6 Dec 2024 11:22:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs615: add WiFi/BT nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <agross@kernel.org>, <ath11k@lists.infradead.org>,
        <dmitry.baryshkov@linaro.org>, <konradybcio@kernel.org>,
        <kvalo@kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>, <quic_jjohnson@quicinc.com>,
        <quic_miaoqing@quicinc.com>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <quic_jiaymao@quicinc.com>
References: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
 <1ca062dd-8910-4caf-a133-0e5717b43540@oss.qualcomm.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <1ca062dd-8910-4caf-a133-0e5717b43540@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OJFZ5-zJkuNQxu7hwevrdCHR2vmDQeXb
X-Proofpoint-GUID: OJFZ5-zJkuNQxu7hwevrdCHR2vmDQeXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_192257_863561_129C058D 
X-CRM114-Status: GOOD (  12.82  )
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



On 12/6/2024 1:14 AM, Konrad Dybcio wrote:
> On 3.12.2024 7:03 AM, Yu Zhang(Yuriy) wrote:
>> Add a node for the PMU module of the WCN6855 present on the qcs615
>> board. Assign its LDO power outputs to the existing WiFi/BT module.
>>
> 
> subject:
> 
> arm64: dts: qcom: qcs615-ride: ....
> 
> [...]
> 
>> +
>> +	vreg_conn_1p8: vreg_conn_1p8 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_1p8";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	vreg_conn_pa: vreg_conn_pa {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_pa";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>> +	};
> 
> Are any of these boot-on?
> 
Yes, these are used wcn6855-pmu：
      vddio-supply = <&vreg_conn_pa>;
      vddpmu-supply = <&vreg_conn_1p8>;
>> +
>> +	wcn6855-pmu {
>> +		compatible = "qcom,wcn6855-pmu";
>> +
>> +		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
>> +		pinctrl-names = "default";
>> +
>> +		vddio-supply = <&vreg_conn_pa>;
>> +		vddaon-supply = <&vreg_s5a>;
>> +		vddpmu-supply = <&vreg_conn_1p8>;
>> +		vddrfa0p95-supply = <&vreg_s5a>;
>> +		vddrfa1p3-supply = <&vreg_s6a>;
>> +		vddrfa1p9-supply = <&vreg_l15a>;
>> +		vddpcie1p3-supply = <&vreg_s6a>;
>> +		vddpcie1p9-supply = <&vreg_l15a>;
>> +
>> +		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
>> +		wlan-enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
> 
> Please move these properties above supplies, to match the style in
> other recent device trees
> 
> [...]
> 
>>   &rpmhcc {
>>   	clocks = <&xo_board_clk>;
>>   };
>> @@ -262,12 +363,42 @@ wake-pins {
>>   			bias-pull-up;
>>   		};
>>   	};
>> +
>> +	wlan_en_state: wlan-en-state {
>> +		pins = "gpio98";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		output-high;
>> +		bias-pull-up;
>> +	};
>> +
>> +	bt_en_state: bt-en-state {
>> +		pins = "gpio85";
>> +		function = "gpio";
>> +		output-low;
>> +		bias-pull-down;
>> +	};
> 
> These should be sorted by gpio idx
> 
> Konrad


