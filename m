Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A152FF8864
	for <ath11k@archiver.kernel.org>; Wed, 29 Apr 2026 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvKCNndBBkYUc0nxuFbkUYiO0WRhlXQti+/4X6+udB0=; b=0XeW2iraMatnPRhsZW4tnmGg34
	Dw3IuduFHiOAjqfhTofE1i0yRnH57hyFPoNjiQN1F3KZrEbK5ttSr1v9vjs1BrxYeX/Dr5p46kuuB
	WxiMfeegIrC0Od31X4VDiCmAM9tX50sMSJxYFHrr0Tw8nH4lNig0x/aUDnPuDDJhzYBsmvV9BnnHg
	f/2OXf0iNSF3BpfH/ySBq9jAkv164gL2KZY6aDN2AdlzyDpVfnoP7OtkBYm4J5mWH5MVrOw6r8cbY
	46UcCUf2/Fr+jB2jKxOamhOqspr3QOMUoKA+gLCvrr7G39UQUBAAtyKxriLVY3dn9W3ZfJpuLtNBL
	FL4YO33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzH6-000000039FR-1NFC;
	Wed, 29 Apr 2026 07:24:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzH4-000000039Ez-10jB
	for ath11k@lists.infradead.org;
	Wed, 29 Apr 2026 07:23:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T6F1Nw1282573
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 07:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UvKCNndBBkYUc0nxuFbkUYiO0WRhlXQti+/4X6+udB0=; b=Ljn809wLwDtH+Jki
	+Z70R9qKW+U6dKJhlu64OADISW1Iw0ExYW0z0WuLKYXgoIcn9l58xSh6Z3EaRJKn
	+opWAOajEVw0bx3Qs/mKFyy0yWazAua7CHkzC9CCsJCwJDW/niKrzLCPu4J3/xEJ
	lH1Zx6hrAOLLQhYJpu+9NiZJ5/DFjHNX8bLEm6jP+fVceniOZKN4mSdV2RUzIY42
	zx8ps02linokJCndkAeEXE6mGqz5Ca4OWKSjwhsZ1oJmRWttjKwNfRQrPPjyDCPW
	Ayl49f5E3CsHgs/z6UCGMZkyfnZ2PdI1sbkSYzFXEp/FoEedNs3Y1SHhG6D7hVrr
	IqJyzw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj808g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 07:23:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso16071666a91.2
        for <ath11k@lists.infradead.org>; Wed, 29 Apr 2026 00:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777447435; x=1778052235; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvKCNndBBkYUc0nxuFbkUYiO0WRhlXQti+/4X6+udB0=;
        b=Th7pTxKBLmvnXpC2IH0lT/U6xX6WhqxNOmllq90x8zt5/bsuoJOyd2695NfXSZ54qv
         7LiOqFh/IlNGMAUydwPlF7yqde0Pe8UnSoxQTn8cOJ+t7dNPOmrtuHJpfiCGzEvKexiw
         gYcux/bEKNtDD4p5jXl+tGz3NzoYzRb+1i6LmC3mmXV1I8wx5AGNOVq8JsZd4UZUI1UK
         goMWlwLOLcSjFUs4kjFL5jiGZ8dYbi2UaZ1M8Yyi159hWam3XRn3azLDMTtknPLk1eaK
         dUBe5PZUPv0dDsPHNEUSo/UY3peSkb5074V04AYbT4U7Gnz/ntRXohZdon4ywbecEDNK
         NfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777447435; x=1778052235;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvKCNndBBkYUc0nxuFbkUYiO0WRhlXQti+/4X6+udB0=;
        b=qo3uJB7AKa+MqSz4hmoDki55y8v5wlng869sPPAXCDruSZWeiuxyDaOa+Rsj5UpYoz
         3+Yt9vQhoxRx2Pz87nKufXlAFlgTMhT1Ge7KLnoBdJfkoaTFppY/uX3y5BsLbc9+rxv6
         1G/rLexVsCn16XuFKwBNEm8izQj0iEEyuZqpxrmzwMaqxh6m/oVIPG32rDVUfMqy349O
         kAs2Ma7tl7gQokDgu1zKYQc3YAD7nSwF/gpF57P7OqAG0qHde0rohtCZ8fvzFiQW9PHC
         8oQIGYHLSrB39Wy+FGZaDGGCOHk8mUo4ck4Ay9Q9dkGyIIL1XeQm60f02z5BgWKQb8ub
         OISA==
X-Gm-Message-State: AOJu0YwWeLykIFluYyk+9Gquc2d0FAYMc4gXLRYvQdpx3sjmJDZK6UWD
	22kL7oGxLB+rcPLVXpcuFU/FPkAO2eCEBp24PekRbLFo0CPTBu1/WZLGfqUooJkI2l877WAljGX
	Ro17ttnEkN2dVkdzbm1ZLH3LavG5+DbFleiQl/ZkzBqBSZNHl/ThoeYKxZQl+XSPA+XG74VgH
