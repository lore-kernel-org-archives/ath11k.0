Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18483CE7AED
	for <ath11k@archiver.kernel.org>; Fri, 14 Nov 2025 11:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=; b=H/t7JPQeOGNYjGRt+56dxl1wrH
	zcGho4V5SlTq0PtzvApkEIXRVT2GvW+l9CZzYAKe5NsqkmkPVpfosP1XoHFHnpdasKkYGcQ9jIbVM
	NNEZ8qIPRZ0yEUa7uexFxaToD5drHOgdZO/lBRq+cDwhc+tglEBNMqoGzKPCnDzc4ZAImdFV5wjSU
	cQqhTBZXqGJlA3NyxztY4ovUXeFSvyN9kcrdoL+7e8ISR33C8OPsgAQpIP/uqUnecUXdRr6pFn8GM
	WnLZLgawgkHCcY70gpVUaPomm+ZCZkaj33tVSLVTLfgYMSlNuOdAro0JAHRN/UAQNnWaLDMkt1gRf
	cXa7D2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsE6-0000000C8hC-1ooh;
	Fri, 14 Nov 2025 11:44:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsE3-0000000C8fN-0bTh
	for ath11k@lists.infradead.org;
	Fri, 14 Nov 2025 11:44:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8AiRI1477479
	for <ath11k@lists.infradead.org>; Fri, 14 Nov 2025 11:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=; b=VuFdSrrhJeEzK3wb
	83dIPl9p+5XQN0YyrqeaAKqvqZk+2YVebqGk157VzP9bMHQZCkcZ654KwQ4t02kS
	7K8mIp4LSFk66284F7eZdLKNyrh2tnLsCeqrG4zcTUpOIn6wGzmhAa6+b/bHSPgD
	AZdhwAXNZNgD91T+045U3baj3di6VeHbXg0Vl97qu4KJCdueffgkvcRE+oBVDDlR
	efW4rX7fERRiE2WGCQTFkhXHyT+Ed0VaXQ9/OhKd3T9ITlp5GDEttm/N826Ei7Yk
	7trkoIhYzPFEX+BfwowsGCCnW/40pqMhpjBa6g6Wz+WvxW44M8cmNnKjezADUj7P
	osSkTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dt0f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 14 Nov 2025 11:44:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6855557aso80896101cf.1
        for <ath11k@lists.infradead.org>; Fri, 14 Nov 2025 03:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763120661; x=1763725461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=;
        b=dIL/LCrSPto6H2CyZrNXj4O7El8yF8s/Rrj2kaQB4W0CjVPBxBRWrrC9skHLNRzykw
         dDTFtGArjP9YeEUEvNtTg2mNH/v4yvDmTSZ6Ic7cI+mKzQjsAkYE0GycjqSz/cU9KZSs
         FQ0tglABUQyV3G9gmlAvXKGW0QOu8i5D/z1YnBYrLInbMQd7Cq6ad0oXyAnXk4tQgYes
         bKQKocZ8BZ43k4tte0p6AzOAqj1MXjeotAoxebYOnCHKC93k4AZgfpfTo5kf7hLtxv+D
         1RBh8b5IYaSTcaHjOzSx7jgRYkogU5tkQeECsCf2hC/NZEqfv3k7Edh+cAguq+HfYQvu
         NIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120661; x=1763725461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=;
        b=pci//GwEZU2ojwaJpOcPwK343wLPOpA5UhJ8XUhYkj2RlAqOzNzxh5vNGNj+w7wI2R
         XvFM8qinVcMOlU4DWZnxdNfTxBCJ/7sErkEwHlrOV9N+aLkuOa9wtAIlonKeswWq4DEg
         nUCadh6vXZ3+Tfw5WFyzqmeWLgt+Hwj6BEpWAr98oMFY4q/+6mKR1Kkvbw36jQry6CUY
         La2Wv6gAbugJBTWKBPHAIPh87pBogXr0X72fRlsuNWQydTeM4emk5j0fDaS/+PxqDgER
         A/uNXfaHSLK+MJWLEWoydmCp951Y+yM75sV2ttQFkrSiaIEEBjJN/8qstvJy34tSuaNa
         GJZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWJ4UDIEsVNZ9jZtJGacvBTZCSUO2rcI8UwU8yUS1FjPuDg2cGkc6Ho9YfpeMyfE9lxB6zkW8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvoc1KB0qCp9z1RlD6UeRVLG27p+Qi3FBEvXrgX4s6o3w+ztLu
	92xHS5mgY+ZqBBqlznPDYh4hvaerVTrZyp/5KOiGflnlSEuzAHXTkS0ymZxHnbhI/jiGTYlpPKU
	UIs6t2iR5UOL6lt7fRYhV2vHteZio7GuSg7jkiGRDRv1AKrYHyvCnq48T8hWIg1LG
X-Gm-Gg: ASbGnctgQJ054acuQHlVU4hnIiodyRggmhaI7V1E184fytKoMPE8kzJmp80pn5fW5U7
	CHjmkWEE+BOLLC9dvTZnogvHaBMh1hZlX0gKsBK6xaTWfZNWAucQrHHvU2WtomQgfr11+Jgo+rB
	MtJtvYE9Zj0BhKcjoIAFI09SLRgbwL0Etc7EcEQNFm12seExuqOgcEJUTwUGJ2SWUoqXCneNcKY
	fBiwXhTqMp035s4PFtPk+ITmnCm9J+J0VUNZq6Rgb8DJ0kxb0o3VdOs5G0OEqWSVlDFz7+FwWJ6
	hAhTYD4TgXjF6U9jSCKFz7xB+Du+ywcY9K/nAzeYn9zBi+E3uE1dYVQxDAuBs1dzDLFxnnSCufq
	Bd/FXB+fC2cy/fBaWfD2edJ6Lfz9HoPUOtrfL
