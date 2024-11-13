Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88940D597C4
	for <ath11k@archiver.kernel.org>; Wed, 13 Nov 2024 01:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/ZD8PCKwOqK9sf7A7yBcLWhWjk8hGcyzE99TN+gbyA=; b=UwRJbJ74auFwfziOlCdtwXyNhF
	ZXQnF0SiMK0C4uim718Nh70UVwQN+a8p0h4cQP81+JeTqn1jcKB2mDFa2/fzQYMk+t9Ib40FRxWK9
	iJSjqp9MtDraAC9NbzFOzlJnnLef5qM3pFZX7q1fMG5yy7/+lTshf3H+gxdrLOHt9Guv2JZbM/523
	HjRE/iLWXZV2+SASIov3U01WmYPHGOc4c/BnLrRAxMoqkGYxCSRLe/GIPMxDd8LfMNEGYGKcxJaeu
	t+PyIwV7ooT3PbbPHA0dQxG6bZSkqWWZ2gyfz2hULD5g0/F/UIZvYa4rpnNDVMcXbqD9hbf3WHL7n
	twxTZFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2cn-00000005YUE-0pl1;
	Wed, 13 Nov 2024 01:56:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2ck-00000005YS2-1bix
	for ath11k@lists.infradead.org;
	Wed, 13 Nov 2024 01:56:52 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRm33003783;
	Wed, 13 Nov 2024 01:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/ZD8PCKwOqK9sf7A7yBcLWhWjk8hGcyzE99TN+gbyA=; b=gXFWiJflCC1+LxUm
	XsZn7SDNq/GHKayfoVWin+2DpztnypIJd2GQA+1KGtzBDGHgzWeB8vdtXdvM4h5f
	g635In95favKYZeBhEB3dEjUS4ylCVZwzLPSQfvLlhMrDehFLHBIwgdl05HP9e3S
	hj4iBREwfn290RuRTG3dPYOSA2/vA1VOTCzBE3aTjwN+wttAH0Do8fNj3vh7ZNRS
	X9sIgpMSd7OcPP7Ea2+0I1ezBUDZf17D1TvirpPvNLSi91i5e1K+Q5685oyMLJau
	S0m2p9luSidnXOXJKbvnR8I7Fj960CNw3KXjprJGGvZuT23SHXyQwMZfdMF4UOZn
	F5fRXQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gm14d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:56:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD1unaG025835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:56:49 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 17:56:47 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 4/6] wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
Date: Wed, 13 Nov 2024 09:56:29 +0800
Message-ID: <20241113015631.3105-5-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113015631.3105-1-quic_bqiang@quicinc.com>
References: <20241113015631.3105-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Cw8PLCcTpxm2K7gVKrXPW3sF2JSvFL46
X-Proofpoint-GUID: Cw8PLCcTpxm2K7gVKrXPW3sF2JSvFL46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_175650_465110_F12FBCF9 
X-CRM114-Status: GOOD (  11.94  )
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

Currently RCU lock and ar->data_lock are acquired in a sequence of

	rcu_read_lock()
	spin_lock_bh(&ar->data_lock)

but released in a sequence of

	rcu_read_unlock()
	spin_unlock_bh(&ar->data_lock)

Although there are no apparent issues with this, reorder them to
achieve symmetry.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 641cc979589a..0f7df1fbaed8 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8235,8 +8235,8 @@ static void ath11k_update_stats_event(struct ath11k_base *ab, struct sk_buff *sk
 
 complete:
 	complete(&ar->fw_stats_complete);
-	rcu_read_unlock();
 	spin_unlock_bh(&ar->data_lock);
+	rcu_read_unlock();
 
 	/* Since the stats's pdev, vdev and beacon list are spliced and reinitialised
 	 * at this point, no need to free the individual list.
-- 
2.25.1


