Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A598C54F51
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 08:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+tWtt5LHOZ3EZZG9CR6BME0z+/0CE+s/sYD1S1X5wvU=; b=LTFrbVPoGSi5XYvFRDYjs4xkBR
	Ky/GXpX1BeIjWFXupnlDKBQ+Alm2YOHBwCkOAeBTFdDwc+1bC1LHAVaRixdGVobG08A2EnsFojhEP
	aLlxyUD5vTW7CE/8qKeFPFq+DdXyfrzK/0JvUlX6J+kLslavaPFLEVrdaxbEERfGOh2cizy5c1VBD
	7yMHAWoI13DhGCRhW/g06XT0lg/tXTSLoWS3bIK1OnOcSwvG6qJxJmpyWq9IS1Qjo7JP8t25dgDgy
	cENX3aAmcy4HS/wRFwK0J0eT426z4LH5w3gdf98YhtUN+Z/+U3jHqUMr+STTLtnKrjnnz8Y+LgjfX
	6/wkfFMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp06o-00000007HxE-0AR6;
	Wed, 29 Jul 2026 08:57:50 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp06i-00000007Hvv-1Q7M
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 08:57:48 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so4668105e9.1
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 01:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785315462; x=1785920262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tWtt5LHOZ3EZZG9CR6BME0z+/0CE+s/sYD1S1X5wvU=;
        b=DC77wnMBu9PpQN0QSlCIS+nOuMcS74uaSaPkbGAP/Kw+reUAbDKoSfbAOvC3m6N9BM
         qbdSTTVMS2aiHl1iLniD+VPz2+aRcFJzIv8/F472LBAJHeC6sUI586Fnv4qpPzX2azUv
         sOlj03zvBlBF41aEFxa2sGSaahRw9lNXdz6lUt3M+I1iCehPSWvuUj6D70Vvn9zSIIJz
         UJHBIlqoq7CoL+oQrVsrwLWG6T9dXVz9mh5/iKaNbiAQmiF4jPDbV+EdrHYQaq4exbGP
         SwgFeW6xwatVk8rWsFl5Lw46z+44+cSpMn8WPTzHOj22k0APTO0O+a+dYQvga5sO6/rA
         ixnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315462; x=1785920262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tWtt5LHOZ3EZZG9CR6BME0z+/0CE+s/sYD1S1X5wvU=;
        b=C5FW3y6rgNRTOJTTZq1zhKm1kfz1M1mxV0+y7sI/lll24PK7kLWEKrT/OMsBi4c5xX
         x5Vta0DlQEUIFbZ2v1ocCq7/6MnB3dgTDtkY4Kga8oUnHeHHCxQa99d3IJIkHXJ6SJGC
         4azpqsIAe3Dlh+SyfQOQfFgd/bNz3LhDA2U7cGT9iIaNHpB2ckzvR88dDk/6815zMpZ5
         yC6IdMRlVUhN9sQoZnrW9HCJTb6CAV9/xeqki98XpqfLu/s/+fpARdrD8IU/URTgHs5U
         TLb4Mwq7EicmVgyf0m9nTmRig9LKS4u2a2wWBwVMeuAa7pQxYm/JCM/DH8MYyo1R/SS3
         YE9g==
X-Gm-Message-State: AOJu0YwtTieax+ybx+q6gNbF0jcx+E/cAI3vsRzmS+cwITctlITF+hsF
	NJEg/b5av6zAbnH9kTlCXsQ+MMNv6ge7kiOKhiC916gK8MTITnZwXWt/YYXJxQ==
X-Gm-Gg: AR+sD10B7IRFkZeXCptLjHkr+LVU71C9cyn8C5XnVPLp12XwC0Jwu7yEvFdFJTSkLQD
	0XDGVQG08WmCzoMeT0/FAzP5HVL7ig8swcRIctUtdZzHiNIOhthbfAfzf7oAbPR8cmmLEQUBLOt
	Hmx1DI0XzvVztCiKW2T6cW/3E5S84twkVL0uDiBXPjac+lzwWuu2vHHIj7B6IMc483Nh86g1E6+
	KJYnlSuWAx5yZ2kW5ITB15UBKjPWfHaO11EhcGUc81tssUnEWfY/VpTMsp2Hce0NoHYCdh/7rOz
	58S/DaRQV2iyWg3ZAx2DJaWJf39TXqZ52zLkNSkCdxteVgn4TWmtrssxBq1X09IUgmhQLLjfzdi
	7SR9fML+IGlMbcJ2dGi6ktgnc/veu1glZVqOYxGvjcbHACJkLP7kzhf2C3BKbNW1KUhUUR5fgVw
	CRSdOEp0cAjfkKu44G4AnayWPcfl26cuhquk9EEC/IYFEkHZ2mrBUy7YL5oNn0NqRTwomfkGgGw
	GpGj1OsH7h4D5MgQjuIZw==
