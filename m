Return-Path: <SRS0=ZjKK=FV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32621C4361B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 11:04:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E7A12389B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 11:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E7A12389B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7odfPU5E1MwVNUn6xdTCQm4Ok5I7TCEaTy2oPElgcec=; b=hUdsOrEiCAMBfmw5rvqU3d4uG8
	eSZVbFDw8gQLdq2qwg/WXgfkMciYDUdzALPlrBFkO3tQHsjdJTG1BU1LVGPQPltG/L0CvFLUMBeZ+
	Z36HL5kigziUWvDe+XezTx0VhoutzyH1CsBidvhv/+T/fmVHviP9mNdquPF2FDuVt4P2oiNveEFXk
	cnX4uemmX6Ev/QDsR4vsPCuQT5K0dEmj3BqeZeiUJkx/h25TTtqQ1OQU+bpiT7cYNrbi+X3QW7fSO
	Xk8ye2b13oOWHjz9IqW+N53oxgH/NZM/29sCNrzl6jnbbsv0TzQktoUf703h0qKHgWDWwdhct0VSm
	VBcc7EBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpr5X-0006JU-TV; Thu, 17 Dec 2020 11:04:51 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpr5V-0006IU-5q
 for ath11k@lists.infradead.org; Thu, 17 Dec 2020 11:04:50 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHB0M6V097193;
 Thu, 17 Dec 2020 11:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5du7UrNqi0DDuPeUMHRCtr/U1TqeqgG+zv++ABVxKYM=;
 b=c0Zo9lgFtOe0Y9/r/B+4Hli/2EQZAMM+uTjvsWlYZ7gzlTLy70Eq/Y65KOr3IsRfWghH
 eS+hMqOh9/oo31jxZKQUh5ZhvLc4jgYpXhTK83kg+1q9ZxSS3Yz6m56kUVg8osDBDaVt
 xqB2iShHeFSbS8pj/YHBUC0VGo0fFk1Add4WZCzNNivOTNEs0viYlZOOcnNzOO0DZkv6
 olLSQM2lUSIV+pQTGG9N/HuDdRdg/2pO9VvLX2WjV6camx0FG7Px090SKvCDJpTGeWzJ
 ECX/txQqpcgfen2CvJJf7xtSliZceNi2rNEAGveACSWem8aXdsYiJTT5PDtbWYyKzsct sg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35cn9rmukv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Dec 2020 11:04:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHB1Fwe096231;
 Thu, 17 Dec 2020 11:04:40 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 35g3redv9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 11:04:40 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BHB4dEv016875;
 Thu, 17 Dec 2020 11:04:39 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 03:04:39 -0800
Date: Thu, 17 Dec 2020 14:04:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath11k: dp: clean up a variable name
Message-ID: <X9s7QAHDM2OTIo3a@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9837
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9837
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_060449_375646_A1103046 
X-CRM114-Status: GOOD (  16.10  )
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

The "&ar->ab->base_lock" and "&ab->base_lock" locks are the same lock
but it's nicer to use the same name consistently everywhere.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 205c0f1a40e9..1b6e663ae784 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1163,7 +1163,7 @@ int ath11k_dp_peer_rx_pn_replay_config(struct ath11k_vif *arvif,
 		}
 	}
 
-	spin_unlock_bh(&ar->ab->base_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	return ret;
 }
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
