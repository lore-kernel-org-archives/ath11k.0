Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07F5C5DF94
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRfRf2Fgkto2eylatQTpTDlM8qkBEZ0zYa2j5Lueb1w=; b=i/T9YNWYZOI7L4CHOcFXQOKE/H
	FXW4KVrvjMQBf+7O9wQweXN4T9dvD05L280SOsdGZxdq9WBpfIbp7eGkHHbsM2L/fk0ODg3/Jw/8m
	jiVgZ7VnNoM9pHVP4AXhQlWbx0bDzUyAMR2TfPEVionXyAEkcYNnDyP7Q7vAy1Nskiau9S6q5o9Ct
	e709/tPh7zSrnt2QFYgwFITYQYFRgR9QT4/UJXs1sbL37jE9U4OxWq+cxMggTEuRr+mDPujXdEvfC
	m+C4JdBQjzAqYebqkDoSvlPTU5fL6E+2BpFr59u/3UEX2HNz60htDegi/1FGWtcU+6IHR+J6+jBU/
	O7NEgV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKc-0000000G7B7-1UeF;
	Mon, 24 Aug 2026 07:42:58 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKZ-0000000G78A-3QMJ
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 07:42:57 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c197e7e4e94so555350866b.2
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 00:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787557374; x=1788162174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRfRf2Fgkto2eylatQTpTDlM8qkBEZ0zYa2j5Lueb1w=;
        b=klOAK6lDr2nNDtUGOccEZL8BUUcgBDZ9Z5OMUPkYfLkdQdMbHfQQXDBO/AujSeLGnD
         EraqQ4+mtzyCvFX3bDDQHVDeR49gVs+O8oE8lFixtz4sf/oX+VbEGnjwxorcvyhmVUCQ
         EO0HeBgpuYpCD4y2jX+D4VII6NAUQKidsYgPqOZXoLTwfzy0oTAVNLzOgprC1d+W7YKp
         5/2V7z0o3s829ylDMURMr3hj1DBvozxn06hA2TAN4/n4Q+zzcVK/MByGLzETcGDht1an
         OuTLUPD3WIDfCUqjdDciTOX7Uy8gd34iXr5s2xwnHXgG1V5UsKLbmmt1n8WaxbzZGXvk
         oIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557374; x=1788162174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRfRf2Fgkto2eylatQTpTDlM8qkBEZ0zYa2j5Lueb1w=;
        b=Iu+kDYROYApq3KmBoZ5mf9Qx6Y2TqIcbrYGQcuNrvt0+3XMaMwfhhsLcaJt3RSrlv8
         zccPygsilRuR/R+c69nj9EZpvGFZ3P6LFErtLy7mBdyEoYiFHb9UTnoxpb42iScDFu8W
         5gyDpokOwamqljTvj+nBES7VoKARnbf6YuP5yhSoHRVN+mTkYI1VeROxaaNPLOXQNjU4
         6SB1cLUD765wwQP6khAoc1HTCwlLAB3EU4UQ4H5ICuKdGeRQGMLHQdekSDiY6jIEfhdt
         Tueh5PJTJGAb8GXT5v2Cb8wuQ9Kmeu+OgnM5XPQsdVc3ZKZozSIeBPAkU8wFIU49WA8B
         fH2w==
X-Forwarded-Encrypted: i=1; AHgh+Rq9sa0cnjSABXwet9Z8S0Tx4h4d6UOHEWOYy43DSsNDNcXC9KWa5ZcwKdVe0vV8UFp2GCXYVVM=@lists.infradead.org
X-Gm-Message-State: AFuF++lDhVFs+xUhlj9oEi08tvgKorxRyMDwWjli5VXKd5qrStJkj5ge
	McexaAKLHCOU1FqLGWR2vEuNIiatxJP11z6tJjNvhV4DkWV4YT1RYSH2NzxQN/3bJD9LQ8wyTQq
	GVtlC22CG
