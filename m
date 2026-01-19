Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A530AD29C28
	for <ath11k@archiver.kernel.org>; Mon, 19 Jan 2026 13:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9PZi2OyyufDNKhBcS5/qm2h+QzQ/icLvJSkPYuf8NU=; b=FL6U8QbuCgJW7aRLYQJayqLfuE
	G4s//k5hDdtsoTpAeU6p8+S7b2U038U5aFtN9LBgeTOeg6b40Y6vuhvL3biE762C0ZUYq6PSUwav5
	gwqYXqkKSYoSIxF3Dk5TLS0GRa1bhpGFCalIdaj5ztpwGlkGCveTNGuhsRmCH1K2BBD66s+prNEtD
	bM59SYU3Eqidr34+Kcv66W3wr3EPsSLx6kKTo8FFySicQcoB1jRCbMmtjbNe6pqF7sooywVmGq9Fb
	Mj05M8CFNWtmXixjrl13epn4XytgkgnipaAOtmsUtgA5uHEdMpNCapQ3/59erWZ6r3BYUDQLEviS3
	OaHbkeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhp86-000000028yD-46Zj;
	Mon, 19 Jan 2026 13:17:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhp85-000000028xi-0pfC
	for ath11k@lists.infradead.org;
	Mon, 19 Jan 2026 13:17:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J913131044535
	for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 13:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u9PZi2OyyufDNKhBcS5/qm2h+QzQ/icLvJSkPYuf8NU=; b=oDLeTa98h0MXuM+B
	+biRMfTckKUDbYIV2Sst4j2ZCajYc6EBRVR1WDHkQOO+K24FO1AqASwWoMY5bOgY
	JVFF0yBgNoWN7fykbPoBongn5Ly5spZGEXnNd1g+h3xSDkSCAcBISvZ2EbVoBlu3
	WSOF+xs8x79HCaD4ssvXUlU0Z2IxDss1ou2GhReAR0U6kj1K80U0TCPVkswEZkFb
	T247LVV+bSEkNKLCuiX+fwICiBPVvVtUfqL3hBjyESHg6hRJAnsdnJxi1Lb2ugfS
	+EC9fjuavpcbQ8HDjB0jEIYvGEBV1yK/H+Q8jS7d8ZXgENeRhhj3k8PoMhMKe16F
	uYX2kQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ej7mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 13:17:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c213419f5so2797946a91.2
        for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 05:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768828632; x=1769433432; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u9PZi2OyyufDNKhBcS5/qm2h+QzQ/icLvJSkPYuf8NU=;
        b=KNfrjIgSVU2GE0vrqhsQ9vYYV6tYZP1TudOhabfdHb+8+lLiXr9Kn1agoFcRw2dfcg
         EU6yanOxsYtyeyj/kuXp39eItRwVYiLeIuxJ/QNVG1Hd0YMqi7bcz4kgiMarXJxuMY0c
         BrE4MWooDOaO5lalPWpggIDU5ri/GHYbxIY0Gq3hzT08Mov5Kqz/drci38Y0wVQdVuIE
         vL6oetZ7gI/jtLNJ44jbn/5ABvY2yszwaBdjP5LjZDKntLnCrRYW1CUqsQuhjoqSNkSo
         Ecy8dZDxK7urMFyuTl/S5C5PR3vniNPo8RbKG7EOiCJbGhuYPB/MB5iRUb+Sh+m48IVZ
         WJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828632; x=1769433432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9PZi2OyyufDNKhBcS5/qm2h+QzQ/icLvJSkPYuf8NU=;
        b=DmfPlno3E/TX0IPM90MxtMC0RAUAr8aVeElmvkCeXLlS+vNZDvtnMo9NiTZQ09aOOa
         vz3j+28Q6D846bYa+lWEfhVk7ghK7btFvxLn0TM3Ry3Gkx2YnrHYipg/eyhVt3ktV7y7
         Gp7IhFT4FJogEVgYi8hFBM8A/jlrE667psDAe4nq2hx7XPe6PPZqSVD6BOBaLcvhrpW/
         jQaSQ/dOmlMtW/V/27UF2FSN+zIn7m92xaMnbdDE4lipis64+y8ITLAzv4p4zkcRlaD0
         sQfHBBkyBMLgTIlMoNzYaYH2c1SpcfgN/wwajm0uWopwHsZ3P+vjywuJhXiDICmr2c3k
         4lNQ==
X-Gm-Message-State: AOJu0YyUK6rXGgqL5WTlge/vW//JZ0O4Fdxq2O5tN3v9eeRp0imcWZj1
	S+M0X1/A37fsY3JnuNE/2NhQ4Y+xZ+u4wW7odY/11ULDb/1o+3Du90zG/nz29cL1rfMyc7Rtz6X
	3VHpWAgpByP7oj8ipm1EJW+d78zqhrtn9bgMVlm4gWb7Y6K1tq9ZeLSqYfkyPunTs
X-Gm-Gg: AZuq6aI0galm1jVnQ8XHDKnrDr2u34NqsSMVugU0+RpNu9p18lfaJIcQGeO+8CVilZN
	1d9fA+7JADaaiKBtWkvTCN30BWJl026cXTGt6f2yjPnfXzaZeH1CdPZEhGUOiNGfOyxEi/L3063
	HFvfH9xF1LeoZgaNpQQvTNDZYyIB4Cvfh9rW4CxjQ8TM4TWwDFqBLD8Qu+2aWz7cWtxHzYJg/2l
	sLUCaYg8AGB4PEhpfpUYidc+jks6mfzAMIGwymDgjLekgsjOIdfa2kO/5FWplAm/OY6laDuSbvC
	r/EWFx5jt+E9jfn1rQs5wbhZtnuQH50dmXYpu5N+fE6sUZDjARb3VhZNSqhe1JWy/xDb+sH92vs
	sOUTShrAvmC3kwIwApyAoSKunyKt93mtiuaNdQYAyaCRNMr+gP1AzG8XEaeWDq6BOb0as7KAxAN
	L2kSAC
