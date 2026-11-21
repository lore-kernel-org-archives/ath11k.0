Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDE560A380A
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dx2QJGtp;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vcYqHoBD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F8ANKK5K18HEbCqMKoJNZuWBCRpXtLBYrpTOrUncVlM=; b=Dx2QJGtphlz9g1
	TTVckqi9l+NM7DsKZDjkMB/oi7CzxzHY6HzWKHmaKczA/+iDomvzScYsgLkajCHeL3qb20aVN/y7O
	6LoXeGB00Lg2IsZ/gD88e7V9i5nBqmI7fczYVM1fV25jlkLHrUD7UZ39p/XsxNCJBhLWfm5BL1u4x
	WWcHL0jeflA1TASlQ0bvcglg91ugp5lSGt0mw7oBhAj+nZ9vacToYlulZQGurpvmHKI7/8ljwgJfc
	nT9OjAntUpFhIIXsnYE4+K2OX1+qw0MqVntq85/ydZEre3hJK8V80RC8O6Cj58e5i3T3+AReHMpm5
	x42i7GvSdCDMOscOL9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBR-00000000S7W-2WHM;
	Sat, 21 Nov 2026 23:07:49 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBN-00000000S20-32v9
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:07:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c516a194350so20422066b.3
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302464; x=1795907264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8ANKK5K18HEbCqMKoJNZuWBCRpXtLBYrpTOrUncVlM=;
        b=vcYqHoBDXUCdGy/Q1Ou1U943OqIovInF0YWkyQHTU7fl6OzvXOfk0g3txOOQgjd/Oq
         UtpTiE+kSdfGlyPCAKkAXFWMvcabG4DPVyW73rG7I18Ej0JZfKeP+SByjVCHEZ9KYr3S
         8NykQRw9msoBGY2RD0O5o1i/yaNeS1EyBcTHF9ih/WY/VFjcMHErDf+COvP9UWkyR7OC
         tgAbQoZmXYWSjEOHWF/EKO2iAMBeeGbUiszilEDT5bov7eDMDG7gi6q55IylOrmWVcs8
         j4DWD9XzzRXEASyFKgn7d8E+f9L+rlwpgj/lzee0TY7U5UNZ4vkvVlEDV+fZJpXFlZe/
         4IqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302464; x=1795907264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8ANKK5K18HEbCqMKoJNZuWBCRpXtLBYrpTOrUncVlM=;
        b=ALnTWYv4Bt3FaK9e+W1uXCCz95qD4OG+yvmtutn5gfoBnZuArTNqt15uXTxu/xzdNa
         FJvI1GW+hfbYTSIklKsJU6kCYZzc7AL5dZbbI/+1g++Ln1I7vrKn744/izccj4MBM/5/
         DqKrAcacDvu/uH2+OjpmzetADdf1056FEgr8mgyyu5t/0OfU5ZsffEZTmJb9/YavaGRH
         zsLKfrdOSmx7fckK2RsQBu2I1xLs0VKqdABEAsyRWWYRTfSXs3BbdaHIbVhEOi2oRPF3
         GZcJYbaN9C2AmgvsMiM96K5dIrrB8+cPbWNkurt2WtX3eFKVu9YREd8AhQsrHTje+Cc9
         h71Q==
X-Gm-Message-State: APuU4Z+Du836HNy6ogbfxZngzJP2NO9D9QqGhvbZUDfxlFeyNRIMiQwB
	Dv++CirasRhwV++yMb3/ZKNxC13i+QuZInZwQrKDfskD5mkRUu3hAKzVgah0yXO8ng==
