Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62653C433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EufSK2LIML5GAXqYo2iSRObOSf39gKVbJJlPfN5mt+Y=; b=J/HsobqMZEEUwH
	/uKbmUtEJooBPLP4kQ4MZK1IMbNQuAPlZ7entISIddvqs1WBWgbTbq1BwKlkaAxbcVDPOjCwat4gn
	AtLGLj4Kmp7DBD7ut6kZfvwdPPHV1duPIyJiX3UKRUWROfpwM9apKNxENAhvJURSj5BA7QPUBLv9J
	qQ0ziSRKJpFWy08UPpwdGJVUUjVvPYU+q8B7s739Iynp9bNbyllsEitO+FpOr9GxzUCZRpgE+A6xj
	q2RlPIgIDDfJ+F7Dgfq29X1IlZXTvcW7wi9lY99ZIjQsJkJfKuahrJ4bSIYYH9nJSGmAWFVFxZ4Qj
	iy6g38ANm3LLXc0dld0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9dC-003Zr9-Ms; Tue, 11 Oct 2022 07:24:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9d8-003Zq0-T9
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 07:24:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B57W1Q009549;
	Tue, 11 Oct 2022 07:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=NV+c7yh9+dNxte2y8pnFAPZby9WUuSB2+BLBmAwJf+4=;
 b=YONgtGvL8C316nY1qc2Dgvw2KbeTaA7idVu2In55HpaUe+5GjdnlnpjFkrK/W3gpi7AN
 hlzfSKl7h6p4N2GKzH9xmsLLL77oHrnvCG8dUQY9K9PeRvMh7DkZ+aIy6efbsJvdgXgY
 IZh3MWiD7Yu1VJ8CrhUsUw5UWgHzBMUkoW2ZYtzEO9PBikjvTlCLmbQYl1eLlxUskt28
 EYeviKT3WBTzsjwEiw/vrt8OOoSA/BDenQXk2GNTOsGoHrL1HCfFVQ9ezdfI1NXSduIH
 OSd8diE7w8Q85aOCqDstnc7XGRVP4cN09DWvBfLXVvV36T+A6pJEya4RHqCumSzuQsUP wg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k4rx4hf4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 07:24:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29B7OjAo023932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 07:24:45 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 11 Oct 2022 00:24:44 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v3 2/2] wifi: ath11k: reduce the timeout value back for hw scan from 10 seconds to 1 second
Date: Tue, 11 Oct 2022 03:24:08 -0400
Message-ID: <20221011072408.23731-3-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221011072408.23731-1-quic_wgong@quicinc.com>
References: <20221011072408.23731-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wG0-zPSAo5whnXiydSNJ3Vu2utxkz76e
X-Proofpoint-GUID: wG0-zPSAo5whnXiydSNJ3Vu2utxkz76e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_03,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210110040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_002446_965752_B245EA52 
X-CRM114-Status: GOOD (  21.16  )
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

For 11d scan, commit 9dcf6808b253 ("ath11k: add 11d scan offload support")
increased the timeout from one second to max 10 seconds when 11d scan
offload enabled and 6 GHz enabled, it is reasonable for the commit, it
is because the first 11d scan request is sent to firmware before the
first hw scan request after wlan load, then the hw scan started event
will reported from firmware after the 11d scan finished, it needs about
6 seconds when 6 GHz enabled, so increased it from one second to 10
seconds in the commit to avoid timed out for hw scan started. Then
another commit 1f682dc9fb37 ("ath11k: reduce the wait time of 11d scan
and hw scan while add interface") change the sequence of the first 11d
scan and hw scan, then ath11k will receive the hw scan started event
from firmware immediately for the first hw scan, thus ath11k does not
need set the timeout value to max 10 seconds again, and this is to set
the timeout value back from 10 seconds to 1 second.

After the 1st hw scan finished, firmware will start 11d scan immediately,
and firmware need use some seconds to finish 11d scan, if the 2nd hw
scan is sent from ath11k to firmware before 11d scan finished, the 2nd
hw scan will started after 11d scan finished, this will lead timeout to
wait scan started in ath11k. Treat the timeout as a normal situation if
11d scan is running and skip report scan fail for this situation.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b0c3cf258d12..666775a1e2a9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3560,7 +3560,6 @@ static int ath11k_start_scan(struct ath11k *ar,
 			     struct scan_req_params *arg)
 {
 	int ret;
-	unsigned long timeout = 1 * HZ;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -3571,19 +3570,15 @@ static int ath11k_start_scan(struct ath11k *ar,
 	if (ret)
 		return ret;
 
-	if (test_bit(WMI_TLV_SERVICE_11D_OFFLOAD, ar->ab->wmi_ab.svc_map)) {
-		timeout = 5 * HZ;
-
-		if (ar->supports_6ghz)
-			timeout += 5 * HZ;
-	}
-
-	ret = wait_for_completion_timeout(&ar->scan.started, timeout);
+	ret = wait_for_completion_timeout(&ar->scan.started, 1 * HZ);
 	if (ret == 0) {
 		ret = ath11k_scan_stop(ar);
 		if (ret)
 			ath11k_warn(ar->ab, "failed to stop scan: %d\n", ret);
 
+		if (ar->state_11d == ATH11K_11D_RUNNING)
+			return -EBUSY;
+
 		return -ETIMEDOUT;
 	}
 
@@ -3682,7 +3677,12 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
 	ret = ath11k_start_scan(ar, &arg);
 	if (ret) {
-		ath11k_warn(ar->ab, "failed to start hw scan: %d\n", ret);
+		if (ret == -EBUSY)
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "scan engine is busy 11d state %d\n", ar->state_11d);
+		else
+			ath11k_warn(ar->ab, "failed to start hw scan: %d\n", ret);
+
 		spin_lock_bh(&ar->data_lock);
 		ar->scan.state = ATH11K_SCAN_IDLE;
 		spin_unlock_bh(&ar->data_lock);
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
