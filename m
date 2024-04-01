Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1149CCD1292
	for <ath11k@archiver.kernel.org>; Mon,  1 Apr 2024 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1yud4T/Qfy8bPeujD7Hhp9XeM41Q8uM6jKeLGJNzjQ=; b=p9OZ9dNogRx2RR4feajt3XMQJ4
	i6syzQwfcnHxFG8DpvBYsSEAwy7Bn8n/bqAjV9KVIV7abGNZdTg+7XRnQUkBlRDKveahbtBvaIkCg
	7MgavrtzJ+U6dlOAvh07tir2lXWrVFcIi4J8xj2BU+E84f0FyVFyM83qgpN9l3YM5YKYpaN5oJPpM
	uCXlFKigJwmNepmDHyW46hlEFiF7Mk0X8p1EHu66/CpnYLPIUFQ+Z3vBzM4tvG1ICxAHYcGyJ9hfH
	rsu6QTeAniCbZoQzB4Xyax1hjdOngJtLBxzyOwHJKDU/D665VMb2ZnOBJqZuUis5Mqx7m969wFQxv
	vGNc/QIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJ2S-000000086fU-2LDc;
	Mon, 01 Apr 2024 14:53:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJ2N-000000086bf-0MyR
	for ath11k@lists.infradead.org;
	Mon, 01 Apr 2024 14:53:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 431EVVrh014860;
	Mon, 1 Apr 2024 14:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+1yud4T/Qfy8bPeujD7Hhp9XeM41Q8uM6jKeLGJNzjQ=; b=mw
	s9hjs9/1mvNnQwwonQnLJch7CJfU2RY93UH3VEVXoMH2Brsr1CG4r6yHFr9ugbDx
	29so7NOlvCrmBJRGF9aTGnXh9zKzLLxjywgDk9lBXl0KT7rz/8/4VFZoH1IClG9y
	9I8Y3G6QjzQ1it59Uw2lo20EFE0W7uZMPGJpkyCHvAwERxMvVnYS67HPbuXnyXuT
	B6nzeVMj4S/AHUY8kz6kYLlm6o6e+fK6EWP5ZKRvNKk6MkWx1SG1mpW7ML/ud6BN
	2RtMRvxE9pir4M6y8lu7fGtcZugbQtu5mTDeWg+CG/BKzkn9yPr+b055huP4cJ6o
	5IaktBem91Bb+ZZstdNQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7xrfg28q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 14:53:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431ErLWN013359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 14:53:21 GMT
Received: from [10.110.126.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 07:53:20 -0700
Message-ID: <19778bfe-19ad-4ee4-8f3b-80e7b124571f@quicinc.com>
Date: Mon, 1 Apr 2024 07:53:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wcn6855 2.1 - slow download speed on any pairwise cipher except
 CCMP
Content-Language: en-US
To: Yaroslav Isakov <yaroslav.isakov@gmail.com>, <ath11k@lists.infradead.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QeE7ESJXZmQBh36dNLPkcc8Y6qR7NILD
X-Proofpoint-ORIG-GUID: QeE7ESJXZmQBh36dNLPkcc8Y6qR7NILD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_10,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404010105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_075327_325728_E936FDD1 
X-CRM114-Status: GOOD (  14.53  )
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

On 3/31/2024 8:49 AM, Yaroslav Isakov wrote:
> Hello! When I tried to switch my OpenWRT router from default CCMP
> pairwise cipher to any other, supported by both my router (Asus
> TUF-AX6000) and my laptop (Thinkpat T14 Gen 4 AMD with WCN6855 2.1), I
> saw that download dropped from 1Gbit/s to 100 MBit/s. When I changed
> back to CCMP, download speed recovered back to 1Gbit/s. Upload speed
> is good, though, for all ciphers - 1Gbit/s.
> 
> Initially, I thought, that issue with either router hardware, or
> openwrt driver - but, I tested the same settings on another laptop -
> T14 Gen3 Intel - and with Intel WIFI, both download and upload speed
> was 1Gbit/s on any pairwise cipher.
> 
> This issue is 100% reproducible for me, it happens all the times I'm
> switching to any pairwise cipher other than CCMP.
> 
> I'm on Linux 6.7.6, compiled from sources on Gentoo.
> 
> Here is my dmesg for ath11k:
> [   13.092519] ath11k_pci 0000:02:00.0: BAR 0: assigned [mem
> 0x78600000-0x787fffff 64bit]
> [   13.093400] ath11k_pci 0000:02:00.0: enabling device (0000 -> 0002)
> [   13.095723] ath11k_pci 0000:02:00.0: MSI vectors: 32
> [   13.096260] ath11k_pci 0000:02:00.0: wcn6855 hw2.1
> [   13.974707] ath11k_pci 0000:02:00.0: chip_id 0x12 chip_family 0xb
> board_id 0xff soc_id 0x400c1211
> [   13.974732] ath11k_pci 0000:02:00.0: fw_version 0x1106196e
> fw_build_timestamp 2024-01-12 11:30 fw_build_id
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> [   14.315774] ath11k_pci 0000:02:00.0: Failed to set the requested
> Country regulatory setting
> [   14.316046] ath11k_pci 0000:02:00.0: Failed to set the requested
> Country regulatory setting
> [  337.889222] ath11k_pci 0000:02:00.0: failed to enqueue rx buf: -28
> 

There was another reporting of that error in this thread:
https://lore.kernel.org/all/5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail.com/

+Baochen Qiang for awareness

/jeff