X-Gm-Gg: AZFdTZeoESeProKY3Ag9oHbUboG9xnXekzyUqt7y7iXCNeF8qaUI1QMVKu5t1Xug4B/
	7mvzCDngz0NxSN8Mp3yEXkp5nZ5Fuf83qIsJB2BtA1ZJDD58YZhaOfeJ820rpQIHzZnUPh81soX
	2ZN6WEgkaQzteJaErXxAgxQnHEl4S98frKFxi/APe9gL+L0W4+t22RXAEHfRh2KYFRClTPa7aCY
	e8h+uooORbFUVVHm2HNbkokNPIACCXYJ3NZISa9axFPlBhWnkyRZ8mtnHuCFSZqgA+6+O3Nual4
	y5E/Q1Y/C/UOpm+ZsfdVN2OzQL6VJt1JLSp7ONt8mM7HhGlW0o0EVhKHZOD91HeoB3bWEZPC/H+
	IOeTLOlxQzrQSnqCoYWiCFN2kfY5Js5ygaBcWI/4gm8E96skBBVD0+v36430F4ISGbSwfr5HFZp
	YQ8PgIP5TnvHjJNlGDnrTpUZ2LJbNGSWHa3ikBhZh2BJ2uEs47i8gJmvAafCuA8i2evBmYJdz/P
	HxXNOUapLet/hg1znLgB3Cz5KCmtiAWkKxlzNztpNJaOO4Eda8shE8byBIvTs3igMC10gJCN9f3
	K7xztiPZK4Ikn73B1GtZdjAaFD2GdKJMS0hFNtWbl2by9Z1m0j7I0aHmBifYZbenjCb9qu7C/eR
	eXdLIvwEg2JvNZsyH6homDysgrcFAnzDHuV0BLfUrCTw0hol3l+HPDBA7RZcXZRFtgQAILoqKhX
	7VL6BQj91TzfcWF1wuzM6rAntrfDHG+FjiMky0m59V/S7vO/ocuGX0E11i3+QjlBXsdt+vQVorE
	/9I7aGoWqjwqOA5d+BID+G/pj/gKZXPiR35NSmA/yLNOJbC4O25do3lIcEsbkjruBVoNEZiVAXn
	qum6Y/s7wm18ZBVrof9Lf7l2Es7lJTlaRWTDewc4ynEcJwY0nmLbNWbn9x27cBioFkEta8WEtdc
	=
X-Received: by 2002:a17:907:6ea9:b0:c2e:856:2a08 with SMTP id a640c23a62f3a-c513a3a6598mr657443866b.1.1795302464094;
        Sat, 21 Nov 2026 15:07:44 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:42 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 06/13] wifi: ath11k: don't disable ext IRQs twice
Date: Sun, 22 Nov 2026 00:07:24 +0100
Message-ID: <20261121230731.1206043-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150745_796436_4DD4FBEC 
X-CRM114-Status: GOOD (  16.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Maurer <fmaurer@disroot.org>

ath11k_core_reconfigure_on_crash() disables the IRQs at the start of
every firmware recovery and ath11k_core_qmi_firmware_ready() enables
them again at its end. If a recovery fails, they stay disabled. The
next recovery disables them again, so the disable depth of the ext
IRQs goes to two and the single enable_irq() leaves them masked. The
DP rings would then not be serviced after an otherwise successful
recovery.

This is the same kind of imbalance as the one fixed for suspend/resume
by commit e56c9d429ba0 ("wifi: ath11k: fix unbalanced IRQ enable/disable
during suspend/resume"), but caused by a failed recovery.

NAPI already handles this: it is only disabled if it is enabled. The
ext IRQs are only enabled together with NAPI, so only disable them if
NAPI is enabled as well. The pcic ext IRQ code has the same pattern, so
change it there too. The PCI CE IRQs (ath11k_pcic_ce_irqs_disable())
can have the same imbalance after a failed recovery; they are not
changed here. The AHB CE IRQs are not affected, as they are enabled
and disabled through register bits without a disable depth.

On IPQ8074 (AHB) this shows up when a failed recovery (forced with a
test patch) is followed by another firmware crash: the recovery reports
success, but TX completions stop, TX fails with "failed to transmit
frame -12" and the firmware asserts again repeatedly. With this change
the same sequence recovered 3 out of 3 times. The pcic change is
compile-tested only.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: f7a74e131d3f ("wifi: ath11k: disable interrupts during firmware crash recovery")
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new in this series, from Florian Maurer's series [1], unchanged.
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

 drivers/net/wireless/ath/ath11k/ahb.c  | 4 ++--
 drivers/net/wireless/ath/ath11k/pcic.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 27d01411b6e9..3ff7d5f27f5e 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -235,9 +235,9 @@ static void __ath11k_ahb_ext_irq_disable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath11k_ahb_ext_grp_disable(irq_grp);
-
+		/* The IRQs are only enabled together with NAPI */
 		if (irq_grp->napi_enabled) {
+			ath11k_ahb_ext_grp_disable(irq_grp);
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 2259adc3bbdc..2e7dfa8388b0 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -455,9 +455,9 @@ static void __ath11k_pcic_ext_irq_disable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		ath11k_pcic_ext_grp_disable(irq_grp);
-
+		/* The IRQs are only enabled together with NAPI */
 		if (irq_grp->napi_enabled) {
+			ath11k_pcic_ext_grp_disable(irq_grp);
 			napi_synchronize(&irq_grp->napi);
 			napi_disable(&irq_grp->napi);
 			irq_grp->napi_enabled = false;
-- 
2.53.0


