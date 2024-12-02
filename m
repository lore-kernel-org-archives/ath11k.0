Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C744D10DDD
	for <ath11k@archiver.kernel.org>; Mon,  2 Dec 2024 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJLX/DjPT3GcTzak124rApB1YA2PHiuhhYQM4Pn37+U=; b=3F2bd+K23rBLfebPiNQUMPdayl
	coyyD3ZVoiZxXYV7jgvf1Rlltg815F9Z7YTg4yt2uAEp35zmpNEIkWfU8MEpAkO7IdjJfeSMVIvz7
	vhrQjzCaP+XJaglUPsLWIdAIL6O6hyNjEUe8WsMZZnTpyYq8uQmZrzTa2Hnkvp/eZwR16cGSpkb2P
	E2fJEFSNuLKozB/I6eGACFTMYT3nvhQI4YYTZcLj0OomavVUJCU8mDZ+B/iI7cRKCtlMRlL+MSE7m
	XsNNo8t2PDi1xX3ms61DO7VbCAS3t01iOSllpPI8Si1m1RjmLh5EXQ3+f7XaaIC7ZGK0owm7onB9I
	v+p+yZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2c6-00000005XdM-1hxV;
	Mon, 02 Dec 2024 09:21:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2c2-00000005XcH-3uxT
	for ath11k@lists.infradead.org;
	Mon, 02 Dec 2024 09:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733131260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pJLX/DjPT3GcTzak124rApB1YA2PHiuhhYQM4Pn37+U=;
	b=Zk6w9y+XNXw1hwy2btzwYtZ/j8XZjOyyYeHHY8qRPzw+W/bdSTkDJgkEkgujydOQGWoOXO
	1AkOdyjZC/9pXdRMXOuPVmUZ/Z32NpNbHacxNcNPO8VskPgq/hltShQUbEwszdNUNltKIl
	5GHxboQBixVmnedAbAlEcS0gYquQD2Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-424-rQ6mmeXWP1Wn6wQRCo4ZFQ-1; Mon,
 02 Dec 2024 04:19:17 -0500
X-MC-Unique: rQ6mmeXWP1Wn6wQRCo4ZFQ-1
X-Mimecast-MFC-AGG-ID: rQ6mmeXWP1Wn6wQRCo4ZFQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADA5A1955D8D;
	Mon,  2 Dec 2024 09:19:13 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.188])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7F3151956089;
	Mon,  2 Dec 2024 09:19:10 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: quic_cjhuang@quicinc.com,
	jtornosm@redhat.com,
	Vladimir Benes <vbenes@redhat.com>
Subject: [PATCH] wifi: ath11k: allow APs combination when dual stations are supported
Date: Mon,  2 Dec 2024 10:18:30 +0100
Message-ID: <20241202091858.200773-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_012103_099317_1F6E9F30 
X-CRM114-Status: UNSURE (   8.94  )
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

Since commit f019f4dff2e4 ("wifi: ath11k: support 2 station interfaces"),
if dual stations are supported for a device, we can not configure more that
one AP and/or DFS cannot be enabled.

Enable this by creating a new parameter (ignore_support_dual_stations) to
ignore this feature if it is convenient. Default behavior is to support
dual stations if possible.

Reported-by: Vladimir Benes <vbenes@redhat.com>
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index be67382c00f6..55c7a55d85ff 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -37,6 +37,12 @@ bool ath11k_ftm_mode;
 module_param_named(ftm_mode, ath11k_ftm_mode, bool, 0444);
 MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
 
+static bool ath11k_ignore_support_dual_stations;
+module_param_named(ignore_support_dual_stations,
+		   ath11k_ignore_support_dual_stations, bool, 0644);
+MODULE_PARM_DESC(ignore_support_dual_stations,
+		 "Ignore the support for dual stations to support other combinations");
+
 static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.hw_rev = ATH11K_HW_IPQ8074,
@@ -2162,6 +2168,9 @@ static int ath11k_init_hw_params(struct ath11k_base *ab)
 	}
 
 	ab->hw_params = *hw_params;
+	if (ab->hw_params.support_dual_stations &&
+	    ath11k_ignore_support_dual_stations)
+		ab->hw_params.support_dual_stations  = false;
 
 	ath11k_info(ab, "%s\n", ab->hw_params.name);
 
-- 
2.47.0


