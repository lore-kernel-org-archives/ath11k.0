Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697BFC369AB
	for <ath11k@archiver.kernel.org>; Thu, 24 Apr 2025 10:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVJzyADUJa9JCbxNjWk8+v6iGya/OGo4gF08eH2n2mk=; b=AvXHROYHvP709qkhtaB/Igzqkn
	YffI7hAQz93M6wQBG9mdXhi8FlpzD7wgfmtVSHZ32Sp91Rqf5mZ/OexfPvU2wh0H0GXQsqulfGQr+
	egrE6ob2GaYRbIAYaJ2Lplv1fUYbR10n9LI01Dtd21/0X3q9H9qlubiQx+OfDWGhAM+OkLze3m9ao
	yx6MPBxd7WpIHtjjPLdSvRJFqwevW+H/Zd9iuRx+uS/rHwVzN/Dk2JCdOpewX/ACL2qbBXFDm2u18
	aN7BntHXppp4o701WbivxsxBNex+SQ1bt0vERcGlH3jwdkMKaOFitj+hbLTzrR4MlOKfqTLZ8u0e6
	xn95g7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7u8e-0000000Dk7S-3Xvt;
	Thu, 24 Apr 2025 10:49:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tKd-0000000Dah7-3ulU
	for ath11k@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hVJzyADUJa9JCbxNjWk8+v6iGya/OGo4gF08eH2n2mk=; b=gF1Xp5/Pc5kfaAS/npx1yZMaA1
	sv7CVofufrIs02dcTspzGOVk1Nh/T4JZPe5AXJXo/TqVgLnXdTbcxXkfOU5G4jls+rWkr1HpM5S6s
	JkC/+rYSBGgUZiLCFGQTB5oyERugIRhiHA1JTMlnu21BwKu4ZD7BcT0zDLyIUK6XGIsLem9v2CeOc
	Fx+2A24SJd/YICS+1ZKhA60PhYFoXVMbYgszhfHsccYDHLnbS8qHyZg/B6zrP1AgCsniMPpFIJagJ
	mjnDq1jAGpmSRRNqRlcPkJSPez1+BRxKlsNGm/TSsROsdKtzXs7KHeuJQm4IL2ulsbenDuioCj/Mq
	8RnU4O+w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tKa-0000000BiSq-2pG2
	for ath11k@lists.infradead.org;
	Thu, 24 Apr 2025 09:57:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F59m016949;
	Thu, 24 Apr 2025 09:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVJzyADUJa9JCbxNjWk8+v6iGya/OGo4gF08eH2n2mk=; b=nf7OePWKLMW3sFID
	Opams83InocYA7eEQQJ0LAwvHLNqfHq0Q6btXjm/D7A+vye7Kop/rwlZt9Hm7fb1
	BCLS+fqRTQ4uQedGRunswBR4ocxXXvnQYHWFPahYyjFSOvwAzCpeO1cgP6JtAYdX
	CEudH5wafhDQrbVDvUjpjs0MsfXOzJyXRybiVV11BhuRi23N2DWWeRHZgYPu4QBE
	zpUKvscN1IoXWYIolv5Cf9cym3wqDCNzyNkB+9jKHCHtEv2PvZ6Lt0m6NfMj7qbM
	2FynyNsTrNk+G1TqKYXQySbWbukZeIkDoe+O3bQL6mq/HY1kvnk8nS+isGSWkU2S
	DMHTLg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh15240-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:57:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O9vBIM009975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:57:11 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 02:57:09 -0700
Message-ID: <d4089a58-d365-4360-b46d-3adf05569a85@quicinc.com>
Date: Thu, 24 Apr 2025 17:57:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: pci: Fix msi_irq crash on driver unload
 with QCN9074 PCIe WiFi 6 modules
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: Balsam Chihi <balsam.chihi@moment.tech>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
CC: <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <20250416100939.282481-1-balsam.chihi@moment.tech>
 <0e129e2a-67fc-48cc-9773-efbea3f7391d@quicinc.com>
 <fa16bad6-305f-77c1-3f56-703564e2dfee@quicinc.com>
 <CAONkfw6m9O_6FZHBrPYdpv+=AxSgsbh1T7+GaS+U+bnjyVVJvQ@mail.gmail.com>
 <3da5d47b-993c-405e-841f-1d16d8715610@quicinc.com>
Content-Language: en-US
In-Reply-To: <3da5d47b-993c-405e-841f-1d16d8715610@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kuvsMtTxeb88E5zjGy4iT2gDdoY5U6nd
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a0af9 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=JfrnYn6hAAAA:8 a=IQanQaj2lkx_2isDzOwA:9 a=QEXdDO2ut3YA:10
 a=grefteXnG18A:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: kuvsMtTxeb88E5zjGy4iT2gDdoY5U6nd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NiBTYWx0ZWRfXwMXGJ7ATQzGh IpCHtQOrBUiVpPqwjuT8zvIXJftrZdyGn+AnxBwko8tQRAyDb0A96L33Q2d07bf3YBJ+vPCNrC0 W7z0xvMC1Ll7LChc//SVifhoa2OFnoi5wm5psPapZvMmolt2CvyK9rBwd3tXEPkmeSLiTzZwd3u
 bQWoIu3FXro8LTWv8yTRYFg7PRkT2TqvetecfyhyIXlPCBIfD56dnkFGgbNmp7f0E3xPM8x3kMw 5x/8DMoJaZ9ZojU8U8z97S/wdTJGxqOwstYpIX8iXXQZOw4WKVGyDxlASX1w3zOwuwnLvdpteuJ kzEiL3AHEkZR6Gn8aEpdZcRb+bT6cpqeQ7il0ksK4Gm1a1fFZ/TYks+cEAy+Y+EyqalG9OUP3iF
 cH21EwSUTpq5fPeo5KefbxwVUCRbsWkB94O7cjvWz9LErJ3eJdYNsCxA4p5ZPVkow2trCiCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_105721_041417_B5BB7ECF 
X-CRM114-Status: GOOD (  14.81  )
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



On 4/24/2025 5:49 PM, Baochen Qiang wrote:
> 
> 
> On 4/24/2025 5:25 PM, Balsam Chihi wrote:
>> Hello,
>>
>> @Baochen Qiang,
>> Thank you for your feedback.
>> I tested unloading and reloading the driver and it is enumerated,
>> detected and operating correctly.
> 
> Different hardware platforms may have different behaviors ...
> 
>> And I understand your concern about other chips, and certainly it is
>> not the best way to implement such a fix.
>> I will continue debugging to determine the root cause of the
>> synchronous external abort.
>> So this patch is now just a workaround to fix the kernel crash when
>> rmmod the driver and reboot the system,
>> that i wanted to share with you to attract your attention to the
>> problem, and seek for help.
>>
>> @Vasanthakumar Thiagarajan,
>> Thank you too for your feedback.
>> Yes, I understand.
>> I will enable the debug_mask and check the logs, like you said.
>>
>> I'm wondering if anyone else has the same problem with ath11k_pci.a
> 
> There is another issue report with the soc_global_reset register, although it is reported
> on another hardware.

forget the link:

https://lists.infradead.org/pipermail/ath12k/2025-January/005244.html

> 
> Vasanth, could you check if the register address is correctly defined for QCN9074?
> 
> #define PCIE_SOC_GLOBAL_RESET			0x3008
> 
>>
>> I will keep you updated.
>>
>> Balsam.
> 
> 


