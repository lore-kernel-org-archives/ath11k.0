Return-Path: <SRS0=GJml=HS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A1FC433DB
	for <ath11k@archiver.kernel.org>; Tue, 16 Feb 2021 13:03:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0192264D99
	for <ath11k@archiver.kernel.org>; Tue, 16 Feb 2021 13:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0192264D99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i40AOFOk1+1THh/7e4JIAGHG2s1XJ5hn7EYYv8+97/A=; b=R+ZeUel3Uj0Sgfg2qvCBdTXCdq
	Ss/9lxJrUbgm/I0vCyv76yXae6hQJU+Ds4rlIdttgb1bZf933186PhsRF9c6KJl3vns+Bm7OMJouy
	39mC/wjbVIUhZt5KCgM3PJ2fA5NJIpmVO7GsGpVDG+JoL9XK68sH5GrRTrV5tVMxn+wAQ35s7Fy1n
	FtofFO9xRCuZndXilxUHtZpVen4hNxTCLZhmU951HWhQEzJDuVOXebsxywHQnGVAv5vgX4vYIXrE5
	PsMAxiKwogTlsXu4yniXOu4z3V2RflFG774b8q0IM+pTnZdK9pM0JhmYKgx6L1MyTv8uFq0VGCN50
	OQtvM+cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC00Y-0004tc-6d; Tue, 16 Feb 2021 13:03:14 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC00S-0004sz-1W
 for ath11k@lists.infradead.org; Tue, 16 Feb 2021 13:03:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613480590; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ESkbEzqmXn5z8I8Yp1AJat9rRR2p3IPu2OV+xb971Po=;
 b=sEOnnc7kuEtKZhbx1yocbzNrdr1ZARQRZ2zslzkXuImM+HjEkQPM8SaxS7TX8ZYrmRfkpAYV
 wocCC+ts1+XKmzt5AJdz39Bbw+kibAZuKxlGFOeovDx1/Z8deFVkR+hWMR91FlLac5DNF/OV
 XRjdti5zknaH69e1jkNaozHhr6I=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 602bc26d4129d8cb4a543c5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 13:02:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2149FC433ED; Tue, 16 Feb 2021 13:02:37 +0000 (UTC)
Received: from lavaks-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: lavaks)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 62379C433CA;
 Tue, 16 Feb 2021 13:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62379C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=lavaks@codeaurora.org
From: Lavanya Suresh <lavaks@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCHv2] ath11k: Enable radar detection for 160MHz secondary segment
Date: Tue, 16 Feb 2021 18:32:27 +0530
Message-Id: <1613480547-28810-1-git-send-email-lavaks@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_080310_840771_3D1DFBAF 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: Lavanya Suresh <lavaks@codeaurora.org>, linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

WMI_CHAN_INFO_DFS_FREQ2 needs to be set in wmi vdev start command chan
info parameter, to enable radar detection for secondary segment in 160MHz.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01717-QCAHKSWPL_SILICONZ-1

Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
---
v2:
* Rebased on latest ath.git

---
 drivers/net/wireless/ath/ath11k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b391169..a650d95 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5096,13 +5096,15 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 		arg.channel.chan_radar =
 			!!(chandef->chan->flags & IEEE80211_CHAN_RADAR);
 
+		arg.channel.freq2_radar =
+			!!(chandef->chan->flags & IEEE80211_CHAN_RADAR);
+
 		arg.channel.passive = arg.channel.chan_radar;
 
 		spin_lock_bh(&ab->base_lock);
 		arg.regdomain = ar->ab->dfs_region;
 		spin_unlock_bh(&ab->base_lock);
 
-		/* TODO: Notify if secondary 80Mhz also needs radar detection */
 		if (he_support) {
 			ret = ath11k_set_he_mu_sounding_mode(ar, arvif);
 			if (ret) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