X-Gm-Gg: AeBDieuP/5lw26iOG7j0WXcO0wdil3WUrKLmBEsUGP1Vg+jW+9pgkhVGWtnvYUPaE6Q
	88GMcEiK2zhdLxmQ2IAO4e4bkzbzm8B3yk/XFkj+PI2D98u70EUp2v9mr/Gk4xCeBFZKMM+G2sO
	iIZTnBbHmtDh5Ttl4HHPuZ2vs+/VCwZ81RVWdynJqCyMRDL25fyAHk59rciAjiLv/rN2BbcCNBt
	A/ydD4j4vuzmw05VEwwJX0QnCgHin2dEXnxnJpq6R27EQTmWKvNSmwvlVJoIB+axDHi3o2wIMGQ
	WZM+YS7ZLpeVw6JkV/LsfPgqxqIQtaH0bgllpmBNRXU9J9LFyHS4FWXdvctatqVw55GKlyX7GBi
	Shaly5o8X3n2YKh73IUTVmrFc6xUZwqNJFy0Iy1tQspXxHiBcgtGyWuVshwTWEers2ArARP+Qp2
	x+wcHLBzalpFpsOwFWJZVP3aLR4+HiWQ==
X-Received: by 2002:a17:90b:3fc5:b0:364:74c1:53b7 with SMTP id 98e67ed59e1d1-364a0adec05mr2719573a91.2.1777447435141;
        Wed, 29 Apr 2026 00:23:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc5:b0:364:74c1:53b7 with SMTP id 98e67ed59e1d1-364a0adec05mr2719563a91.2.1777447434764;
        Wed, 29 Apr 2026 00:23:54 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a4180219sm1292125a91.5.2026.04.29.00.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:23:54 -0700 (PDT)
Message-ID: <0ae92497-91b7-4eb9-951a-dcd2258f538f@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:23:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        stable@vger.kernel.org
References: <c0d2b6df-4109-4c93-b229-7eb2d3fca6a7@oss.qualcomm.com>
 <20260429051414.6625-1-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260429051414.6625-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jfTAx_VmlRoL1bXToNPpb9feQ5vkCf9K
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1b20c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=hnrE4znNAVy8RLhoGhIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: jfTAx_VmlRoL1bXToNPpb9feQ5vkCf9K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3MiBTYWx0ZWRfX9lsm/yQkYDZI
 qKY83FC8bbCXqlZCwu9jziTsHVwF7vk2T355/d/duxJryYrvUg2RrpkuAPHEwldMFVRPZNV4LBD
 zlyi9kX2+dDnScRWybnvWn8Jlrb5furF0/uaPb2BxUNW96gtZ15dAESPpMH5qzcyJupWlgZv6et
 mhllXkkmGSygEdBXFRuVNQ+kwo4oSx0nV1XhsFQRZergA8mYoc2Shj1jjw+KmFeKBrxF+a3lurE
 YCMCzQrwicjq6DfhyCbvOSyHDEOx5VvP8nR9ZHxcbycO/NqsBjC+GgD8wWne1bnZi8R+YUGeiTx
 ilMFlXSRsQzsqn/GQU3hDrnDXQXh2EuDc0qFUZ+5G5jXndi94ugwOt1qQ16RCnlKbqeCCJU9nc3
 86BWClUVSGTp8l6XURl+nFU9CkUYWzipmJCFVKczjYKwuIvQzixQeAhlJSBz4yEswDc1nOilhlg
 DhyUdw0a7h3nAWBvYDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_002358_422086_C5C8B7E1 
X-CRM114-Status: GOOD (  16.73  )
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



On 4/29/2026 1:14 PM, Jose Ignacio Tornos Martinez wrote:
> Hello Baochen,
> 
> As I try to comment in the commit description, the warning is not at
> the intialization, but comes up when the device is unbinded after a
> problem at the initialization stage, because due to the problem the
> buffers were released (probe). Later after the problem, if the unbinding
> is commanded the buffers are released again.
> Setting to NUll after releasing avoids the double free.
> 

OK, seems the first release happens during the error handling path of
ath11k_core_qmi_firmware_ready().

> The easiest way to reproduce it is to run in a VM the default upstream
> kernel (that is always failing on VMs) and just unbind the device
> (ath11k_pci).
> 
> The same problem was fixed by me for ath12k driver here ca68ce0d9f4b
> ("wifi: ath12k: fix warning when unbinding"), and I have seen the same problem
> is also happening for ath11k driver.
> 
> Thanks
> 
> Best regards
> José Ignacio
> 