X-Received: by 2002:a05:600c:46cf:b0:495:699:84ca with SMTP id 5b1f17b1804b1-496c657391emr64189195e9.28.1785315462175;
        Wed, 29 Jul 2026 01:57:42 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b1c2asm138614115e9.5.2026.07.29.01.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:57:41 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Maxime Bizon <mbizon@freebox.fr>
Subject: [PATCH ath-current] wifi: ath11k: fix locking problem in ath11k_dp_rx_tid_del_func()
Date: Wed, 29 Jul 2026 10:57:41 +0200
Message-ID: <20260729085741.3485711-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_015744_398074_37E4F14D 
X-CRM114-Status: GOOD (  15.30  )
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

From: Maxime Bizon <mbizon@freebox.fr>

In this function, we iterate over dp->reo_cmd_cache_flush_list using
list_for_each_entry_safe(), and for each expired entries we call
ath11k_dp_reo_cache_flush() then free the entry. As this can be called
from multiple CPU we protect for concurrent access using dp->reo_cmd_lock.

The lock is dropped to call ath11k_dp_reo_cache_flush() and taken again
before keeping iterating over the loop. That is broken.

The list_for_each_entry_safe() protects over deleting the entry being 
iterated over but does not protect for concurrent access. So another
thread might have taken the lock in between and modified the list, leading
to a crash (see bellow). 

So fix it by restarting iterating over the list from the start once the
lock is retaken.

	BUG: Unable to handle kernel paging request at virtual address 00000010ddbeef8c
	Mem abort info:
	ESR = 0x0000000096000045
	EC = 0x25: DABT (current EL), IL = 32 bits
	SET = 0, FnV = 0
	EA = 0, S1PTW = 0
	FSC = 0x05: level 1 translation fault
	Data abort info:
	ISV = 0, ISS = 0x00000045
	CM = 0, WnR = 1
	user pgtable: 4k pages, 39-bit VAs, pgdp=000000000593f000
	[00000010ddbeef8c] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
	Internal error: Oops: 0000000096000045 [#1] SMP
	Modules linked in: ath11k_pci XXX
	CPU: 1 PID: 1775 Comm: napi/-29 Not tainted XXXX
	Hardware name: XXXX
	pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	pc : ath11k_dp_rx_tid_del_func+0x164/0x3c8
	lr : ath11k_dp_rx_tid_del_func+0x2a0/0x3c8
	sp : ffffff8020c2fb90
	x29: ffffff8020c2fb90 x28: ffffff80207ae910 x27: 0000000000000080
	x26: ffffffc00861ebe4 x25: ffffffc008cefb88 x24: ffffff800d701b2c
	x23: 00000010ddbeef84 x22: ffffff800d701448 x21: ffffff8030e22d00
	x20: ffffff800d700000 x19: 0000000000000080 x18: 0000000000000000
	x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
	x14: 0000000000000026 x13: ffffff801958a100 x12: 0000000000000000
	x11: 0000000000000001 x10: 0000000000000001 x9 : fffffffe0081eba0
	x8 : ffffff801cc49300 x7 : ffffffc008f87130 x6 : ffffff80207ae900
	x5 : 0000000000210d00 x4 : 0000000000000000 x3 : 0000000000000000
	x2 : 000000010024519a x1 : 00000010ddbeef84 x0 : ffffff800d701b08
	Call trace:
	ath11k_dp_rx_tid_del_func+0x164/0x3c8
	ath11k_dp_process_reo_status+0x1d4/0x2fc
	ath11k_dp_service_srng+0x334/0x338
	ath11k_pcic_ext_grp_napi_poll+0x30/0xc0
	__napi_poll+0x34/0x184
	napi_threaded_poll+0xb4/0x1d8
	kthread+0xdc/0xe0
	ret_from_fork+0x10/0x20
	Code: b946e2c0 7101001f 54fffe29 a94002a1 (f9000420)

Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 8e2abc7b8383..b8f939f7c04b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -784,6 +784,7 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
 	dp->reo_cmd_cache_flush_count++;
 
 	/* Flush and invalidate aged REO desc from HW cache */
+retry:
 	list_for_each_entry_safe(elem, tmp, &dp->reo_cmd_cache_flush_list,
 				 list) {
 		if (dp->reo_cmd_cache_flush_count > DP_REO_DESC_FREE_THRESHOLD ||
@@ -796,6 +797,7 @@ static void ath11k_dp_rx_tid_del_func(struct ath11k_dp *dp, void *ctx,
 			ath11k_dp_reo_cache_flush(ab, &elem->data);
 			kfree(elem);
 			spin_lock_bh(&dp->reo_cmd_lock);
+			goto retry;
 		}
 	}
 	spin_unlock_bh(&dp->reo_cmd_lock);
-- 
2.55.0