X-Received: by 2002:a17:90b:4a8e:b0:34c:7182:cf9d with SMTP id 98e67ed59e1d1-35272f92759mr8016395a91.25.1768828631792;
        Mon, 19 Jan 2026 05:17:11 -0800 (PST)
X-Received: by 2002:a17:90b:4a8e:b0:34c:7182:cf9d with SMTP id 98e67ed59e1d1-35272f92759mr8016373a91.25.1768828631285;
        Mon, 19 Jan 2026 05:17:11 -0800 (PST)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf37b380sm9291384a12.34.2026.01.19.05.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 05:17:10 -0800 (PST)
Message-ID: <2e707d63-ead2-447e-bc90-e2bbdd995020@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 21:17:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 ath-current 2/2] dt-bindings: net: wireless:
 ath11k-pci: remove obsolete firmware-name property
To: Krzysztof Kozlowski <krzk@kernel.org>, jjohnson@kernel.org,
        johannes@sipsolutions.net, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251214025230.716387-1-miaoqing.pan@oss.qualcomm.com>
 <20251214025230.716387-3-miaoqing.pan@oss.qualcomm.com>
 <fa997674-402a-41cf-9334-f7fc89ae5ebc@kernel.org>
 <4562bdbc-9811-4f73-bc4b-f5a62ba1c965@oss.qualcomm.com>
 <a62401d4-0008-4a69-874a-1870fb690886@kernel.org>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <a62401d4-0008-4a69-874a-1870fb690886@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExMCBTYWx0ZWRfX/NZddKjyDmp4
 YII00v30RHAT6j7EtTshAGO98nxw7hu/EU8pLWPnBnFR8gZNdA3EZ3C1gb04aHmqVFgUYrwq9h1
 4JUbXarxHHZAIFy/aa66LP7NtUvmGIp5slqtQyLX4bbkvsUxMn97CRdnjF3RG/Yt4/sSJhxzybB
 3dgpzfUMXfGTlUiQUUNgoPlsvqEXZzLRMawLwb9WpdXM3egjnAXotkygeXvyyUjZHcDTrNvW1vD
 mTb9VPtJeWMCIP2HBQUTuFCzmpsJ/6AXSJyNtmCNtMHCPKyOGNg7FPxIU4cSoJkXZ8gW+lWobHF
 VRDTBLEFm+nXweFN6AdSDDtGn09M0btUmOr/kLLnWYHkqp4zn0v1DDjGYLUYYAZYiHUVZFi70XQ
 dHQA3827j7XhLPjTcXKQRVSBtWyc3S000+IpDs32/EbVXMGYGdbK9hz2lo2Yes7NmHS+fDQLwAT
 hir5VtF9rDONYkbma/g==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e2ed8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CBmV5aUEGw7Cjg3Rx0gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: oYQYBh1UX6wOyA0KtNS3zthd_j6ulqvE
X-Proofpoint-GUID: oYQYBh1UX6wOyA0KtNS3zthd_j6ulqvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_051713_239370_71E50976 
X-CRM114-Status: GOOD (  19.83  )
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



On 1/19/2026 3:08 PM, Krzysztof Kozlowski wrote:
> On 19/01/2026 02:34, Miaoqing Pan wrote:
>>
>>
>> On 1/13/2026 3:28 PM, Krzysztof Kozlowski wrote:
>>> On 14/12/2025 03:52, Miaoqing Pan wrote:
>>>> The firmware-name property was introduced to allow end-users and
>>>> integrators to select usecase specific firmware for the WCN6855.
>>>> However, specifying firmware for an M.2 WLAN module in the Device
>>>> Tree is not appropriate. Instead, this functionality will be handled
>>>> within the ath11k driver.
>>>>
>>>> The driver has removed all support for firmware-name, and no upstream
>>>> Device Tree files reference this property. Therefore, this patch
>>>> removes the property from the binding and marks it as obsolete.
>>>
>>> No, it does not mark it obsolete. Point me to the place.
>>>
>>>>
>>>> This is a DT ABI-breaking change, but safe since there are no in-tree
>>>> users.
>>>
>>> It's not safe. What about my board using this WiFi? Or Mr. foo's board?
>>>
>>> Still NAK, you did not improve it.
>>>
>>>
>>
>> I think it’s necessary to clarify the background here. As you can see
>> from the git log, all changes related to ath11k firmware-name were
>> submitted by me, and the intention was to allow the lemans-evk,
>> monaco-evk, and hamoa-iot-evk boards to specify dedicated firmware for
>> the WCN6855 Wi-Fi chip. However, the Wi-Fi‑related DTS nodes for these
>> boards have never been submitted upstream, because adding a
>> firmware-name property for an M.2 device is not appropriate and would be
>> difficult for the community to accept. Therefore, the original approach
>> was abandoned.
> 
> You added new ABI which can be used by anyone and your commit did not
> help me to understand the impact on other users of this ABI.
> 
>>
>> The alternative solution is to propose a static lookup table that maps
>> device compatibles to firmware names. As a result, we have not submitted
>> any DTS patches adding firmware-name for those boards to date. This is
>> why I believe that removing firmware-name from the bindings is safe.
>>
>> If this explanation is still not sufficient, please let me know what
>> additional steps are required for accepting these two patches. Thank you.
> 
> You need to deprecate the property and keep the ABI backwards compatible.
> 

Ok, will update in v3.



