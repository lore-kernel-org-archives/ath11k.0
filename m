Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A9ACE79AD
	for <ath11k@archiver.kernel.org>; Wed, 20 Sep 2023 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QDLqGZAJ8fTzzg5q7BpXU1ZgQSDjirKsJvq/kjw3Rc=; b=nS+biAlHKM++Ko
	yHaBqgtyl6uqbKoXjOAnB4GaTZEsDIU1KPbuOlt1bqS/Uk3dfIcWfu0/g1Lq6vsfbiqFPjx9BVsx+
	XeO0oO05XDQlBbsoyoVJNjlRJ0DXT8ooLJ3VWZkCK7FiqY2xqYv3pr6/VGBdOL27UJDetDHyqOAnb
	Pp9TuF2e6MGkOCyunye8ICSYxE2jMMDG6J2nLUbPoSmO2BkKAyoAcW0nwP8LBWE1PWXmZiWLXxDWE
	0GLrY8WvnfH9zRQ94Vr0s9rn9qVdEvavahM4LlOkFXwRFsOeL0KEHdVXfZs+udFfaC0niaBNt6ydd
	R4vU930EmWYXYa3BtlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisVO-002GvP-28;
	Wed, 20 Sep 2023 08:24:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisVM-002Gtb-0Q
	for ath11k@lists.infradead.org;
	Wed, 20 Sep 2023 08:24:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38K5wMfF001769;
	Wed, 20 Sep 2023 08:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=l+suyGsoe41ErzmRfO+VlfYJ9OlO3qrQAsgpsbKpqkI=;
 b=QMM3PHPPbMWQV8n97CEKphdkZpNzAFOf1WA5QJBo6cKVdNlsqLv6Vcl0vLomsIwNKOnR
 eIDS7bROXENshgwGUE3SEhwIKNuGVwxOxuncCTYqQKccryZ8CW7SR7Tq5Q5YF88zwBSW
 oY0lvdlhLGvE7fqdoObvdfdrUGTjnZj/+ojqd/2H9o9MpSMJSNTvuTh5PuQ2AME/HRds
 0rVOVvMqu5Z884Yl4D7/7dbQMwM2ahl08HIj+Q+LauIPloE9s9GpKHGJbht+PATWwAab
 biOBb9vruJFickY0JfTBggCaYRmrJkQlcK7G3NkHFVZZegXl8w3bkaD5ndHAsEHwNnlC RA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t746g2w1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 08:24:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38K8OCnE006322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 08:24:12 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 20 Sep 2023 01:24:10 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>,
        Baochen Qiang
	<quic_bqiang@quicinc.com>
Subject: [PATCH v6 03/13] wifi: ath11k: fix a possible dead lock caused by ab->base_lock
Date: Wed, 20 Sep 2023 04:23:39 -0400
Message-ID: <20230920082349.29111-4-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920082349.29111-1-quic_wgong@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -HjQfpGhSpit8-Y95QKsNhU6aNUf7HBM
X-Proofpoint-GUID: -HjQfpGhSpit8-Y95QKsNhU6aNUf7HBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_02,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 spamscore=0 mlxlogscore=919 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_012416_306794_E5ED9D14 
X-CRM114-Status: GOOD (  20.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Baochen Qiang <quic_bqiang@quicinc.com>

spin_lock/spin_unlock are used in ath11k_reg_chan_list_event to
acquire/release ab->base_lock, for now this is safe because that
function is only called in soft IRQ context.

But ath11k_reg_chan_list_event() will be called from process
context in an upcoming patch, and this can result in a deadlock if
ab->base_lock is acquired in process context and then soft IRQ occurs
on the same CPU and tries to acquire that lock.

Fix it by using spin_lock_bh and spin_unlock_bh instead.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Fixes: 69a0fcf8a9f2 ("ath11k: Avoid reg rules update during firmware recovery")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 1fb445106872..c427299b7202 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7138,13 +7138,13 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 	/* Avoid default reg rule updates sent during FW recovery if
 	 * it is already available
 	 */
-	spin_lock(&ab->base_lock);
+	spin_lock_bh(&ab->base_lock);
 	if (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
 	    ab->default_regd[pdev_idx]) {
-		spin_unlock(&ab->base_lock);
+		spin_unlock_bh(&ab->base_lock);
 		goto retfail;
 	}
-	spin_unlock(&ab->base_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	if (pdev_idx >= ab->num_radios) {
 		/* Process the event for phy0 only if single_pdev_only
@@ -7194,7 +7194,7 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 		ab->reg_info_store[pdev_idx] = *reg_info;
 	}
 
-	spin_lock(&ab->base_lock);
+	spin_lock_bh(&ab->base_lock);
 	if (ab->default_regd[pdev_idx]) {
 		/* The initial rules from FW after WMI Init is to build
 		 * the default regd. From then on, any rules updated for
@@ -7214,7 +7214,7 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 		ab->default_regd[pdev_idx] = regd;
 	}
 	ab->dfs_region = reg_info->dfs_region;
-	spin_unlock(&ab->base_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	return 0;
 
-- 
2.40.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
