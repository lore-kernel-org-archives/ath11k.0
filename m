Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E33CDB465
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEjLtQRU0nVicYm57UcvHKnOui93euqxg3K6317Gurs=; b=tQJInHrXOTZE93
	5LaND5WREk+EG1bUzUMO76igUwn9vWAvygQdTGO6tJpWQSwzuS5rc3NIfQaFX4oFZrvz9LUcQTcVH
	vByTz1B2h8jKaCZmMaquJ4Lf0a6AVHw+Zo7qEooSCrsu8JWSwoSi3dDiM12FC/XLmUCMEtOnA9Fgk
	gvRh7UfGAV9WldCkRwgB1Z8uKPmUwrX5+Nj5Sfs0RSAYRYcW8d1+uRo/faIY11ar8eac48GrQwdPr
	tP4PL7WZhTM8m+NNOlLqJnZiOOOOKdcbNZ+l6D0PJo4tDNH2NwAVH0Jt1Riqkl+nchSMoDC0b06xS
	35GhJGbSsfcfqX7Z3a6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWbb-000Orp-0y;
	Thu, 19 Oct 2023 17:14:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWbZ-000OrR-03
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 17:14:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JGM1t2018904;
	Thu, 19 Oct 2023 17:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zvoS9bMPhzzMF3tou0VZrB8JXEoraLA843fYSqg5hws=;
 b=jvo6izvlWGta4R14+0jzMk3QcM0AUxLPrP0kUP4EyxxVm13Uv+W99wWjVbvWt+BqdoO9
 huyg8EvjYX5TNeRqz6gqdbvOXQOGy2ktT24YkSGeqsYHq3As8xY166uge2p0+17MBOtA
 QpM7sBXyPkafBMpuKVXvEySp0F3MHNAOpP76++7c+BFkxV+3SWmKcHglD+FjoTEfa/rJ
 W3n8cNfultTVuzXq+8v2njE43MnMQz7pfuCAfmp04VFOymi7Vhdx5Kn5QPumGGuNDv8i
 FhKbT9Xfkp55TS9kP/IuNoMMC6mfcDLU0CQrTdkEU337TUZJjOpuQHg0S7hp3pEWJPxR uA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tu1t6s24m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 17:14:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JHEbDI021346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 17:14:37 GMT
Received: from [10.48.241.70] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 10:14:36 -0700
Message-ID: <acc17669-2023-4658-a0d7-a3317aaf93ad@quicinc.com>
Date: Thu, 19 Oct 2023 10:14:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath11k: fix temperature event locking
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20231019153115.26401-1-johan+linaro@kernel.org>
 <20231019153115.26401-2-johan+linaro@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231019153115.26401-2-johan+linaro@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TM-SAViKT_2mnuqUy9NfHbbhKBcv8E3r
X-Proofpoint-ORIG-GUID: TM-SAViKT_2mnuqUy9NfHbbhKBcv8E3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_16,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=503 phishscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310190146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_101441_085414_63B63A88 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 10/19/2023 8:31 AM, Johan Hovold wrote:
> The ath11k active pdevs are protected by RCU but the temperature event
> handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
> read-side critical section as reported by RCU lockdep:
> 
> 	=============================
> 	WARNING: suspicious RCU usage
> 	6.6.0-rc6 #7 Not tainted
> 	-----------------------------
> 	drivers/net/wireless/ath/ath11k/mac.c:638 suspicious rcu_dereference_check() usage!
> 
> 	other info that might help us debug this:
> 
> 	rcu_scheduler_active = 2, debug_locks = 1
> 	no locks held by swapper/0/0.
> 	...
> 	Call trace:
> 	...
> 	 lockdep_rcu_suspicious+0x16c/0x22c
> 	 ath11k_mac_get_ar_by_pdev_id+0x194/0x1b0 [ath11k]
> 	 ath11k_wmi_tlv_op_rx+0xa84/0x2c1c [ath11k]
> 	 ath11k_htc_rx_completion_handler+0x388/0x510 [ath11k]
> 
> Mark the code in question as an RCU read-side critical section to avoid
> any potential use-after-free issues.
> 
> Fixes: a41d10348b01 ("ath11k: add thermal sensor device support")
> Cc: stable@vger.kernel.org      # 5.7
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
