Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423C5CCF2CC
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tuCTSvy3W9YsRWTjeFGMCJACiAvnleVZWYIRp6x/ts=; b=zP+HV3/jvkSTLwsj0Vm4QvOqtk
	MKKOqR+/5gUCPiK2m5nKGkR60JuDlj7MOBZroCSZuxueofnIYBjdeccNwdgagolm7+grKs6S5dfKF
	vzxjsaz6UnZU2a0yvNQ9Kk9BERjGWrMynvhghZl2jKIF4irZ6Y13oCDl33yuiAzW10Op/UKRLmlSp
	I1QhCgJQOpDQjZGvmywiMqHxYBWn4j0i7TZp8xqy+Z2ILpx3+7vRyG50YSJdP/FQq7DDcXn0d1Kl4
	dBW4Xs8Grv0OX0NXlea/ysc70uDSUEIwPlBpGIVO1a/Wwqz/4JsVJU7KkueL1R1ivqBxywCp30kCW
	qYe+qlTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0X-0000000677A-3X7E;
	Sun, 18 Oct 2026 17:49:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0V-0000000673d-0F45
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:49:16 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c2a4e013a44so161359066b.2
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345753; x=1792950553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tuCTSvy3W9YsRWTjeFGMCJACiAvnleVZWYIRp6x/ts=;
        b=yfEjvschVoGNnazerj4cxVn6/UCO6GuK7ptwuttWEkTnKUyk9wfKaOXxrj0aQqddNL
         Fwd7tLtvhoOP9FK3DR3WpSzXrgJDUnFcTHMRy/qfaQBIvk9CdgnMnUc8tf2JW0+s9mlo
         PfCjwcw0WKhrMY+PK4RO6po78n0uR639wNfiAxPENKbY94oDwCzXisYCZIMlx0Gm8sLf
         58JS2rl4qHkIXJf+i1l/QFkvueOTJ0VWLoSHjyAH+pGh7Atxbp6907EhxqkqyuvLCCDd
         gChfOOXOHmpFFBaEnt1C9zzMSjxe9Sj1duH0Bi8NYb62MRrg1HRQ+7/M3m/m7bC2ivzV
         JRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345753; x=1792950553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tuCTSvy3W9YsRWTjeFGMCJACiAvnleVZWYIRp6x/ts=;
        b=qaNhZg+HXVNfWwFDBjeaPtv3nNc5zc4p9Qgj+vErVFE4j9HWgPzM9MiDSfPDO8m57U
         BRuAztS3aLXm0tAKsHa4CFhxyraIVJbOxl6iPUM+ZNtwn9HaeCZg6ANZxXMgdkWXhcwP
         J3KkqWEvW45/ciM24cIJ11gTLABFa5i02QqhTpOVoZahk12BWZw72cGTkcYXQio1+hZs
         Zey1iC7DWYSB/3F04aem4osmKbQZK++d5Qe8QkxDNpdPRW5uJP8ebKmPvGdp8IGQo19n
         HTa370Wg2uraHjepAL83p4nwFY098dXheBapTrTXYZIQqB1EwzT24Rk8vn5GFyPKu7Ij
         uR9A==
X-Forwarded-Encrypted: i=1; AKwUvBzwxQvuSchqEzp28bEs7OxQyt8RaNf1+txeK5l3Zptt6r2PG23WbLGvMPePqx+MvMdLM9gdA80=@lists.infradead.org
X-Gm-Message-State: AFq9FYJNfYpA1cwUVpVlipnF3yMayamHG5FZI0XKcN3eCKVotAvZjgTa
	urZbmBPBFVr23tS3meqenfg4qGMIRt4mFKZ31UC0H11RfT/Bav7EkvpgByEge5GafA==
X-Gm-Gg: AYBFou3BcZNwPqhSRfi/W61V8XOFeNlinHhdX7ZUqaIySrq2QjQOZow/mpgdyR8pP6+
	B7yv5kV+T5Pxc+kNThbxKiI1rPa/lRhxWEKEeJO94kXtWjz45O4n7Kk6V9y+NeSSpEQg2JLqrcl
	ZDCKIexDssjJWhfcbflZF999d6TUqgGoE1L7OaEX8ivgf0NIXwRtG8SYdRv+lBTd/1QIkY9gON0
	BtepuazuNAKemDRiPR0ngy16zhhqT5PYMtIOK6mTdMhiogHO8YxbeIGKJPcBsdXO5dd9EV3t5e4
	RmFW5+tzKvXSdHb1bfHKydoUpeCn8SZF5oL5P1JYX4b0VwuzO5oZxMWD3naTEeeqDB80nAkpaof
	aLllc4D900SIQ4v/bU0cyQBMD65Z/Uy2jnX1yV5ZkFO9cavUod1eRN+qvda+Ygrt/X5rWCOUgAI
	3mvqBIi5HS2zHbOSDRG/40KV250IuPdTteYtS3/gcWp4ikpORYRH2RCeu11Kmy/+9OwZO0R6cA0
	iEJI/PV+4iRs85p4AIgdssXCMnXmLCCmFJXqSX3NCRkCgro4dGTm1KNWWJNBzmuFM5ZypVtf/+1
	ydw855Ok7MTqW6fAGT4DoVMzohfDPRY/fojFADcguhXmScy8KbGtlLn8ZeW8Ho16OpdC/J44nYG
	EhYML09tEEauH3j8OdsUJ/E0WfVYsQnP5IDQWaz0jxJEDEk/Lul1RWKc7T4f9AzT9jgh/QL+yDA
	fl9ieOsXvB
X-Received: by 2002:a17:906:f5a3:b0:c2e:6a4f:a88b with SMTP id a640c23a62f3a-c4196f9c1b1mr371299066b.0.1792345753149;
        Sun, 18 Oct 2026 10:49:13 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:12 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: [PATCH ath-next v5 3/9] wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
Date: Sun, 18 Oct 2026 19:48:58 +0200
Message-ID: <20261018174904.1757161-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_104915_158978_009E5C77 
X-CRM114-Status: GOOD (  10.68  )
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

Nothing shows ar->dp.num_tx_pending, the MSDUs the hardware has not
completed. Print it per radio in soc_dp_stats. Divided into the pending
airtime in a station's aql file, it gives the airtime AQL charges per
MSDU.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb9..ffe1f466aefb6 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -714,6 +714,16 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&soc_stats->tx_err.misc_fail));
 
+	/* Descriptors the hardware has not completed. */
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


