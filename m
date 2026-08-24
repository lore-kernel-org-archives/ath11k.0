Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F1FC61DB4
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXlIR70MotY7OfT34O+UemzHWb+H2mqTXl+J9INafOM=; b=Zw5stBH40QdTm67AQeuBcwxxUe
	HymHOeqdTLY65c0/a3M6CHDxaD+NoWlz/M//s/Y/AKs01/eQgichQuqczQxFhyXNvLQKcSNx4y64H
	xnIn2g7tzkmdhZPHIYFPwpLcMe3IYjr/dd85vyA+b0vYx1a3ZgE5LRDIeEX1/qdCPe/7dQcnhOj+e
	t582DvT0DT/2+T5MddXuX6OKANO8eFUcMhImoRhyPYoyZZl5mF6a7GHQt90OKUcM5NsVzJS1Myo6h
	QAl7nOq2FVY7U6bfgg9pfsuLdld/oFLMaAqHdhm4G7V0z50yss1mn12EVwixJZITQ5fQAIh2Kx5vY
	/bZUbsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbJ-0000000Glvp-3XDh;
	Mon, 24 Aug 2026 14:24:39 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbE-0000000Gls7-2eK6
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 14:24:36 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c2055573c8cso538354066b.3
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 07:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787581471; x=1788186271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXlIR70MotY7OfT34O+UemzHWb+H2mqTXl+J9INafOM=;
        b=qWFEy5aQhlr3OMkKaTeSYq3FNgCMar+ctE0QaiMJBKqA7n7+EZVXknqk+tAxD4d/Hl
         lLGCOTfUrECf6hY3MvNpK9L7iiE82g4VFHCLakGKUsJucdVQd0V+pxs+m5sHTbyvXfST
         3WFsxF7tuE6eyfPPg7fgT9DYArImQrGpLZBUobfQpOII9m023WvOfHjCFqM+xVUX/cQH
         /g5AqhfPtkGXm6dQhLvoB51dZrP6Ml5F3VouWCf/aBKULiNluliIcESEbcTvlwLC6aOO
         SPd8kiwtSZ/zTVfp3WhB9+bQvhYBAVxjQzDw03ie9PCLCfd0GfGj+1Pe4LnUl20A0jwx
         uNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581471; x=1788186271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXlIR70MotY7OfT34O+UemzHWb+H2mqTXl+J9INafOM=;
        b=m1gSUNrB/KIrgJLL7I98CtPzdJSm0cEhyBL2P1z/MNM67Qu9g3Qw+QzY53EYfj0jYX
         AyfIWSZlRpLUjuXAllMTmHBOFvJpf1L+F3HDK1H0oTz2ibiBNUo+1EQuGSe8C0MH4FPh
         Tk5NEodCvSIJf6XVeKlBQaGz7c6EmI24WzK4tw9Vl7VStcRmDBj3p3bXaZTcty2IwAcN
         0HPDe+QiYUb3GmnseAaTIviZeu1+dvcAhMp/87viQKe7y8pbLzyEKJBZtzftinwPh20F
         y4CigUi4KRwifEINgO85Yr3pAQYW7LEALqDDcl4AdpSpdirViUtxPp45b0sv5HnSmsxN
         0Pxg==
X-Forwarded-Encrypted: i=1; AHgh+Rp98dwVVdXwli00KV/yyLeC7TCo9sUnE0i/DzqkHStDb6FakLZNcKYY2U2rjiBK9exTOlZusDQ=@lists.infradead.org
X-Gm-Message-State: AFuF++n/EAvt+7q3wSkXGGQwGCNDPIlVQEzsGMpeV9gFMCXDrcWjLSdM
	/w4pvf68wgmCgLYOOeIeGTgFM876R4eGyjmvIuw77/xpQEw0rxXofct8OKXJtwaqPA==
X-Gm-Gg: AR+sD11FVwRf21dqbWWKkp7USe44tqh43ic8BaEQLiZDbrFrF1rGOfOOMqEV49Vqlsr
	iJP3oJqNJLuEozmAHX39Au/9zh3/uuzEyQKE7/H5Yz5hGaqWgk+QVLf3WS9VQwGc1PVsIIcoOS7
	3ESmqjzlBdbxIoKAtryQFtqTQe4/V/qZA2/4VvL6kP6SHSkKwPYi/XWI8TK+JOjw0KCDq4Amgc8
	cSkxuqztWReYAisiDmZHF9VBEUo6ESmD78lO7V/ANA9SPChXJFpe6PatIq0jAwbdlGNw9TduWWT
	CEzAdDrvZYdFm2xTtAsHt/YMzWtxtICSX32qWWj6fWVNbx1lrmz5wYEr/69iitUrPjVSwAnAYYZ
	1aNscaLH6uzhG9bTsBTDFwNxvhH6FV1XXsly4ZlFoVEn9AcFOblfC1JfNnpHcmMlSZxODsvV/pu
	gy2ZmMPgMKQvZcODUDGTAwHHU26lA4+TLKrP1MUvS1Bf2uJRKfFn43QghjOgZnMAWrXdYBKmH4V
	bwx1eJdIfHizUArQ58LEPZFZdjjh+29xzOWnAdCVcsp4T/cCygx4bqjLjCaenp33rXC6Nsxhjhk
	j9rjSvoQUbj6KUb3hR+AoAkk3DuzoeCDW02gFttYTfuMrcQG02fRw5bWqidzy4DD3YSRk/8pz8r
	U3YqNK2A4LURfuWDbB0YuOwxiFyjGdWw/XOufJXrgODr3+uj2Csf+xn+SKF1d5H9tgsL1qGjd
X-Received: by 2002:a17:906:6312:b0:c24:6445:d19 with SMTP id a640c23a62f3a-c24926f3cf9mr2273907166b.17.1787581470246;
        Mon, 24 Aug 2026 07:24:30 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1329890866b.42.2026.08.24.07.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:24:29 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk
Subject: [PATCH ath-next v3 3/9] wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
Date: Mon, 24 Aug 2026 16:23:44 +0200
Message-ID: <20260824142350.1757379-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824142350.1757379-1-julius@bairaktaris.de>
References: <20260824142350.1757379-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072434_761372_398E0A41 
X-CRM114-Status: GOOD (  13.73  )
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

soc_dp_stats can therefore say when the transmit path overflowed - TCL ring
full, misc transmit failures - and not how deep it is at this instant. The
bound those counters report against is the tx descriptor idr, one entry
short of DP_TX_IDR_SIZE per ring, which is large enough that occupancy
rather than exhaustion is what characterises the path under load.

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


