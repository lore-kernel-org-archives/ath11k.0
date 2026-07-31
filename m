Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20D2C54F54
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 05:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGF26iFe9DZTXxFyj9SaDxHkxjgqkteQaAzW3ifNWtQ=; b=dJFYPA7xqXWg9oEd5gLPC5jSaH
	9zNitQ3tSisFSE9SYx8UEvfKhyom/Ua6Es+zCAjuXQ5j8Gg7Ar3fLmteST7FZEBAmKziSbHWJQr3b
	qYI/f3viDeXv/KHrlPWgEr/JOslmTtGnZ9fZqndE2gAjWm5+qnplPQg/Z5HKAUMq/hdaoZoLUiJrx
	s8vIAYDIb0TQvzrQsApkqgH8GKLWPPqsX4v4SCW7anqqzK7o1dsxboQ5m/SbX39zEmfMz3BgwDQTC
	FNirzU8b4kjofVKcvt2WFXsv/xexhwotlMJ0Gzc4rmq2kPma+BKrFnnO5wnMphQmRxWIUjZa/GWfy
	KK05Vgwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpg1M-0000000Bp6Y-48NR;
	Fri, 31 Jul 2026 05:43:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpg1C-0000000Bp5v-3oDU
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 05:42:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4ukY62860080
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 05:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wGF26iFe9DZTXxFyj9SaDxHkxjgqkteQaAzW3ifNWtQ=; b=R031ODRBiW19w093
	T2lZi4ZkGigj/TIUrybNTspufoawfugdXFgcRbprnjwZkop9wSYvUqa6h9CGYoug
	IEw0FoDnXZqribCq8dhsQPjusLcg4YlJhRrGSU2qdp4BlU+qQGTn0wQ2d7OcB1nR
	X+c+h2ZlFp55V0lf1MS9ioPBQtoOIw/AgKxVwe/wt9qujRYjjUzSFGkXl1iwPjKS
	HedQL+ENMBZ/XEZLuZQg8n2r2yenhOoRQhQ+nx4JaZ122tF17dJPrZCOX00U140u
	H0c3Czs4j1MGCKGGdL/ZIxC6gv+rwQMJz0YPwc2HTurJRgSimoNLMzd1k4fTZuet
	Yk6MIw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frmyqg595-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 05:42:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848544a8496so783879b3a.0
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 22:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785476569; x=1786081369; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGF26iFe9DZTXxFyj9SaDxHkxjgqkteQaAzW3ifNWtQ=;
        b=F18n4JInqp01BCBGGBZfdAEyo/kVdPVEqjXxvSMMycyyuUctHB/OaK4bMQqagDlLIe
         EYN6akLpxNNlwfiE/TEnbienOGme4wWZ3iAl11fMlXgSfECOWpVRV7rFJzVFRE+9Ro0Z
         oYn6dC8I7mgmwSVJc6aGEy5CBxgTlg0eUik0m99TAI1kp9fCh0+8a6GOOnhENUtKrCO5
         sP9UQ95CHOtfUFyVGWGcrciu8QsqQXVYepGjimOzERUzwxHHYzdHOKVdWMktMstSC5FZ
         lHLbESygKKJSTUQ/W9LVL/exEEfj8j/8tmRsW3aBU1/HeuK6DTw2JppSlobkfmtcZrSP
         sD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785476569; x=1786081369;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGF26iFe9DZTXxFyj9SaDxHkxjgqkteQaAzW3ifNWtQ=;
        b=GXmraGc4JkmLVJdenNc1gk03jFrlv5Mfad/zTz+7LZNIWdU9rwZPfGz+Fj+eigzzuk
         zn7nqfrY64dLb24upJ1p/d7kFntT8mQ8qw/LzRvXLPFyd68+Qa/zXiwbSg3XsCYGW/ar
         dwd0k8RwNLAHKISgwzMzIH+xlTSA6/M2qFQjhUzFQ1A3QcluxecbyDCVjvshTGmffHEa
         NqGXlMkwFNQbng/viJNUkbyNfYrJDJHEiemJ2DDXoInlKnznzPZl1UUhNSKX+9XJ/EEH
         QEfQd0kzmiWLM2Zwf89gCN1zJCKxcdT9t5//fUG/tsj+aWpd5tkN5P3LWtoPnHsX35ci
         YgvA==
