Return-Path: <SRS0=JrPu=HD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F479C433DB
	for <ath11k@archiver.kernel.org>; Mon,  1 Feb 2021 12:26:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF71964E97
	for <ath11k@archiver.kernel.org>; Mon,  1 Feb 2021 12:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF71964E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1gBecqVs3ebJnO8bFmDr25X+vbz3yBcWJ1oXsbPxja8=; b=TH3BTcjZcyqPXqxdCaeo+w64wm
	yPOOwpVc6bQ1GzvMKjGvqsxmkax9mPAFx1UdOJDz/Ojsx80TfAWoJZ3EgRILM4KIYz3E1wtHj+gjd
	5E9wdnxxFba7qvRElOCTFmRj8BPqTRieVacjA/K7zRmr8xrptaGPQ9N7efpWg3Cf+iy+0fmd/We9J
	Wp2yNRSYEl7g1L7zIUC3pEcD5JmzTOBsucTbEpuRPe+AvAajwaaPcHRtvPpIRyQAAJ2blEDQje+ZG
	QjRXt+KkturP8CQjeusQWK1T+RJ4xAfgfJ851u7CrJ6CIneSAPOYHByawCM5APtoZ6jm6ywHrcXO1
	TLOX5R/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6YI1-0002dA-54; Mon, 01 Feb 2021 12:26:45 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6YHy-0002ci-Qi
 for ath11k@lists.infradead.org; Mon, 01 Feb 2021 12:26:43 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 111CE8J2173357;
 Mon, 1 Feb 2021 12:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Drq82AAAZybV+JfLoh1I4PB5deHmrlfF6kc31xE4YQ4=;
 b=fykI8TT8vGGXGX5EZWEiyspa/Gf7gOxE2kOHblTBsGpbzT0i5M39XUKLz3kmssSs2sby
 iiZX9LZv1f2CxqbCwNqw3xEL3oEAOf2ETrmzcGTHviXfKV+Vag1B5nd+Cf9XrarvI6zf
 mrpcxC+Z9W4O/J1ebOJA0SIjW8OqC1pZlXVZsSFdBDuBKv+9RjysQ0hN9AXCV4TOuczN
 SvWdYgBS6cUJDQs2ESW+BwB6QDt4dTRt9e9mUTUfgN8qLRj7pAlTysMYTS4NbJYjYvYS
 /IhAG4xQ4Amz98Yj+VMTEGcysM7YEhmHOmQEZ9AZ+StuHT007j2GzuEiJvtI9RjuLIbW zQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 36cxvqvyt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Feb 2021 12:26:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 111CA7F1146790;
 Mon, 1 Feb 2021 12:24:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 36dh7pn35n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Feb 2021 12:24:34 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 111COXa4012862;
 Mon, 1 Feb 2021 12:24:33 GMT
Received: from mwanda (/10.175.186.133)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Feb 2021 04:24:33 -0800
Date: Mon, 1 Feb 2021 15:24:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath11k: fix a locking bug in ath11k_mac_op_start()
Message-ID: <YBfy+zc3XkiyIe6t@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9881
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102010064
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9881
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102010064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_072643_171843_01B3AA7B 
X-CRM114-Status: GOOD (  19.18  )
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

This error path leads to a Smatch warning:

    drivers/net/wireless/ath/ath11k/mac.c:4269 ath11k_mac_op_start()
    error: double unlocked '&ar->conf_mutex' (orig line 4251)

We're not holding the lock when we do the "goto err;" so it leads to a
double unlock.  We should hold the lock because the error path sets
"ar->state" so the right fix is to take the lock before doing the goto.

Fixes: c83c500b55b6 ("ath11k: enable idle power save mode")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c1608f64ea95..12e981e9e3d7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4259,6 +4259,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 						1, pdev->pdev_id);
 		if (ret) {
 			ath11k_err(ab, "failed to enable idle ps: %d\n", ret);
+			mutex_lock(&ar->conf_mutex);
 			goto err;
 		}
 	}
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
