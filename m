Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1700BC4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 08:31:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADB4F23123
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 08:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADB4F23123
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FXCGXsbZKu4EH2EHmhtDGWGGeFyvPbLdbPaWr9X+OBc=; b=Juhk3OtSZXDgm7tNz6kruz7Gky
	/NFYZD0eJWPKfp4VRo4kRWkpJb+hA83TeC+TKjbuya4UPj8Fd1NOHvYP03N1E5wOjCW1wgQxw/MwH
	WDfqybkmQyOzq7jGw1zYX0wtv806ZIREU6fWMW0d+pVs5n/gMNAE3xcn9DDkS5QqQheDK/NJIXAAj
	9yNYqlQ1nVh9dONszSngNOblrVDp+fpo8zuZGr1Y5oKTA9XVrhiRt3takM78zQHTjAaX6wOU8Q+yB
	v38Sff/E1940/sSdAGb44Y04QDhKUcGQuYaLTCr5xCKjcYGbJAYPsflpsmoIvj6ZA8OiDgCRvrQli
	vgHmH7pQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpSDd-0004vk-Mb; Wed, 16 Dec 2020 08:31:33 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpSDb-0004vJ-Va
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 08:31:32 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BG8UIDc095718;
 Wed, 16 Dec 2020 08:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=JzSZXbinXV21Z8vjxrONRNP3I5CvUYvCri5fHXXzL00=;
 b=mBrTG8U9jvDP6wsyn5A09A5bQB/CCS4kwRnRYJxTY5uXHeqVQHf2XwjXrzgIBUrwT6Iu
 HBcs8CgacPezSmuatOzPiXmm8uvIvuN6RMeDHBHb5TCuVbGRUr+ouancxrirpPAawmQo
 FCI1+0ALkh3kpXPd6XlBAfMUFCp+4t6AS+Fz5Xx754QcV/5cd1UbfsQg59aYnB4L6yNp
 eFmQ6eQ5/nMmJFLhQ3JiTEkqahADf4v5Hmzq6XsIoYqN2v669KKJzJV3gg+NHFefkdjO
 YmPnMkKB1DB+dhJ72LYBUyhdfnOLrq+FMNkD2yO+mf2EroNA3sCIKxqOBIep1/gFs4kX pA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35cn9reugv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Dec 2020 08:31:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BG8UC5H171916;
 Wed, 16 Dec 2020 08:31:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 35d7sxgfyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 08:31:28 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BG8VQA4000444;
 Wed, 16 Dec 2020 08:31:26 GMT
Received: from mwanda (/10.175.200.55) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Dec 2020 00:31:26 -0800
Date: Wed, 16 Dec 2020 11:31:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kalle Valo <kvalo@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH 1/2] ath11k: Fix error code in ath11k_core_suspend()
Message-ID: <X9nF17L2/EKOSbn/@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_033132_171051_69E20E17 
X-CRM114-Status: GOOD (  17.90  )
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
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The "if (!ret)" condition is inverted and it should be "if (ret)".  It
means that we return success when we had intended to return an error
code.

Fixes: d1b0c33850d2 ("ath11k: implement suspend for QCA6390 PCI devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index b97c38b9a270..350b7913622c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -185,7 +185,7 @@ int ath11k_core_suspend(struct ath11k_base *ab)
 	ath11k_hif_ce_irq_disable(ab);
 
 	ret = ath11k_hif_suspend(ab);
-	if (!ret) {
+	if (ret) {
 		ath11k_warn(ab, "failed to suspend hif: %d\n", ret);
 		return ret;
 	}
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
