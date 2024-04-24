Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CEEC4345F
	for <ath11k@archiver.kernel.org>; Wed, 24 Apr 2024 19:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmEz90mLg+X/Fk3zU+3vWeVOWu5yjEYpf57mGWxtqJw=; b=ymV/NX/AxxC/D0Y9mS4ReibAzU
	uviVycEUXJjyqe97iYutZEp8Iklr7r5AVLMqBwFehUxnyArBq7+EMIoM++okucr+qMgxu3ZzCYTSn
	8e1gtZ1GZlWFbd16U0nUstNhx7yMGDVBCoAhkM4eyMUue1JrCnNBt3acd/4Yy6vss5bJc67U/dHMF
	xhVIXNkUnxeJiL/O1eb/UX9gGmCWlSyrUQI8H4RFsxCCX0s9Xxbw+BgSH1bhyAPK3PTiFgRHmDWy2
	6j+/A+PbhK/haU3tSeRVXuDbxnk3ZNcSktbuzM6hsjplQlSYnshGXCrzdY4quYdmsTdYr0OIQtN4E
	QInNpq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rziBT-00000005dt7-1RFr;
	Wed, 24 Apr 2024 19:21:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rziBQ-00000005dsB-07S3
	for ath11k@lists.infradead.org;
	Wed, 24 Apr 2024 19:21:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43OImTrH027552;
	Wed, 24 Apr 2024 19:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=FmEz90mLg+X/Fk3zU+3vWeVOWu5yjEYpf57mGWxtqJw=; b=fv
	kNQy0wA9E12T0UPiGzjWD7UW/Zkha0w1tjfKVpP4HMVmLwhfVq6epk7iGvwB7KkI
	wsgRjEKqLavkqyNYPMdPSTnGfLh+byCKiqrOnWutZxB5hHuU7JZvA/Q1do6MIaPN
	Q13oTp5W4ccd5BM+qUCU2vn8bku2dA6apoaU0FDnFiSO/UvA+RjkNZ2U75J0V45M
	lr7Y1n724M4x8f+TT9uZPr9nFn9Pgu0UE/lmTCYG7eFcAX5pGJ9ygQkX/1KUtiX6
	udwH2kHY4RpYbI02EgvPwUOLnX9AtdpbiIlgsJkbawkvPPYXVfHpiMkKDq1I2f66
	RiBE5cUtJl5+15t+335A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpv9fj0td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 19:21:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43OJLTra029005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 19:21:29 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 24 Apr
 2024 12:21:29 -0700
Message-ID: <470c1d0a-a090-4a50-91f6-b7bab4ea9441@quicinc.com>
Date: Wed, 24 Apr 2024 12:21:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: move power type check to ASSOC stage
 when connecting to 6 GHz AP
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240424064019.4847-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240424064019.4847-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MTfgmK8p1UtWyLBsgQMA50szj_Tz0kVD
X-Proofpoint-ORIG-GUID: MTfgmK8p1UtWyLBsgQMA50szj_Tz0kVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_16,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_122132_241941_013BCCE0 
X-CRM114-Status: UNSURE (   8.90  )
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

On 4/23/2024 11:40 PM, Baochen Qiang wrote:
> With commit bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
> ath11k fails to connect to 6 GHz AP.
> 
> This is because currently ath11k checks AP's power type in
> ath11k_mac_op_assign_vif_chanctx() which would be called in AUTH stage.
> However with above commit power type is not available until ASSOC stage.
> As a result power type check fails and therefore connection fails.
> 
> Fix this by moving power type check to ASSOC stage, also move regulatory
> rules update there because it depends on power type.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