X-Received: by 2002:a05:622a:34b:b0:4ed:223e:139b with SMTP id d75a77b69052e-4ede6faa8e2mr91683651cf.6.1763120661285;
        Fri, 14 Nov 2025 03:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGKSxXof2g5+6sgV/vHp4xRjNtsZJyx2k6oEmSKoRXu7xN5sluEXzQ2X8pNO62GmUXl+lsLw==
X-Received: by 2002:a05:622a:34b:b0:4ed:223e:139b with SMTP id d75a77b69052e-4ede6faa8e2mr91683351cf.6.1763120660805;
        Fri, 14 Nov 2025 03:44:20 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477952b001csm2189845e9.16.2025.11.14.03.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 03:44:20 -0800 (PST)
Message-ID: <70322e09-694a-471d-b4fc-f5a8a1c01450@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:44:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-1-a9adfc49e3f3@oss.qualcomm.com>
 <3a951821-14b1-464e-b1da-05a95f4164af@kernel.org>
 <kn24jkn77ydcrn23xz6z27cvaclksmeb3ic7pr24lxsqediugl@ubkf5t4wyyrq>
 <f9d47593-6fba-495e-aedb-c0efcaa5526e@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <f9d47593-6fba-495e-aedb-c0efcaa5526e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69171615 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gHqtoCV0S4uQAjPoSdoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: QiuM8hCP7-_Ib8kR7KIMDCsHHWCwl3QD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MyBTYWx0ZWRfXwArSjvQg6LVM
 yo8fb0jnsd9qRLV15nIZNMpMzZlhtRTT/i2mnoQvOSq1gQ41tW4vmCUf9ICWo+0V2iDQ8jMLg4t
 Ck7dVz9WHEISENZiswy5pU6ZBAU7DL3axZmCSr9Uz8pU0SwGP9ur+DhE6M/4noYgPXz3YrLtGT1
 0H6BR4qmwmnN/zbN0ZYMAQW0vBarI5BBpavR96IZoCRNVgBy6tbkXwkUAgG1yGkiXsglclkzXkT
 mBVjPXLWg492ksHxZCy4DRqr7+ZLRD9FNLdLO2QxzWRzCw6UwNlAJJk/XCOp74CvOCEkrp72wdA
 AMU35H9czFC7d7biKW28YyHhEWaWLsoTH/4cvivCVDrOJitYNOnmalYhFKYHOjingDVolK0jS+2
 ssQcuuqOApaU9iyJPw5amARjht7CGw==
X-Proofpoint-GUID: QiuM8hCP7-_Ib8kR7KIMDCsHHWCwl3QD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1011 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_034423_303338_258FE11D 
X-CRM114-Status: GOOD (  19.54  )
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

On 11/14/25 11:24 AM, Krzysztof Kozlowski wrote:
> On 14/11/2025 12:16, Manivannan Sadhasivam wrote:
>>>>  
>>>> +static const struct __ath_calib_variant_table {
>>>> +	const char *machine;
>>>> +	const char *variant;
>>>> +} ath_calib_variant_table[] = {
>>>> +	{ "ALFA Network AP120C-AC", "ALFA-Network-AP120C-AC" },
>>>> +	{ "8devices Jalapeno", "8devices-Jalapeno" },
>>>> +	{ "Google cozmo board", "GO_COZMO" },
>>>> +	{ "Google damu board", "GO_DAMU" },
>>>> +	{ "Google fennel sku1 board", "GO_FENNEL" },
>>>> +	{ "Google fennel sku6 board", "GO_FENNEL" },
>>>> +	{ "Google fennel sku7 board", "GO_FENNEL" },
>>>
>>> Are these top-machine models? If so, you cannot use them. The value is
>>> user-informative, not ABI. If you wanted to use them, you would need to
>>> document the ABI.

the value has expected format, can it not be an ABI?, from DT Specs:
"Specifies a string that uniquely identifies the model of the system
board" We can argue that its not part of
Documentation/devicetree/bindings/arm/qcom.yaml

@Mani, can you not use the top level machine compatibles instead,
something like: "google,fennel-sku7" instead of "Google fennel sku7
board" which is an ABI.

>>>
>>
>> I had this question initially, but Srini convinced me it is OK to use it in the
>> driver as they do it in audio :)
> 
> That's sounds like an issue which could be fixed or at least discussed.
> There is no in-kernel usage of ASoC's 'model' property, thus we probably
> never noticed that it is an ABI.
> 
model is actually used as soundcard name and long name if there is no
DMI info for the platform,  This string is also used at the UCM level to
identify the correct UCM configuration.


However the model that we are referring for sound is part of the
dt-bindings for the sound card, not the top-level model, so this is an
ABI for soundcard itself.

--srini

> OTOH, everyone apparently knows that audio's 'model' is an ABI because
> no one changes it, unlike top-level machine 'model' which is being
> changed from time to time.
> 
> Best regards,
> Krzysztof



