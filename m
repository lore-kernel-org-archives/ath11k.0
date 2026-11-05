Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAE1606D808
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 18:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lpEAyPve;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HgWspvau
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yVPwvuQ4429GMVDIFBhVp3gdRyKw4KIG5B2nOMvQFTs=; b=lpEAyPve21PAlowlI+lKfOqtRj
	Ef5zGW3WX0VJ/OTduBbVojD0NdCnan7qT6V+tghfTHsrPW9d65L9rLZuiRs/k13cIgjSpU2jO2R/S
	T6/Rm8PCtwjLkovYX7/lEEEDORcb3b28LWNukKmgz8IjzlvOQIoywgyQBfwkOczCAMoQ+WtgM3KsD
	E7p+yxpbjzrNPClK49LbWrakMargx9NFxrYPpcnA8XAK9NpxyYkkvhaKgOSzBq9lhuOBKqX6g0udn
	vKXBF08Dp/cJFtvCbVZw+pwj2lJOuQA/NckNuf2mivYxZl1L3Gl7a+Yim8DOQHYglqdCqVm8jbt3A
	gWq85drw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1wp-0000000A5PC-0maW;
	Thu, 05 Nov 2026 18:12:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1wh-0000000A5Kb-29MQ
	for ath11k@lists.infradead.org;
	Thu, 05 Nov 2026 18:12:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 844F2600E4;
	Thu,  5 Nov 2026 18:12:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793902338;
	b=XL/k5esB920XWSr1gobs9+36NAugbRLJR/Qsb9E9yW+5epqzzXwyP2KMutbKgonVaHaD
	 p8/3fBlp8ti4daqp1VTRkuVzQ7Re19YkgRbyKRdRXPy9/f5GV1v9y1Yt//QywATJbHlEn
	 9puxPJNXfazAvaPIqMXCA5sFBZPovxw8nbA6dGjBoWnqerBxRV2Pv2q0/HehuM30E+4iL
	 WEEu4YZpUkrflueMjZy8s9917ecEt/3lyV/rHrklS1Ol+yYHan/I7EFyeL60dHm2DaKSN
	 JohxGtneAEQ/gdC4kW0roG+KI7Nbtx9C9rV9Yl11y1IhW3i8LQjhWv8fFVltf6mreSw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793902338;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yVPwvuQ4429GMVDIFBhVp3gdRyKw4KIG5B2nOMvQFTs=;
	b=cpAUwXfcu5FhHQzUnhtIzZbIkyVPu34YtZeq2ePQX8hM12POMg7gS/8tvg1cC6yvPVKp
	 3kDZGb/eYE+5FhUSWCp0B837p0lSX4GHYAP2iKF8kKs13AfkaXuFO2JWfVvuWpNWCwoPD
	 UdimKdVzP6eoALohQ1NGX5QpaPKZ0fIGo4NuaMGTSDjf32/eKE2cxu55aMvydVYqGiLHl
	 njLps88iPIAX5nZOUlxSVqoiBfQC7CUuoyMKLH8UouSIGboRlHnjYx4twC3OihCRaa13L
	 6SvjcwrYCgUybX21i1C3CRn8dWVrgKkz1b8IdKBd6SQHXUQn3feU7sUrsCLrf/bJf3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C33321F000C1;
	Thu,  5 Nov 2026 18:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902338;
	bh=yVPwvuQ4429GMVDIFBhVp3gdRyKw4KIG5B2nOMvQFTs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=HgWspvauZpoUm1k/8OF4k49yzZF6dcFDT9jRrLh7hw3iWeG5nmlfR/nzXD9RS8ueh
	 xKNUL/vYOf+ExpHA0Pr/ECVe6pR+MLV7p/cu2o+HZhLVW57a38wrc5q5gMcovWCj7q
	 MKDlC6yuX/40ywCdL62jOaAxVrcjbTzQsK111en1bmGdM3pDZPjdwHxHUamWfMt3nx
	 pPumPjngFRVYDByNWv2Fkwt2aixnVBX6X8SgEKxHV/JjoLIIdLpT5nS7rWfwp80SG+
	 BsxwhQZ7KUQU9s/kUIkbREBpkRY5/XyMlCs8okVA7xtvhkyT/Gonlf4+vzHHUO2Pxp
	 luagBYSz9A7ig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 55A49473B0;
	Thu,  5 Nov 2026 18:12:17 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 12:12:16 -0600
Subject: [PATCH] wifi: ath11k: don't report a regulatory event skipped in
 recovery
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-ath11k-recovery-regd-skip-v1-1-621538e64760@gmail.com>
X-B4-Tracking: v=1; b=H4sIAADH7GoC/yXMQQqDQAyF4atI1gbMFIX2KsWFzmQ0FVQSKy3i3
 R11977F+zcwVmGDV7aB8iom05hAeQa+b8aOUUIyuMJVREWJzdITDajsp5X1n0YX0AaZMXIZ4tP
 To3UVpP+sHOV3td/1bfu2H/bLGYR9PwDVGkOufQAAAA==
X-Change-ID: 20261105-ath11k-recovery-regd-skip-fe5df9c13b26
To: Jeff Johnson <jjohnson@kernel.org>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Wen Gong <quic_wgong@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793902336; l=1959;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=INYaQh0/zCuDz50Z8TnNyMsCxbzCWj5WLewSHjP8/pQ=;
 b=vEjMG+X+tk6vuWZJuhIkz0ixr+TOOkGvrHC3397VTx1kysdGNC1wU6eF0r9gVQ3SFKBDbNxgo
 YLRf3SC2g1FCi4GO6+EcvspkIIfkDbxQ6E8XvBfLC8O3L4TvSyviOhZ
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

During firmware recovery, ath11k_reg_handle_chan_list() deliberately
ignores the regulatory event when the radio already has its default
regd, but it does so by returning -EINVAL, so every recovery logs a
failure:

  ath11k_pci 0001:01:00.0: failed to process regulatory info -22

Before commit 7004bdceef60 ("wifi: ath11k: store cur_regulatory_info
for each radio") moved this code out of ath11k_reg_chan_list_event(),
the skip freed the event's rules and returned 0.

Do that again for the event (IEEE80211_REG_UNSET_AP), the same way as
the skip of an unchanged default regd below it. The calls from mac.c
pass the stored rules with a 6 GHz power type, never
IEEE80211_REG_UNSET_AP; they keep getting -EINVAL during recovery, and
the stored rules are left alone.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1

Fixes: 7004bdceef60 ("wifi: ath11k: store cur_regulatory_info for each radio")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/reg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 1030e119fd903..915400afaee1a 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -903,7 +903,10 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 	if (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
 	    ab->default_regd[pdev_idx]) {
 		spin_unlock_bh(&ab->base_lock);
-		goto retfail;
+		if (power_type != IEEE80211_REG_UNSET_AP)
+			goto retfail;
+		ath11k_reg_reset_info(reg_info);
+		return 0;
 	}
 	spin_unlock_bh(&ab->base_lock);
 

---
base-commit: 5c8eab13e391aaabd5a1ad58f3ee4bb10ce7573e
change-id: 20261105-ath11k-recovery-regd-skip-fe5df9c13b26

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



