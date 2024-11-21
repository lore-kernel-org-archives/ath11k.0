Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E766D6ED38
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 13:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NT/7zt7QuEV/Kk3sqVlQKDW1L0Pc67ql8yTEx8ufbxs=; b=zAZ4WCr/QnpmnkpFFWTELtGNWv
	zuz9OqL1Uo2GKz9uf73L9ish4KyGO8MJO78B5OyV0MLp+MYqJ2Xh48juvjr/moqsX0OPr64ueatp9
	/FbAXNZLnrVv3L42f3C9JgwWUUoGlUPL9agPYMcdqHUwSKdtAMjoQNx20VwiZo+nBto7VLGCre5mY
	NsPdErlbT2yAfa0/g1i3MlsFivun7Xq0DqP3iyXxlyGPoIgUfP6V+uTwj8c6x9XtMeCCFpMGwHMZX
	HQ3S95RUoPkzCTn/Gojzg7q/eKsa/o8JMoEod5fSsKEz7ylj+05ErEwcSS3Wb+mcPF2EOZYLVjqAW
	eBc//JdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE7UZ-000000008jc-1BxC;
	Thu, 21 Nov 2024 13:45:07 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE7UV-000000008ia-2zif
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 13:45:06 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id C31A813801B5;
	Thu, 21 Nov 2024 08:44:59 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 21 Nov 2024 08:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unformed.ru; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1732196699; x=1732283099; bh=NT/7zt7QuEV/Kk3sqVlQK
	DW1L0Pc67ql8yTEx8ufbxs=; b=LnT/4y1dpAyWGwKdJg3cclbXXHPUE5Q+VhVqj
	Pa21s1fVFWxdmJL026FjMAMeOVtaW3T9Ofg+riTzrdioubVLIlneP6cxXOA2XVU8
	kkCvF60jdOkzKxu9GWZboD3Jt9vjfESLyGp6hTse5YiNKaRadvEYo1CZ3hDTDS6q
	l7g3Kq04tL/rVzHvo5+Ji22MLKCgIvfnbrV4EJrko7eDZ3Jp6i+CQsdLp1ovv99w
	7zqIjhwp5BH4Xa9u9CRIACJB8J0N+JM+24BDJlJX8w3hRksY6L76WGKdCNs2lf1a
	eaMOHWS8gmYldaPCYwVISdlnSLpubOzoXNhYRZDfqhddYZSUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732196699; x=1732283099; bh=NT/7zt7QuEV/Kk3sqVlQKDW1L0Pc67ql8yT
	Ex8ufbxs=; b=sK/jKw2q4qLNNwp0YDJJk9ypJALM+qsfmkZEOhgwxfr6sOTG989
	9ASU3buVguRGsRaToRH1stjhEyTZlgCo0tTv/O9hYOv9yQ9U3g4LpV14NBNeNnIx
	63lES9EMWX+BubTb7Pe66irw0spZPP8VUO7RZXeEEPq4SLoksEN4AvQAC6MFVPpz
	RZIVa8KCPZ2y4GXTZpMQkIEeCwxqZuLu1+J4kM5xgDL7qI69ecsI8I8Rs1U/V0zU
	dIRI+sLstVb5ao9hlPV78RcJxZ4hUfQz3t5ogYLCWWrork6YqtjksuBa8H87kmjL
	zxnCjCjkENfe/CLVDZpmR9SnCr7f5+dgdJg==
X-ME-Sender: <xms:Wjk_Z0rjlyy8tpVR_daxMpr6Rhp3hKuOAxk_-1Kb0GcY0iCg7I0zZQ>
    <xme:Wjk_Z6peDm_baMJBMR5yWF0kfNPITUOYUK5ON8Ud4dZh-oztQwbM3IXA4IwOU-_IV
    jKTU_v9I7MaYgPazSc>
X-ME-Received: <xmr:Wjk_Z5NiQ9ooXtoOxU3vfqR-tSHKnjKC31I3XKzCF2e2246nXWbSa0PFnKD2uWWPPmDV2DDrj7IDFm4gSD2koBFsgoNMV_pa-YknMeskZwLen34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeigdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhr
    ohhmpegjuhhrhicugghoshhtrhhikhhovhcuoehmohhnsehunhhfohhrmhgvugdrrhhuqe
    enucggtffrrghtthgvrhhnpedugeeifedutefhhedttddvheeujeevgfevkeffffduleei
    teefueekiedujeetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmohhnsehunhhfohhrmhgvugdrrhhupdhnsggprhgtphhtthhopeefpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehkvhgrlhhosehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrthhhuddukheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdp
    rhgtphhtthhopehmohhnsehunhhfohhrmhgvugdrrhhu
X-ME-Proxy: <xmx:Wjk_Z752qBeO0-qO4KwAX82PMKwGCbrifVfyCQcNTE0pRJ4lYhR2Vg>
    <xmx:Wjk_Zz4H1eSilinfm4o0S2lr1SC-nGcu4ZgOmtNHFp1wF2O49sJegw>
    <xmx:Wjk_Z7hlRMWsL9cTHnTqH8WmOQ0U9QkuIJ0EORFbQGe8KVXn9kAI1A>
    <xmx:Wjk_Z94wwDkTpfQOYtr0KkPQXGolaAkesfvPk3qdWB_X2oz4bayxyg>
    <xmx:Wzk_Z1nKPsoUB84xLRKULCHsN3OfuuV-Hc9i7WqK_YRgwZIKiwu2itat>
Feedback-ID: i2649496d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Nov 2024 08:44:57 -0500 (EST)
From: Yury Vostrikov <mon@unformed.ru>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org,
	Yury Vostrikov <mon@unformed.ru>
Subject: [PATCH 1/2] wifi: ath11k: Fix 2 second busywait during stats request
Date: Thu, 21 Nov 2024 14:44:23 +0100
Message-Id: <20241121134424.31006-1-mon@unformed.ru>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_054505_229033_E797E198 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

This diff fixes a 2-second busy loop inside
the ath11k_debugfs_fw_stats_request function. The code in question was
added during the initial import of the ath11 driver. While the ath11 code
is based on ath10, the latter doesn't have this bug. This diffs changes
the wait loop to be similar to the ath10 driver. It also adds an explicit
delay before retrying. An explicit delay avoids spamming FW with stats
requests.
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 33 +++++++++++------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 57281a135dd7..436197113ced 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -182,24 +182,22 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
 
 	ath11k_debugfs_fw_stats_reset(ar);
 
-	reinit_completion(&ar->fw_stats_complete);
-
-	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
-
-	if (ret) {
-		ath11k_warn(ab, "could not request fw stats (%d)\n",
-			    ret);
-		return ret;
-	}
-
-	time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
-
-	if (!time_left)
-		return -ETIMEDOUT;
-
 	for (;;) {
-		if (time_after(jiffies, timeout))
-			break;
+		if (time_after(jiffies, timeout)) {
+			ath11k_warn(ab, "could not request fw stats, timeout\n");
+			return -ETIMEDOUT;
+		}
+
+		reinit_completion(&ar->fw_stats_complete);
+
+		ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
+		if (ret) {
+			ath11k_warn(ab, "could not request fw stats (%d)\n",
+				    ret);
+			return ret;
+		}
+
+		time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
 
 		spin_lock_bh(&ar->data_lock);
 		if (ar->fw_stats_done) {
@@ -207,6 +205,7 @@ static int ath11k_debugfs_fw_stats_request(struct ath11k *ar,
 			break;
 		}
 		spin_unlock_bh(&ar->data_lock);
+		msleep(200);
 	}
 	return 0;
 }
-- 
2.39.5


