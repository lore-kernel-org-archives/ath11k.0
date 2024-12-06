Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBE7E77173
	for <ath11k@archiver.kernel.org>; Fri,  6 Dec 2024 12:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wqn/yXsEWgwFk7d3eySSwki1BDLyTCTQlHP/ia3/cxM=; b=GhOcxiNgC7xaoKDq5qn68eGQHI
	GQ7dwdFyIXf6ykP6CQ0eh9QqlW0Xc2XviMafqCa7W/Sv6DIIwQpnNgh2y68BUHwyoRSALQ956KagU
	ErIFa/bl2+dvQtcf0avIGbLUknqNum8DMyuLK6I6zqtzFQfAJThUCmCzdQdaj5Q+vQuBEI+0+5q3J
	qJbkVKjkG7Aa3GmFhzG1CcF0DDLQNjodZ7+YYjifwcIFEaD3Yfb+j0prkZWpXG51GFwUQ9TQ72Lxj
	ZBF2/+HdP4jBhkOkdkYvdwFezDPiRV4pt7AsqG4yoUOwmlIf0uySWtLhzNsH3yU28xl6thxLX4hGf
	FZsUvYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXFu-00000001Xfi-2i8N;
	Fri, 06 Dec 2024 12:16:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXFs-00000001XfG-0XRf
	for ath11k@lists.infradead.org;
	Fri, 06 Dec 2024 12:16:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67IdZg003725
	for <ath11k@lists.infradead.org>; Fri, 6 Dec 2024 12:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wqn/yXsEWgwFk7d3eySSwki1BDLyTCTQlHP/ia3/cxM=; b=UCqcmWzPLUvv0AHA
	cMNIplYbTUsIo4e4U2Sa3fcfIMBsWElM2xeIx24a1viF757Ja0WkONRXtswdf82m
	zIiiGQGU7nL7I+hasHzKSZf5FY85UqNj1QarBFI0YahiahE5Tf9wohybia2zJFBk
	hmqfLRNlXntHECkusRbnDiyixW3MLanOhj5Y4qaJz9Eax73KWKgnhj81MZiQkE8n
	xdpnnZEkir9fLJRoZpHiyPcBqCpRHWEBMq/9aX2mo6Xmg8tH4dIOAwV2EUNCEeTP
	Qo7soNWQ1rDEll+pzZDq5ghQffzf9D/62d3IynNVEbLifqZo3FPyazNvoQQD/TLL
	5ozFNg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kkude-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 06 Dec 2024 12:16:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8e7016630so1469386d6.1
        for <ath11k@lists.infradead.org>; Fri, 06 Dec 2024 04:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733487377; x=1734092177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wqn/yXsEWgwFk7d3eySSwki1BDLyTCTQlHP/ia3/cxM=;
        b=f7q+tkyY3X/7sJ4gfyHEj5+zu+5qTjRr+EAcyITdKCePqiTt3Ks6z4SC7njPck6HZv
         uTtCFLAUpnOJCwymukcqR4q5qq7fl296v5VK8hRB9rj4GPvmtJ7XcmL5Tsi+JEEzUfek
         84fcU2FFfIxEGGydYi0PGYxqNR4hxB9mdn2RbzZPQwEzbuSHAdDZUuERDPf+wJ4HEGRi
         Mjpn08PSxoywjjzefeJfuoUL2W6kW1Jxs/KRasu/E1pS6q+FoExdx8AQcqwNgrWlWFGw
         mDDHdW5qR0hqtiHC6E0qlucCiYx+k0aliJJUCYk0cT+RjzkDgqtvs8UT1P11yAxnulOY
         Ow+A==
X-Forwarded-Encrypted: i=1; AJvYcCXaSv/1NASSdIERbDQ0W8w48AGVVOnTevEryh//oUh0Q9GeD1OrO0RcaqzeBsG9czXJAH4igOw=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywni+q0zpzKHMB8IBaalxxT6/YAQ/La3/uJJoIcefpOGVdpoXfV
	+PwwDPYdQo/47pzGFQzLbBKKd2RN5Qc4MygHhsq8g3ivpTFNsaGd5qQVwkH2gfIqcmjFc8ii5Go
	MUrFH6e7vmzgQw2dEX9iL8dfGyRQQxd4kjxjaj31SFY0m8EPZ7JIiz4SG6+NQ
