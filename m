Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF84C5321E
	for <ath11k@archiver.kernel.org>; Mon, 26 Aug 2024 05:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aiVr+YYkpbp6zObIQMjLy+qWSX10e0xMWuRvjsWQykA=; b=bQU/1pOtQJ2kIzWjSZFUiysmTA
	MqIadNFnpKpYhY/c3bNxzwP0frkU3zeS7iguh62Z9Jx1WHBZf38Edg2geSwhrOqkZuBbUcnX6Z0w0
	mtFjny6HZyshOTpgSk6bFtaI7gWPOa3qfnM5xUKB33lKsHPNYCG7Ec4vX8eOr6MqrWLi65XCGhLRA
	UpsHrbrGgDiGU8t6BKSip2YFS63oEgHTGqyl2Wk9MsK0QHetPSj4E//p0231T+tnPYCDLAGVbTrxc
	spArQNtrbvtDIqZH5VeQRp/tzYRTb0mr4x3jvYf+UNrB9EeI1Dnuwl7ThgdaahPu6h/KK1Es9XcKI
	LVPw8dxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siSMU-00000005tLZ-1aT7;
	Mon, 26 Aug 2024 05:33:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siSMR-00000005tL0-2uaV
	for ath11k@lists.infradead.org;
	Mon, 26 Aug 2024 05:33:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PMGCIk002126;
	Mon, 26 Aug 2024 05:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=aiVr+YYkpbp6zObIQMjLy+qWSX10e0xMWuRvjsWQykA=; b=R9
	MJpJFxrhOOSld5SN913EaW5/4vWI7LVMW8UMnIhT6b9k0nsAWT61q2yHE6uY9HkJ
	5dplkewysVu4slIjX7JA00XRElaCgkFZM7WNWxSdXStXeH2zI87n2aangahgTuyj
	G/2Nq0BPkdqKvcYMId00FrBa5tCWuicasKxjiSBvsE6+pIzBi8kSwK4NREqb9+uj
	uM9VAoePb/VzWkKmVXV3V8ng+LjmQ8zIk2XPAjj2dXYel6kBnXUq0I0WXQVvLWZ8
	HnWZ3bpIvySSSiJpdZb7QoiPWbrGQ1FtMG3iCG2NR18T1x+/SUKUI6h/CEJ4fpWh
	BbNPe9qVZ+XeurQD4OCA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417988ahkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 05:33:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47Q5Xm2H001421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 05:33:48 GMT
Received: from hu-bpothuno-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 25 Aug 2024 22:33:46 -0700
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>,
        Balaji Pothunoori <quic_bpothuno@quicinc.com>
Subject: [PATCH] wifi: ath11k: Fix double free issue during SRNG deinit
Date: Mon, 26 Aug 2024 11:03:26 +0530
Message-ID: <20240826053326.8878-1-quic_bpothuno@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KbcIIO-nWKvi0sR_QA5Iln6LY5mtG9jy
X-Proofpoint-ORIG-GUID: KbcIIO-nWKvi0sR_QA5Iln6LY5mtG9jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_02,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 suspectscore=0
 mlxlogscore=629 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408260043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_223351_831703_24CFD82E 
X-CRM114-Status: GOOD (  10.78  )
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

From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Currently struct ath11k_hal::srng_config pointer is not assigned
to NULL after freeing the memory in ath11k_hal_srng_deinit().
This could lead to double free issue in a scenario where
ath11k_hal_srng_deinit() is invoked back to back.

In the current code, although the chances are very low, the above
said scenario could happen when hardware recovery has failed and
then there is another FW assert where ath11k_hal_srng_deinit() is
invoked once again as part of recovery.

Fix this by assigning the struct ath11k_hal::srng_config pointer
to NULL after freeing the memory.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
Resending the original patch as standalone patch:
https://patchwork.kernel.org/project/linux-wireless/patch/20230417054145.12359-2-quic_mpubbise@quicinc.com/

 drivers/net/wireless/ath/ath11k/hal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index f02599bd1c36..61f4b6dd5380 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1351,6 +1351,7 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 	ath11k_hal_free_cont_rdp(ab);
 	ath11k_hal_free_cont_wrp(ab);
 	kfree(hal->srng_config);
+	hal->srng_config = NULL;
 }
 EXPORT_SYMBOL(ath11k_hal_srng_deinit);
 
-- 
2.17.1


