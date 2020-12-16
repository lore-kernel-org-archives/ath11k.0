Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47AFC4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 08:32:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5076323123
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 08:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5076323123
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=9POZLND6Kk5qDJjMn61+XHtxcjRVbR0CrfeJchdtBDg=; b=dE48aQ32Y/AjHxUSHnyMNPli6
	l8rW3ssNT+Hdr5CuyIgz6/CKdgOdfbwjRgD0ItfebWJM3lmnDI7JVPoW78eslFAy4CIK7k9zh/p4J
	reKvP55/uy7vV6e3ut3pOn95MqjDIITbCvtPezierJjvYt8dZtnvcySrb5xYBKvLzxHNSRmKq4Opw
	hZZcjTjysrBgYKJuljxR7t4/TZ70FNxVmQn30If62Td450bYNdc7jAJkdfzcdBiYJbwN7VB1S0IE+
	lXojSA8qn25Li7E4yYJ/2E84la4NBeaZwgDIw1GDi9kLTmlOnQd/aeWXA3RdOZl2hX+CNg3itWeM/
	E/nTr9cwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpSET-0004zH-5l; Wed, 16 Dec 2020 08:32:25 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpSER-0004yl-64
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 08:32:24 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BG8U74P030574;
 Wed, 16 Dec 2020 08:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=63OGAu9VQeRjYwlw6Psn5yLKKjzSQO8Xr+txyy5uuBM=;
 b=t0fRkD/LE86EgcnP3hWeCRERpUMkrfTTkuHwfRfLFopnNGIjndo8UmqaV3a5AWR0nLde
 iEWBSLRpvtyazU8zQoYb8LXnE/sJETz/7ssQDoxiP6jasSN6Kt2xJqdf5IXD9gAJ6oPS
 fNrjL/84x3gKBHXb2oDh4ImhASfns0WYB0NJMSEK4WIaBCaj4u/TW7HNHRQSj2Lo/bWd
 2PbmJrPNc4DopytPhyDoiMCCLuAxdf3KXQRSYx0tNbADESX97YjUFJaPP47bc60xMzDf
 ecLwd0NT4fRm11I7oDTWyScQAeCwUHIzNfIiJfbTd7lACr+gKP+jBR+mU1A91Khr8BUa Gw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35cntm6t7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Dec 2020 08:32:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BG8VELZ067765;
 Wed, 16 Dec 2020 08:32:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35d7ep83m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 08:32:20 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BG8WI4o000719;
 Wed, 16 Dec 2020 08:32:18 GMT
Received: from mwanda (/10.175.200.55) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Dec 2020 00:32:18 -0800
Date: Wed, 16 Dec 2020 11:32:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kalle Valo <kvalo@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH 2/2] ath11k: Fix ath11k_pci_fix_l1ss()
Message-ID: <X9nGDHiTh+Z+asDy@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9nF17L2/EKOSbn/@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_033223_345219_C6E4A196 
X-CRM114-Status: GOOD (  16.07  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

All these conditions are reversed so presumably most of the function is
dead code.

Fixes: 0699940755e9 ("ath11k: pci: fix L1ss clock unstable problem")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 857647aa57c8..9f9a824a4c2d 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -274,7 +274,7 @@ static int ath11k_pci_fix_l1ss(struct ath11k_base *ab)
 				      PCIE_QSERDES_COM_SYSCLK_EN_SEL_REG,
 				      PCIE_QSERDES_COM_SYSCLK_EN_SEL_VAL,
 				      PCIE_QSERDES_COM_SYSCLK_EN_SEL_MSK);
-	if (!ret) {
+	if (ret) {
 		ath11k_warn(ab, "failed to set sysclk: %d\n", ret);
 		return ret;
 	}
@@ -283,7 +283,7 @@ static int ath11k_pci_fix_l1ss(struct ath11k_base *ab)
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG1_REG,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG1_VAL,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG_MSK);
-	if (!ret) {
+	if (ret) {
 		ath11k_warn(ab, "failed to set dtct config1 error: %d\n", ret);
 		return ret;
 	}
@@ -292,7 +292,7 @@ static int ath11k_pci_fix_l1ss(struct ath11k_base *ab)
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG2_REG,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG2_VAL,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG_MSK);
-	if (!ret) {
+	if (ret) {
 		ath11k_warn(ab, "failed to set dtct config2: %d\n", ret);
 		return ret;
 	}
@@ -301,7 +301,7 @@ static int ath11k_pci_fix_l1ss(struct ath11k_base *ab)
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG4_REG,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG4_VAL,
 				      PCIE_USB3_PCS_MISC_OSC_DTCT_CONFIG_MSK);
-	if (!ret) {
+	if (ret) {
 		ath11k_warn(ab, "failed to set dtct config4: %d\n", ret);
 		return ret;
 	}
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
