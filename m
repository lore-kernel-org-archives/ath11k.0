Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB042C07E9D
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 01:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5CZpLcnO8kV2KcK35ViRB0in6L9e9fX7iC0A7DBOO8A=; b=2RUElYyVjp4qIZ
	NLXnv8xE9oMXpCZq5+Yd0UZm+5t4rNqKOh17CTeSsPSVIitnsgjmCxkfgWHSlZO6heqya0cOQ1tPe
	zCV0sf/bjvEAh50X/Ls435MDiSss3QaVgI7oklW79bKd4lvphzRSaLq6Ue9lE5Q3/JjmJROkmDV+O
	hvdYD6D+GjyPn5jU7v0k+vssHbf075yFoBtmIui26T2aP4o3pHLyYTkG1+gOgm81ZUMZ99HN9DPoc
	X7J3uDzhDsIKRgZaO8uPQn+45dJeLZw5S+nrf/dYbVUd2Efz7cFS0DtC1NlDfj9xPwW6EAcdsjL71
	Ub5kM/OH9z22zORlP9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odMEz-00DTkq-34; Wed, 28 Sep 2022 01:52:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odMEw-00DTiS-WE
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 01:52:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S1pt1B026733;
	Wed, 28 Sep 2022 01:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=KJUysZlmD/3cGhekNZlN4P6ixBct63x1UKyESgdx5So=;
 b=T6njRJ6S1pDvwxvAj/0GMCDe4IoP4GqS+QRdBpVhws++027/E3+mVK2KonzRRZC7G/e1
 g2RqGPUC5ZPGaY7oZQafDWYg7PVdzz9qpPYYW2ZlCrTK/pMMxp0iyHHqHkqAq0S4leYM
 56nJQCLhuZV8PURe8Rj7mDtjjfWRkn8utiHP2/Vxyt+ehLYcIp4YuYvtDvnLCvFnSn3V
 Q0O0yatHd0Xa0QHSToscSlmXJvrt0raTerQU8YlutDGkQ1ot5WcaKheMJU0+aHzAgK7o
 /9wZzPQyui//ZFgtZL9yA8CnF9YtlnLrQsSHt24FrWx+Qf7deOhCzqFycFDaCLnrAxfG ZA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jva41gedp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 01:51:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28S1pspC018772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 01:51:54 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 27 Sep 2022 18:51:53 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath11k: Don't exit on wakeup failure
Date: Wed, 28 Sep 2022 09:51:40 +0800
Message-ID: <20220928015140.5431-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zQN-JeF_a1sItzD67Si9OmJw8kcgr1iQ
X-Proofpoint-ORIG-GUID: zQN-JeF_a1sItzD67Si9OmJw8kcgr1iQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_12,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_185159_083756_F62D848D 
X-CRM114-Status: GOOD (  15.50  )
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

Currently, ath11k_pcic_read() returns an error if wakeup()
fails, this makes firmware crash debug quite hard because we can
get nothing.

Change to go ahead on wakeup failure, in that case we still may
get something valid to check. There should be no mislead due
to incorrect content because we are aware of the failure with the
log printed.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/pcic.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 3fa1958f8c82..d2f0112e8df0 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -218,9 +218,16 @@ int ath11k_pcic_read(struct ath11k_base *ab, void *buf, u32 start, u32 end)
 	if (wakeup_required && ab->pci.ops->wakeup) {
 		ret = ab->pci.ops->wakeup(ab);
 		if (ret) {
-			ath11k_warn(ab, "failed to wakeup for read from 0x%x: %d\n",
-				    start, ret);
-			return ret;
+			ath11k_warn(ab,
+				    "wakeup failed, data may be invalid: %d",
+				    ret);
+			/* Even though wakeup() failed, continue processing rather
+			 * than returning because some parts of the data may still
+			 * be valid and useful in some cases, e.g. could give us
+			 * some clues on firmware crash.
+			 * Mislead due to invalid data could be avoided because we
+			 * are aware of the wakeup failure.
+			 */
 		}
 	}
 

base-commit: 92764e24ac9f6e105b3513f32f70dd94f67437ac
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