X-Gm-Gg: ASbGnct6+JFD0rMZap1sW0A8agNdGxoiB4pDvksAjINeiuVqUD1QSRo5BgWrCtvS2f1
	dwc4Sq1KdN7eVH5H0iJUQfjuttzpckeD+xppGniPatdWAnZpEjE0lP0EyZL7ylUkwKt3yt/ewel
	WlX4HpY9X+5msBBUvC004udhIDPPhBH+1KkeFXBCQYq46NM2RRp/Ru7BypCO9o/Om2LhXpt3zb6
	tXJzaUnr2E8H6+dt4+GcyqfFHK1WDeHn6X4ySYERYzIdhpxtUHbB7YHzs8srOfvnauRTxhR4ocn
	xRHm+/nsmlhEauzOl84j+vmbBXVCCys=
X-Received: by 2002:a05:620a:298c:b0:7b5:1fa4:852f with SMTP id af79cd13be357-7b6bcaf65c4mr155284685a.8.1733487377447;
        Fri, 06 Dec 2024 04:16:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEETLo4Pi7QkkrYelwKpeurP40wBqMjikrVmWp4FkyL4k13VPynW3pOCmPRkCjhQrr/6mEsvQ==
X-Received: by 2002:a05:620a:298c:b0:7b5:1fa4:852f with SMTP id af79cd13be357-7b6bcaf65c4mr155282185a.8.1733487377020;
        Fri, 06 Dec 2024 04:16:17 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm231473166b.87.2024.12.06.04.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 04:16:15 -0800 (PST)
Message-ID: <7107275e-1ccf-4f09-ada3-e082833d9364@oss.qualcomm.com>
Date: Fri, 6 Dec 2024 13:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs615: add WiFi/BT nodes
To: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: agross@kernel.org, ath11k@lists.infradead.org, dmitry.baryshkov@linaro.org,
        konradybcio@kernel.org, kvalo@kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, quic_jjohnson@quicinc.com,
        quic_miaoqing@quicinc.com, quic_vgarodia@quicinc.com,
        stanimir.k.varbanov@gmail.com, quic_jiaymao@quicinc.com
References: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
 <1ca062dd-8910-4caf-a133-0e5717b43540@oss.qualcomm.com>
 <649dc6c0-f0e1-4dca-8f93-d0f81803cd70@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <649dc6c0-f0e1-4dca-8f93-d0f81803cd70@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g3TUjKPkIC_luERKYcdFJIab59_UeBNu
X-Proofpoint-GUID: g3TUjKPkIC_luERKYcdFJIab59_UeBNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=935 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_041620_244413_AE2F4B7A 
X-CRM114-Status: GOOD (  12.57  )
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

On 6.12.2024 4:22 AM, Yu Zhang (Yuriy) wrote:
> 
> 
> On 12/6/2024 1:14 AM, Konrad Dybcio wrote:
>> On 3.12.2024 7:03 AM, Yu Zhang(Yuriy) wrote:
>>> Add a node for the PMU module of the WCN6855 present on the qcs615
>>> board. Assign its LDO power outputs to the existing WiFi/BT module.
>>>
>>
>> subject:
>>
>> arm64: dts: qcom: qcs615-ride: ....
>>
>> [...]
>>
>>> +
>>> +    vreg_conn_1p8: vreg_conn_1p8 {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "vreg_conn_1p8";
>>> +        startup-delay-us = <4000>;
>>> +        enable-active-high;
>>> +        gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>>> +    };
>>> +
>>> +    vreg_conn_pa: vreg_conn_pa {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "vreg_conn_pa";
>>> +        startup-delay-us = <4000>;
>>> +        enable-active-high;
>>> +        gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>>> +    };
>>
>> Are any of these boot-on?
>>
> Yes, these are used wcn6855-pmu：
>      vddio-supply = <&vreg_conn_pa>;
>      vddpmu-supply = <&vreg_conn_1p8>;

What i meant is, whether these regulators are enabled at boot
time (i.e. without software intervention). If that's the case,
`regulator-boot-on;` should be added

Konrad

