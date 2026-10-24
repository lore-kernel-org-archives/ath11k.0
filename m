Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B60606A325
	for <ath11k@archiver.kernel.org>; Sat, 24 Oct 2026 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RQMsrJkt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZtIxKZJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/jjdbJIsZF6G4eCWKJ+aUwuJXb16bpa6KobpLNWwJLQ=; b=RQMsrJktbGtVEz0aVJ62UhJ5dc
	+43NsRsNmhGIJ09ist19GNjf4MJaeGodEHTUlINFe9fkOKlqOZDAxYQb4uND3K1QravOWOscVr/Y9
	VJEOcEc6ODwf3xkVG0j5zLzMLxecaCzK9nFky5S0/XQcPEIF7TZn/BTLzPi8uHeezltySBXHQWX0M
	DcZebArJ64wi7dg6XszpWOYC6CK/q6oehyU4UvrVCoaslCpcU4MpNGiPbtt+2lHwcqXdlJnRIJLxB
	4uOIZzb3j+kEFjgfPKx1I9kPTbsqFxGVMK08GkhhpyWVduEa7+iY2P3WbLpWK7jXeRRW+tcznP2G+
	FkXhyMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKjKN-00000000YLk-3DqK;
	Sat, 24 Oct 2026 21:30:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKjKK-00000000YLI-1hzV
	for ath11k@lists.infradead.org;
	Sat, 24 Oct 2026 21:30:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 920D943048;
	Sat, 24 Oct 2026 21:30:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792877455;
	b=gkMxmyXwbParL7fSnNz3LiaOeEKY6tqy4Wm3Ox7sbj1LCwdeIWGYCqPydE7lBlDs7Ez7
	 +sPfNSYdBSWgIkR9oJouqC+9XZyCoMwj/Q5OwA1LTTJSkigp9ogY6j9X7RkFFk9tNWsj2
	 K8GV/3WODnqJ8pkMOQs4C2GmYW+4lsqi6ma4IQJEyN/VcYrHWCDH1D5VUN/Tm7U3SLlFI
	 FsOm1VbZG+oil0YsybrVcVxujSpzVV7x2MEoVhiB175ctbIAOVxmGuYD2dpXoE4ZeKoZz
	 d76iIGv4YV7fC8D/2XQJIpV/0XyXZFxnwIb3/R8dMo1mT7y9LB55XqsKCTlmlGiHVUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877455;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=/jjdbJIsZF6G4eCWKJ+aUwuJXb16bpa6KobpLNWwJLQ=;
	b=trKWgUUu8/Z6E41DPxVVNsJ6SGCzhonU+0lu/KBV/JVbfxo6IqYbkRbgvu+HAL+VCP5l
	 i9oLzRrRLEm+rJAgnx+d6m4WG7hSg2yKwqseCoiHBODqtUbYywguffDI6/ptkhajF1UIf
	 TtrFaJxzQXWxQdZ1xjApJZRqXRx5i4UDwIMhEzlX3S/20H7t8fQ+QygrLLA7xMxNtT6JE
	 7Twi251MzO2fjNdMm4RGEI/ghMoTo9t9hnPMbdzEp6+sJBV3rJHfZB7UbrDzctYQYCo4B
	 qxNGX9VK7C9gaSCXHtcdTkA5IDiPmzNNBQz+b/DOqqSKYEHw8Z7+/dU7ARMXhoLtBvw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB41F1F01829;
	Sat, 24 Oct 2026 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792877455;
	bh=/jjdbJIsZF6G4eCWKJ+aUwuJXb16bpa6KobpLNWwJLQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=VZtIxKZJ5E7ZHKElFJpm+t+eRAHXS51JhEgnDtgfy9MnQn4b7Z8ONkIYEqsQqyRsA
	 daKFQlDn4nFMuIDAoEvC+NnSfZ8qKAUPUFxvfbxPXuIzkXlP/n1PeOqL6cjWa03/aY
	 2K8Ipcx1CiVfDk5Z3/Gk//sTraQR8IktKV+1sXdK95lQDKgA5i4fzIcaIvliyWnuRA
	 8Yq6Y3ne7fZFDhI/las29F5EaIh98niMim5Rx+Q5GYQUXvHcNrW8J2QYjtps8hlRJU
	 NPelZO8cj4L4LcGNCLGpwK/eRqKDe2dGA1VIjiCETyTJyF3rdNPdRhQcUa7cQDp+wo
	 9nmrS9HB46HKA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4CBA2448B9;
	Sat, 24 Oct 2026 21:30:54 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Subject: [PATCH ath-next 0/2] wifi: ath11k: two monitor destination ring
 fixes
Date: Sat, 24 Oct 2026 16:30:53 -0500
Message-Id: <20261024-ath11k-monitor-buffers-v1-0-ff155feca2f6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI0j3WoC/yWM0QrCMAwAf2Xk2UBTZkF/RXzYutRFsZWkk8HYv
 1v18TjuNjBWYYNzt4HyW0xKbkCHDuI85BujTI3BOx/I+R6HOhM98Fmy1KI4LimxGro+hhjIh+N
 0gha/lJOsv/EFWoOZ1wrXv7FlvHOs3y/s+wdJDL5uhAAAAA==
X-Change-ID: 20261024-ath11k-monitor-buffers-04c6c61265d9
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792877453; l=1099;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=L7gjGCmzyeulE7eU8L3X1sKQ8Bvh81x5kGFaYfXJVKI=;
 b=NJoaftq5eB0g13ykQ6+EM7DAMk3urNmrzlqGDQ+5julXoUdBraj0sIAVZMVoso915GM/3WYFo
 5v5y4nH06mtCyRd+Jrvhyl53Fm3xl2KByZyWn8P3ay6ZX3dtxBpGY7R
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two fixes for ath11k's monitor destination path (the one non-full
monitor mode uses, as on IPQ8074), found on an Arista C-360 running
OpenWrt with a monitor interface on each radio.

The first stops the driver freeing a buffer the device still holds when
the device lists a buffer it handed back already. With monitor
interfaces up this corrupted memory and crashed the AP every few hours.

The second fixes a small leak of MPDU chains each time the PPDU ID wraps
to 0.

The two are independent of each other; both apply to ath-next.

---
Christopher Griffin (2):
      wifi: ath11k: don't free a monitor buffer the device still holds
      wifi: ath11k: don't take a monitor PPDU ID of 0 for no change

 drivers/net/wireless/ath/ath11k/dp_rx.c  | 32 +++++++++++++++++++++++++-------
 drivers/net/wireless/ath/ath11k/hal_rx.h |  1 +
 2 files changed, 26 insertions(+), 7 deletions(-)
---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261024-ath11k-monitor-buffers-04c6c61265d9

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



