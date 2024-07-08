Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54250C41513
	for <ath11k@archiver.kernel.org>; Mon,  8 Jul 2024 23:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwlzlrrpAQwyHg+0JpuMvg+EFv8Z+c35Dq/aQYYVz+w=; b=NzL9IBuy6/MjL5jai/MrOJ2Kji
	qc9uxBarrNbDYfKhpWP/dGFrQUecCVqt8oo09xndhzCqqw4NdZIw/D/YHbzvzavvUXCS67FfBM5Xp
	3rOnXCPcoPxxoMc2BdZZeeDpFUiCzYD+HZ0tIz3IwOTuxq9NRODxhlqF6yuyWK4izYMqyLD4xGXIH
	yaLOVGnGGXtEJuLfhkAkR4lkd16KUArYLLWk6BCXrfxyHWQtJZ1r/xH55ERsnfO3/oxY10g0/+jpH
	xU7DrawWo0i4m6uyiz5WKRdNCMJ2nEo+EN3Ej415ahulhbj5b/retu8ynQNaUYplM8Myc/GgyyEms
	r0kDZeLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQxr3-00000005KkQ-0B2e;
	Mon, 08 Jul 2024 23:33:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQxqz-00000005KjS-3iBl;
	Mon, 08 Jul 2024 23:33:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468BGnL3009360;
	Mon, 8 Jul 2024 23:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwlzlrrpAQwyHg+0JpuMvg+EFv8Z+c35Dq/aQYYVz+w=; b=pznOLzw/PFMvD1ag
	+fNIz9HBFpr2wUQLoY2OwUO7QEus3aa1xsHp8aDllZwKdq/58E37s8n+VQuwrTtE
	yXLrWFlCkjkbw69RrantmaQQtI8jXcDgEji/W6K3sRc+Go0edFq/USoDQs6tKgih
	avx1SzDotu7D+1Gf5WRjE6r36LKj/S+Q88pEeNHV9NaTnmxIrBZJuyWHhJUc1YFE
	n8bmi2uhL3rr7q3KLYP1FTKxzjfyZWNWG5kMe1vFRmEwxIpbXHctErXF1TuxwCi1
	euNOQxAlLxm+aiLHQEVZ1Au+NLHYYVU1fq2fMwEjOgV6UHsoengCx4ozulSx/PnC
	oFquXA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t506f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 23:33:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468NX1Qq002467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 23:33:01 GMT
Received: from [10.48.245.228] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 16:33:01 -0700
Message-ID: <902a09ac-56ab-4d3e-ad17-b098ea2feef9@quicinc.com>
Date: Mon, 8 Jul 2024 16:33:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath11k: fix array out-of-bound access in SoC
 stats
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240704070811.4186543-1-quic_periyasa@quicinc.com>
 <20240704070811.4186543-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240704070811.4186543-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bZCI_Ca_4HowEdhx9SDhBk89s-HUode3
X-Proofpoint-ORIG-GUID: bZCI_Ca_4HowEdhx9SDhBk89s-HUode3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_13,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=672 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_163306_079354_6197FA5B 
X-CRM114-Status: UNSURE (   8.23  )
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

On 7/4/2024 12:08 AM, Karthikeyan Periyasamy wrote:
> Currently, the ath11k_soc_dp_stats::hal_reo_error array is defined with a
> maximum size of DP_REO_DST_RING_MAX. However, the ath11k_dp_process_rx()
> function access ath11k_soc_dp_stats::hal_reo_error using the REO
> destination SRNG ring ID, which is incorrect. SRNG ring ID differ from
> normal ring ID, and this usage leads to out-of-bounds array access. To fix
> this issue, modify ath11k_dp_process_rx() to use the normal ring ID
> directly instead of the SRNG ring ID to avoid out-of-bounds array access.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