X-Gm-Gg: AR+sD10YLVZrt6gWzgGO6FDU0wAZilDJFPJKBR3bkFXWXPnE2eh+0xu7vwuCKKFPq7f
	yHmcqKn14oTSPl6oIwosFtwyCQUpVN9Rt3YBv96ixqY23/oY9S2u/Rg82aefDypHBgErj/pcn8j
	QswDqom/kuh//au2WOr5zwz6/KpK6GI2IYiR6K2YDxEG8N8cVaTwoJyvB6zOQkS998ILgozGUZV
	aouWx2L9pkXlAqhEhiBy/jRIO/8aT8ZNHzep5Ox/cc3aCWFNjIcXsKoUqRfTp1epnW/nHoDiQlS
	uqQKKOArXupLUGQE8cM3bPvgtvabSOqSa5I2phAb2FdFC6iff2qhWKZK3PgKY1QQC3wNYlWhaPq
	W8jcaiZJuBtVu/9vpAAoN+GyLGzF+FeYCx3UjwLrqMN1p0re/hX9/c213yUeq7ZLFrqt+Ta33x4
	c/XiyyUOYYvt7NJZofJUbqNDj1Gq44Zk9OUB6KBCzDYvlSTFb8uGp8Jo/XNIR/PA3d2Nv6hh3Ze
	Yw6kqoeGgEHyIsQKcyBpq+WoC1LSdcZhyK634XJ5/eupNNmsU7CQSEeb1DXCVrHfP3KdigIlT9C
	SmQePz0WA7x9JALf29RHwbn3+c0J1qjSbTsSoc3TrtN9OjNjo1T0E5/x4nAygxK5feYp5pCWZlh
	t+IjxlGDYjX3I28w8Sy2vxY8p4mrkMnhaSVZpz38bwAyfG8vFCbpmbASELzZ4DXqikSAjOrfk4H
	26/toMu68HbL/32jfTlKGhF0DM
X-Received: by 2002:a17:906:9c93:b0:c24:6687:bf6a with SMTP id a640c23a62f3a-c2492663ee3mr1794089366b.21.1787557373753;
        Mon, 24 Aug 2026 00:42:53 -0700 (PDT)
Received: from Desktop (p54affeee.dip0.t-ipconnect.de. [84.175.254.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1261549266b.52.2026.08.24.00.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:42:53 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 3/9] wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
Date: Mon, 24 Aug 2026 09:42:22 +0200
Message-ID: <20260824074228.2114579-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824074228.2114579-1-julius@bairaktaris.de>
References: <20260824074228.2114579-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004255_995787_120E0E5E 
X-CRM114-Status: GOOD (  13.85  )
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

ar->dp.num_tx_pending counts the MSDUs the hardware has not completed
yet, and is used to wait for the transmit path to drain. It is never
shown.

soc_dp_stats can therefore say when the transmit path overflowed - TCL
ring full, misc transmit failures - and not how deep it is at this
instant. The bound those counters report against is the tx descriptor
idr, DP_TX_IDR_SIZE entries per ring, which is large enough that
occupancy rather than exhaustion is what characterises the path under
load.

Print it per radio, beside the failure counters it complements.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb..9dc586b68136 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -714,6 +714,18 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&soc_stats->tx_err.misc_fail));
 
+	/* What the hardware still owes a completion for. The counters above say
+	 * when the transmit path overflowed; none of them says how deep it is.
+	 */
+	len += scnprintf(buf + len, size - len, "\nPending Tx MSDUs:\n");
+	for (i = 0; i < ab->num_radios; i++) {
+		struct ath11k *ar = ab->pdevs[i].ar;
+
+		if (ar)
+			len += scnprintf(buf + len, size - len, "radio%d: %d\n",
+					 i, atomic_read(&ar->dp.num_tx_pending));
+	}
+
 	len += ath11k_debugfs_dump_soc_ring_bp_stats(ab, buf + len, size - len);
 
 	if (len > size)
-- 
2.53.0


