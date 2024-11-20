Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FB2D6207F
	for <ath11k@archiver.kernel.org>; Wed, 20 Nov 2024 02:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYolO8RgpYlpWq7Jt4AcWYsfaSE0B0KfrXuyi6/bh3o=; b=GoPxZpc+BK8g038hCE4UjQHwYZ
	io4QMK442ezQ9v/ngNZerqd+uBPZmYApyIGLAUaQb2NoR5p8iDIIBjUZrsnNaX1y8jIfqPpuKF8Ih
	08LrmN1TMDu/ao3OtagVe9ZMzmJXzDxqn1BaroiFLlhm970HAKb+XJRwqvMtvxqhx3aeZsU48Ikyl
	7DuFoXci4LIqpByn1uCqahhw0TGfrNe4W9c/aK+4Bjz/vHaFkacaoBKmDEydB4fq8ITTRXh6ycWiy
	xuwHuMjlzd5NyzGdsWe5YoYb3+Ixkhk6nzqTvT5BYusfgZZUBl3QpiAJTEXlvlKGN004OsrGKJlyU
	NShmD7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDaWN-0000000EDpN-30YF;
	Wed, 20 Nov 2024 02:32:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDaWL-0000000EDoR-1dEa
	for ath11k@lists.infradead.org;
	Wed, 20 Nov 2024 02:32:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJIAjd3004697;
	Wed, 20 Nov 2024 02:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYolO8RgpYlpWq7Jt4AcWYsfaSE0B0KfrXuyi6/bh3o=; b=VFkQDjk0dihLQTQD
	hbvlBEz0raLGaOwcyIfhqIq+v4auhETXoJiQRgKEaCp38NTzspgGzRsI3KpnyhCD
	eKSoRyQyFksJ0Xd2dD1c/bkMM1HzDKC7AQ8bUkV4Lh+tOdvA86xhHPXwoiosaY1b
	s4A1O4wEVdInkTvQj/D/sAhHMTWV+IoLHi69KekJGUbc30bRla4W8foCM3VoJjNd
	ZSF8NnfHhW9k6/1wlp0709p79b+sAlTTI3n7qC2r6cNY10vSE3f40DKn0Hh7WG60
	eGDfQ+kusS9Y5+YxIdEt93V+GFXobtDW+5PALcr4O/eJeectZI/jqHNYe64CKY/S
	nAz6DA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7vdym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 02:32:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AK2WfXl006337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 02:32:41 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 18:32:40 -0800
Message-ID: <ac097ff6-5a17-4dad-89e7-cb4360e23e89@quicinc.com>
Date: Wed, 20 Nov 2024 10:32:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k swiotlb buffer is full
To: Tim Harvey <tharvey@gateworks.com>, <ath11k@lists.infradead.org>,
        linux-wireless <linux-wireless@vger.kernel.org>
References: <CAJ+vNU0dCV7-2gFDPTiOjAV-HCeHZ3H1DjGdqYKo+MGadfrSbA@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <CAJ+vNU0dCV7-2gFDPTiOjAV-HCeHZ3H1DjGdqYKo+MGadfrSbA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BFV8pRtlObf1NYy9NAkO0LnOGk3Q5nvV
X-Proofpoint-ORIG-GUID: BFV8pRtlObf1NYy9NAkO0LnOGk3Q5nvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_183245_559060_7682AF07 
X-CRM114-Status: GOOD (  19.04  )
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



On 11/20/2024 4:16 AM, Tim Harvey wrote:
> Greetings,
> 
> I've got an ath11k card that is failing to init on an IMX8MM system
> with 4GB of DRAM:
> [    7.551582] ath11k_pci 0000:01:00.0: BAR 0 [mem
> 0x18000000-0x181fffff 64bit]: assigned
> [    7.551713] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> [    7.552401] ath11k_pci 0000:01:00.0: MSI vectors: 16
> [    7.552440] ath11k_pci 0000:01:00.0: qcn9074 hw1.0
> [    7.887186] mhi mhi0: Loaded FW: ath11k/QCN9074/hw1.0/amss.bin,
> sha256: 5ee1b7b204541b5f99984f21d694ececaec08fbce1b520ffe6fe740b02a4afd7
> [    8.435964] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0x0
> board_id 0xff soc_id 0xffffffff
> [    8.435991] ath11k_pci 0000:01:00.0: fw_version 0x270206d0
> fw_build_timestamp 2022-08-04 12:48 fw_build_id
> WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> [    8.441700] ath11k_pci 0000:01:00.0: Loaded FW:
> ath11k/QCN9074/hw1.0/board-2.bin, sha256:
> dbf0ca14aa1229eccd48f26f1026901b9718b143bd30b51b8ea67c84ba6207f1
> [    9.753764] ath11k_pci 0000:01:00.0: Loaded FW:
> ath11k/QCN9074/hw1.0/m3.bin, sha256:
> b6d957f335073a15a8de809398e1506f0200a08747eaf7189c843cf519ffc1de
> [    9.789791] ath11k_pci 0000:01:00.0: swiotlb buffer is full (sz:
> 1048583 bytes), total 32768 (slots), used 2528 (slots)
> [    9.789853] ath11k_pci 0000:01:00.0: failed to set up tcl_comp ring (0) :-12
> [    9.790238] ath11k_pci 0000:01:00.0: failed to init DP: -12
> root@noble-venice:~# cat /proc/cmdline
> console=ttymxc1,115200 earlycon=ec_imx6q,0x30890000,115200
> root=PARTUUID=5cdde84f-01 rootwait net.ifnames=0 cma=196M
> 
> The IMX8MM's DRAM base is at 1GB so anything above 3GB hits the 32bit
> address boundary. If I pass in a mem=3096M the device registers just
> fine.
yeah ... that parameter makes kernel alloc memory below 32bit boundary, thus swiotlb is not necessary.

> 
> I found this to be the case with modern kernels however I found
> differing behavior with older kernels:
> - 6.6 and 6.1 the device registers with 4GB DRAM but crashes on client connect
> - 5.15 devices registers with 4GB DRAM and appears to work just fine
are you using Linus' tree or the stable tree?

> 
> Could anyone explain what is going on here? Obviously there have been
> changes at some point to start using swiotlb which I believe was all
> about avoiding 32bit DMA limitations but I'm not clear how I should be
> configuring this for IMX8MM with 4GB DRAM. Maybe my kernel IOMMU
> configuration is incorrect somehow?
there are quite some options associated with IOMMU, not sure which one might be causing this. But basically you may check:

CONFIG_IOMMU_IOVA
CONFIG_IOMMU_API
CONFIG_IOMMU_SUPPORT
CONFIG_IOMMU_DMA=y

> 
> I'm also unclear why there was no apparent problem with older kernels
> such as 5.15.
> 
> Best Regards,
> 
> Tim
> 