X-Forwarded-Encrypted: i=1; AHgh+RpWlcv8FPDJOOAs36SL/GfMj23MS17QKSUlKM1yAmg+5jvLuFjpPe33U8w8y7RbhD38x1kkpgE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOemenLXNIycowWqygSx+/9IV7d5e/1CbqnQDTGac+iG69PtN8
	tdieB55VsLEttlFftnPjwV2Ce4SkHdbkRpKIilgx52bN7j3J4TishPeXJ193YaA+kUjb/gD7O0J
	r/pKeR8IJtz5zMkBEhHBH2J7A8KFQKvYK8clOaVit3sRndgGx+PSfkwUACDfJSeQ0VcH+CtlX
X-Gm-Gg: AR+sD13h5Zxwa++qOwShL0gfw9a/ysDNPidZEpDkvYKEUKj3Im5UUiflURxglKqhHY8
	xNHDUl+KPH1a1/y+SZjbXxp+DPh4QQ6CEdrYrlBaPpjrz/BVUjsbO8NS8gDzR/8rrHnUxDnYeXX
	iOHCyBIdWNG6162LpOXBOdyKeJ+74wVOkMrh/mh250y369jZTzWJ7bQMsEV5JYO59UiETTN21f/
	fmYPKN5EJGdVKgyeG17RG/XZl4ExVskbAsCudWclyOzwOAbsaKfYqF+gRvK34dix6nVjQa8/lUw
	blOtaghTH5zL8jXqiEyzK3nkrg6+9Q2XYpKCFAOF3Ai0XlokBGI88zBDt8/3oxAkHcE0vz+7SZf
	SzjbmGhLnn+hz9TyhPkCciOh3ItEnDf038Qq8dL+vBP9bAyV71PJVo7KdNooSmYvh9JRXrMgLxQ
	==
X-Received: by 2002:a05:6a00:4f81:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-84ed6f5427fmr559299b3a.9.1785476568881;
        Thu, 30 Jul 2026 22:42:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f81:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-84ed6f5427fmr559289b3a.9.1785476568447;
        Thu, 30 Jul 2026 22:42:48 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5dac1ffsm290412b3a.36.2026.07.30.22.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:42:48 -0700 (PDT)
Message-ID: <2e0430ea-0370-4439-ab42-40cc24ff02d0@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:42:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: reset ar->num_station on
 hardware start
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260730140306.133718-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730140306.133718-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzNiBTYWx0ZWRfX3BSZmK370Rkk
 X/89kozKK5Fwgsr1uYidy+Mz5WK65i7DymWU78FF+fDOrhYORmUcZMiRzankphFGw/dQ8Y3DDz9
 6K3+cAxBocJG6FJE3B4+Y1folt5GMiY=
X-Proofpoint-GUID: TE_49xaWHFuJbZ7R-ttsTCNw8daPmhaJ
X-Proofpoint-ORIG-GUID: TE_49xaWHFuJbZ7R-ttsTCNw8daPmhaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzNiBTYWx0ZWRfX4pePVrePYh9r
 8ENKsp+vojoBDzlLn1DAgAQWO2TynGn1z2UrHlcGD3+B3SSEZW1zqupR2+ZD0DqD1Y6xtQKILxN
 7qHh3Thl8JzHUKsjvZUnlAMRFNmq7Izk4I/EEfkSfzcVyWgxLAgzY3eKZtmNa1jphOK/gbDmPmq
 v3x2N0AUQq9P0X4J0xgbdbOoLlYPpB7AHPhqyLOSVHfpD186/ti3cuEsCvTwj5PcAVBkxXKpPkC
 7QnK+opahsdo4s0bhWNM5bkx+sbIEZkl3FJz/+hKPavWEWYr7tbKx49Oc6oO04AkoMi2k7t1wuv
 cpIpuBbR/tcim7xXzcSPy/jY7UGNHBWF/Q51DXklq3c3ZLQkCpzUW40ARBcRSsxrjCAoxDCq6TI
 tQ6tDFU2+GdCWfY8EuwiAYMt7HDrPN8A7Kud191PxoGh1LEn7eGcUBDqlnGsyvw2/R3lgkHhJ1Z
 GgUIeKm1sxaDe6xgZLA==
X-Authority-Analysis: v=2.4 cv=Xb65Co55 c=1 sm=1 tr=0 ts=6a6c35d9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=I__WgQmDEH5XmK3x6moA:9 a=QEXdDO2ut3YA:10 a=DVKqRkKJf1IA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_224257_859101_D5E9C1AD 
X-CRM114-Status: UNSURE (   5.87  )
X-CRM114-Notice: Please train this message.
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



On 7/30/2026 10:03 PM, Nicolas Escande wrote:

> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

hardware version missing betweeen target and bus type

QCN9074 hw1.0 PCI

