Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BDFC2BD09
	for <ath11k@archiver.kernel.org>; Thu, 27 Jun 2024 19:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beg2/NxhH6IbM6xQDZkImSSiG6fZEEoBq242mh6u3q8=; b=mAzcGynHuuN0Nddjol34aNrnpP
	iZJZqeEypIywlpLssyusDxZF7EERmywvOP5pyJs0L0h2oxQE486IIR34wpq7OJx+yb1XJnbLmQUo8
	ZB9SFnRE2/aG4wKkGudmx/DaGUli1FCwEzjbGzackVRCj6lrQqaR5FU+JJda0+qY/H/AxmD04/emj
	cQrJwUf13/ENHTWgOdqk1Qc7iOxrWsL2Fu1gC1BvGm+LVsY4jm3nrQZiJjFnKck6BZhRCVbO7oVWQ
	phDdb4oePb4zhU3P4r/k5a8LgaLitwXGceotMk7ru+EN9VkaG/PhtUwO+IaxbOQH2p3XALR1snC1u
	Jye8cdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMujP-0000000BUjQ-0wun;
	Thu, 27 Jun 2024 19:24:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMujM-0000000BUiv-3ZzE
	for ath11k@lists.infradead.org;
	Thu, 27 Jun 2024 19:24:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RBTVkN010670;
	Thu, 27 Jun 2024 19:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	beg2/NxhH6IbM6xQDZkImSSiG6fZEEoBq242mh6u3q8=; b=UkiMOvPG2MVAgr7i
	vmfIBcPd4unsPF8C3/81WVfEDwTUqReMLyYr3ANPxR1p5MpPWdN66N7NPHWysefj
	susGKUF1CNU+e3xzUPlni+oUCECmP2jNAWqUjuG6Cqk4l3xwy1Zbgo5bHgMUf+Ce
	nFrfPF/46XaVg7NllkJQObeOw6BL9oNlBBKHG7GCGiWJ0Y0rnYy4epApNMPlB2SO
	6rM5mjsgx6C3HlmA0i4fQJho2qWi7mtb6fljTSFsqtgPW+0E7YxBySzS1qTGGLj+
	a5b6mLSpSuMFk1hReONTtA39He4ssq8ZA6S0/UpF2PA0+es851QiCVaOAnedRLiC
	xlDWQQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400bdqd5jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 19:24:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RJOQBv013941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 19:24:26 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 12:24:25 -0700
Message-ID: <1e69ca99-fb08-4c44-93d8-33689ff62aca@quicinc.com>
Date: Thu, 27 Jun 2024 12:24:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: use work queue to process beacon tx event
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240626053543.1946-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240626053543.1946-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PlE7sz47glw9NqSq0wapogyANYjfSGB-
X-Proofpoint-GUID: PlE7sz47glw9NqSq0wapogyANYjfSGB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_14,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_122429_044719_10A0F04D 
X-CRM114-Status: GOOD (  10.57  )
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

On 6/25/2024 10:35 PM, Kang Yang wrote:
> Commit 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
> from Feb 28, 2024 (linux-next), leads to the following Smatch static
> checker warning:
> 
> drivers/net/wireless/ath/ath11k/wmi.c:1742 ath11k_wmi_p2p_go_bcn_ie()
> warn: sleeping in atomic context
> 
> The reason is that ath11k_bcn_tx_status_event() will directly call might
> sleep function ath11k_wmi_cmd_send() during RCU read-side critical
> sections. The call trace is like:
> 
> ath11k_bcn_tx_status_event()
> -> rcu_read_lock()
> -> ath11k_mac_bcn_tx_event()
> 	-> ath11k_mac_setup_bcn_tmpl()
> 	……
> 		-> ath11k_wmi_bcn_tmpl()
> 			-> ath11k_wmi_cmd_send()
> -> rcu_read_unlock()
> 
> Commit 886433a98425 ("ath11k: add support for BSS color change") added the
> ath11k_mac_bcn_tx_event(), commit 01e782c89108 ("ath11k: fix warning
> of RCU usage for ath11k_mac_get_arvif_by_vdev_id()") added the RCU lock
> to avoid warning but also introduced this BUG.
> 
> Use work queue to avoid directly calling ath11k_mac_bcn_tx_event()
> during RCU critical sections. No need to worry the deletion of vif.

comment nit:
s/worry the deletion of vif. Because/worry about the deletion of vif because/

Kalle can apply this to pending

> Because cancel_work_sync() will drop the work if it doesn't start or
> block vif deletion until the running work is done.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/2d277abd-5e7b-4da0-80e0-52bd96337f6e@moroto.mountain/
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


