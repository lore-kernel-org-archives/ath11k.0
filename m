Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105ABC02182
	for <ath11k@archiver.kernel.org>; Tue, 21 Jan 2025 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ngsf6pE6RxloFaystJ2T5yhCoZODdfOLR1IQLbOuj0=; b=4JIcXb7IRpGFZEwX9fWAepUv82
	fZOZZZIsYShxP8gtx9gC2WWcE9lAllpC4lsFzaEr9b0fgqA25mGJk89EWeE803mDDZx/d1Xesb61x
	WTnhZ2cg7T9zGEBfBQRI0u5CbTK6wfbuxcJ1BDwlV7hHMPkwxiqFVoU1xizoKTDY+lQ401n4OS5vF
	J414fy5sYGDsDJO0qI+D9HN+sU35my6qVI20ELHuzLpWwALiO2OR99NVzyCXPZkIFROx0UFMiCJF7
	zI9GbWQxRoMp+guk1y6tGpMce+TSNedjZZ/sGKzWoi3CEthGNusLJ+L0k3ihK6cRBf1Smbx20+RgS
	ftZSOCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAAr-00000007MGp-38F3;
	Tue, 21 Jan 2025 09:03:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAAp-00000007MEv-2tHe
	for ath11k@lists.infradead.org;
	Tue, 21 Jan 2025 09:03:52 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8YlbI019356;
	Tue, 21 Jan 2025 09:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Ngsf6pE6RxloFaystJ2T5yhCoZODdfOLR1IQLbOuj0=; b=XOacLwHX7chazdFx
	u61cz0qpOPmnvVl6g6aNjJIR6/FkScjfOob+qzJkQKVLGVYT2/Gnh/dDiyhCRyxB
	lkBuePxjCaTy3ctfelSHY9y9zGAoVC8nN5i/ojnS+HBFTfgo9vAILnd8zjvv4fGi
	uypbnc9TAsV4k/H3ZQkWba4qUzTerJ2f0fBw+KlirWBoHK1F4D8XneEp4gg6h8s8
	p0R4350cos33vtGhprYqF3mPEzshVw+EZjAt78BhnZ0zPWFTLVoK1yZ0vs6UJ/OG
	2Gg91no0X4KOxYQ2hQ7ai6+cCQsk6Hq7VVVXpDCVCuvKnI2svA3FZXdZN982s/8+
	AM6gxw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a2wwgtfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 09:03:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L93ov3000872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 09:03:50 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 01:03:48 -0800
Message-ID: <bb4e2001-dea8-4efc-ae3a-babcce8acb0f@quicinc.com>
Date: Tue, 21 Jan 2025 14:33:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] wifi: ath11k: update channel list in worker when
 wait flag is set
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250117061737.1921-1-quic_kangyang@quicinc.com>
 <20250117061737.1921-3-quic_kangyang@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250117061737.1921-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ebZGbjWj3i8OSfszsqJH1meI1etkCwRz
X-Proofpoint-GUID: ebZGbjWj3i8OSfszsqJH1meI1etkCwRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_010351_732868_15D72787 
X-CRM114-Status: GOOD (  10.37  )
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

On 1/17/25 11:47, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> With previous patch "wifi: ath11k: move update channel list from update
> reg worker to reg notifier", ath11k_reg_update_chan_list() will be
> called during reg_process_self_managed_hint().
> 
> reg_process_self_managed_hint() will hold rtnl_lock all the time.
> But ath11k_reg_update_chan_list() may increase the occupation time of
> rtnl_lock, because when wait flag is set, wait_for_completion_timeout()
> will be called during 11d/hw scan.
> 
> Should minimize the occupation time of rtnl_lock as much as possible
> to avoid interfering with rest of the system. So move the update channel
> list operation to a new worker, so that wait_for_completion_timeout()
> won't be called and will not increase the occupation time of rtnl_lock.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Co-developed-by: Kang Yang <quic_kangyang@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <quic_adisi@quicinc.com>


-- 
Aditya

