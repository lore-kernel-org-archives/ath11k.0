Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1CDC28B30
	for <ath11k@archiver.kernel.org>; Thu, 20 Mar 2025 05:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EaM28uuUQjLTLit8/Zrnw3IUUiB5Hmv6M9vSeFjlxLM=; b=WZLk4V8FQnd/Z2J/Xa6lqXSLIk
	Pqkh5Zjq4eCNk8uhNAunVSNmh0wnCJJoLT3Sil7f5rxAQJmFLs6t4dKx4f/yDbNaeQelhOyUpjJU6
	6JlxfUqoAWWzcSsVNsq4LKiq3GA8prv3s3liKR6gm80S+UIQzKDkVfdXMfQ7ybZbAIu5jw1BfdwHL
	G6Ar38KYfaGoUv2yR9RRiKRVbzCSJ2mOMjExqZQ1MB5FvmicGNGFCoX8Fomw0JRRsJpQxC6B0qL6q
	H8CIT6yVWI8VpmcbINKKYaAH4aIJAakY2ovhWbQg3Drigv4eo4jqwwtmaRgtpNblr/LGscMeMTtFW
	5uN5gUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv8Vp-0000000BDw3-10eT;
	Thu, 20 Mar 2025 05:32:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv8Vm-0000000BDvd-3J93
	for ath11k@lists.infradead.org;
	Thu, 20 Mar 2025 05:32:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K2UdoI013162;
	Thu, 20 Mar 2025 05:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EaM28uuUQjLTLit8/Zrnw3
	IUUiB5Hmv6M9vSeFjlxLM=; b=Ll940Gy2RKMPp95FRyu6I0FswGdbbw9fQ55QIj
	VGzDdrLJ/qu0jfUF9pCXwvV3Izb7scUdgaxnRTOOIYsqPBEyaeZU6vMxr8eh4tTu
	NjoirjzQR8qKl9W+t57W1+onePyvIrp3+6oGu10QypSJYuRmyLjrPT3T13DIkdsx
	hhkQ+oLNIe9kbmQQDs84BNn9E6jWdZbZEVvfGMAzTdXkBh/LUKH0BQwWts1uEJ19
	BHTUA9L1qNO3TGc6ijYE1MazAOyu5++Nig0XRm+nB6edk6psltiS6k+kylR9rEmS
	5IQu73f5yVDFym+6pSlWn8oqRUEkgRq6Iiwz4FtHVsDmgR7A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtqvpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:32:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K5W2gs022637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:32:02 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Mar 2025 22:31:58 -0700
From: Stone Zhang <quic_stonez@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
        Sven Eckelmann
	<sven@narfation.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        "Govindaraj
 Saminathan" <quic_gsamin@quicinc.com>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
CC: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        John Crispin
	<john@phrozen.org>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        "Shashidhar
 Lakkavalli" <slakkavalli@datto.com>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_miaoqing@quicinc.com>,
        <quic_zhichen@quicinc.com>, <quic_yuzha@quicinc.com>,
        Stone Zhang <quic_stonez@quicinc.com>
Subject: [PATCH ath-next] wifi: ath11k: fix node corruption in ar->arvifs list
Date: Thu, 20 Mar 2025 13:31:45 +0800
Message-ID: <20250320053145.3445187-1-quic_stonez@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sOjSiLJGgDQuVyA43OTtyxlxS0p3c4_f
X-Proofpoint-ORIG-GUID: sOjSiLJGgDQuVyA43OTtyxlxS0p3c4_f
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67dba853 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=2pyOCsQr0UlPjGJFVwcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=895
 phishscore=0 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_223210_832071_59BCE9A8 
X-CRM114-Status: GOOD (  14.89  )
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

In current WLAN recovery code flow, ath11k_core_halt() only
reinitializes the "arvifs" list head. This will cause the
list node immediately following the list head to become an
invalid list node. Because the prev of that node still points
to the list head "arvifs", but the next of the list head "arvifs"
no longer points to that list node.

When a WLAN recovery occurs during the execution of a vif
removal, and it happens before the spin_lock_bh(&ar->data_lock)
in ath11k_mac_op_remove_interface(), list_del() will detect the
previously mentioned situation, thereby triggering a kernel panic.

The fix is to remove and reinitialize all vif list nodes from the
list head "arvifs" during WLAN halt. The reinitialization is to make
the list nodes valid, ensuring that the list_del() in
ath11k_mac_op_remove_interface() can execute normally.

Call trace:
__list_del_entry_valid_or_report+0xb8/0xd0
ath11k_mac_op_remove_interface+0xb0/0x27c [ath11k]
drv_remove_interface+0x48/0x194 [mac80211]
ieee80211_do_stop+0x6e0/0x844 [mac80211]
ieee80211_stop+0x44/0x17c [mac80211]
__dev_close_many+0xac/0x150
__dev_change_flags+0x194/0x234
dev_change_flags+0x24/0x6c
devinet_ioctl+0x3a0/0x670
inet_ioctl+0x200/0x248
sock_do_ioctl+0x60/0x118
sock_ioctl+0x274/0x35c
__arm64_sys_ioctl+0xac/0xf0
invoke_syscall+0x48/0x114
...

Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04591-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 3d39ff85ba94..8d08dd47bde9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2050,6 +2050,7 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 void ath11k_core_halt(struct ath11k *ar)
 {
 	struct ath11k_base *ab = ar->ab;
+	struct list_head *pos, *n;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -2065,7 +2066,12 @@ void ath11k_core_halt(struct ath11k *ar)
 
 	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx], NULL);
 	synchronize_rcu();
-	INIT_LIST_HEAD(&ar->arvifs);
+
+	spin_lock_bh(&ar->data_lock);
+	list_for_each_safe(pos, n, &ar->arvifs)
+		list_del_init(pos);
+	spin_unlock_bh(&ar->data_lock);
+
 	idr_init(&ar->txmgmt_idr);
 }
 

base-commit: b6f473c96421b8b451a8df8ccb620bcd71d4b3f4
-- 
2.34.1


