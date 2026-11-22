Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605BB606A32C
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AeufKRBU;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=te4wNknE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qq2MgBtpxBhGAqVyV9y/5kMggKKzXoZ+lPhN7qc61d4=; b=AeufKRBUwbEwii
	l6QjlS5V/0kkpoATcPTWeA//ljl+WIBLobTM/GeextBs8aNgCmu0E6i+ufNhCKwha/QFIgLU6tRQs
	s/j17X/ZHFWvj/mVeIilq+Le8IYPexIE6rFjMy90/G5bj3fjSy6WAniBs357rX21cngf+c9bYbopc
	ppFRxtx4wUYLs7UlNIMA5GceYof9TkolXAm9DcJ8i3vJVuxn37rCf2Pn+1rOwrbKSmeoujBWTWLOX
	y5hwjtzphrqFwrCtUkBaWANrk7SEF8M1yHwu0KD03gtyZ3B8rwxlRak+VAA0HLwhi6ed5S0MNhzo1
	n5yIVw6k/m/rb0uxSL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Aw-00000001EdG-0JoB;
	Sun, 22 Nov 2026 15:08:18 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9At-00000001Eaq-1pkk
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 15:08:16 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so2737702a12.3
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 07:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795360094; x=1795964894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qq2MgBtpxBhGAqVyV9y/5kMggKKzXoZ+lPhN7qc61d4=;
        b=te4wNknEaLkdrtyNKR6dxmCU1I7+z2jGFF3afGyB0n9x1RIWv2UjmWBOqKpWjE1Wl2
         oh8oW0Z4JVEBWqTFvNr275k3QHXx3Szi+Yhc+jwV5X96NngrLAhwBV2j7diLklz3IXRl
         p86jsvYIqodUK+3G1uJlj1xWnPdK1uhfiRpsyAEupE61nonyLU2D9WmP5X4ZiYZeFbVo
         A8tbu9wyPNYuWLHpu5IYPifAhScPmzUv2tJHaT+YQtQLT8SvuoOnyt/MUdMSxT+tI7US
         LASz/syizyfOgsdirvclP27JH6NSwky/t7ymccGD5H2LEzS7gdNsE07WZPhfzceaPDXs
         9Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360094; x=1795964894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qq2MgBtpxBhGAqVyV9y/5kMggKKzXoZ+lPhN7qc61d4=;
        b=HAlGcJtE6W9NSlQ7qHXMA70keFEqQc+N0EL/Ah+KRWjv7qzYz0tCsdcVfIjtLkL7nx
         28T1y22Cn77tVIpJ3zQuK0gs+wieiEQZTVg2uslUka66KqnHZ1Tts2D8cpiCUAid9uAR
         M/79vnrrlLo9hYmGVxKWVzQMWCRu63z6Vzy3SYRCB9dVKqjW2HKqDQ7Fp4IcLe5q0xb7
         FO9zc5Zooqd1zyL717k/XBZYWddr91WyFAoP/Nie6vG0J9IRBN7K76XGZB6hM/BCCZaM
         6VQYyYTId41+f0borJRCfjBemwT7qFf1T0IrDNtdAq3X50arMMLUJXR5Y5LWVt7K87Zc
         tacQ==
X-Gm-Message-State: APuU4Z8Xle4qr2WIKwtGd2/MvODhuM1bJBh5f2L7jvsx0vNY2xMX7bUm
	BQcPCmA+aVPsmMxgnbGouPI+kDpkKJgfVVNCHYzpEIzzs1bwnUgqtprTSxGsS2qBbA==
X-Gm-Gg: AZFdTZde8KSFbktwiOJqIcKIl44y8cyk1r2KN8sK/UtHv+SORe8dv0QS6Q8BrwopwI5
	CyO6+l5KUtiHNYLzHyuhMzgARbdYLpPbQskWCLcYbU3aHhhsO3upOEV2gG7GOM23IbDCkvUzebG
	Zy3nYr/SDRc3wsNZgsfa/IchSHt7k7lf6wnBqhSv732wwtmEtPE/RAKVMC5bFsiniX4B3Dfe1Ti
	78JjWBCt47+hUHsJtdK0OAYbgFJpLDSUKOiC1DpKr1BQA3wttAUwn60F72B+yt9rFiJVmFbHKNL
	elKVTfVNwEs/BG9QEiCRjrXVBUEDX58tyhUAMjQR2Q5vrmRZIMP8b+MnH69vnZlz+2wXarlB3gi
	0JVseIFg9k4pxR5ENqE2PY+UUiVZzBq3sQzahSr/YM1fjAPgZ4sPNdqQE3DV5Qq5gw7dEXFUang
	c3Z8LAtAtt4myV7qGCVj1ISnzXAfKR2U9WwU5Z6b1uPe5F3XLC/HX76Nk8/9xB81XgAFdOgfVp0
	f4HZvckqe2z+OBfi1OMll/0Xhmlj5M5d9DYK/lgb5MeK4ouAFqAi/9BwjOGpHf/f67pnH+XUT/M
	Lm7EaVAasluVVByGisOYfZJZZPdUtl/6OCi/8o6wCwVBrW2cz8adhwLQm3rgBA6z31iZTbIlBOG
	BrSwIKzsr4nuiaLtSBmNZYjW0krmoT08H1l/CIaoCkQW3KDwOxI6GGRKry0spY1jncfvy/RSRiA
	JQ3Y/UQgiO96pwteMcojsIawEv4Wyxwzw7g8IlYhFZ7wlSBOi5yJL/ynNZ2bs7Uaj26gKE+x0gw
	uylsSMnJ0aT+d1OUs72Tw3Z0fFfMvitqDDeWICkAtpG3qAmyP4UNT4bSLpahJT7AXOLFcBTEogw
	tUUzibX7B0vn
X-Received: by 2002:a17:907:ea5:b0:c3f:8c92:3b5a with SMTP id a640c23a62f3a-c513a88aa78mr749156266b.12.1795360093814;
        Sun, 22 Nov 2026 07:08:13 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.181.130.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm324618466b.20.2026.11.22.07.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:08:12 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	John Crispin <john@phrozen.org>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v3 2/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sun, 22 Nov 2026 16:08:11 +0100
Message-ID: <20261122150811.3135445-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122150811.3135445-1-julius@bairaktaris.de>
References: <20261122150811.3135445-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_070815_495123_4E9B1882 
X-CRM114-Status: GOOD (  13.81  )
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

mac80211 requires sta_state to succeed for down transitions and warns
when the driver returns an error for one. ath11k returns the result of
WMI commands for ASSOC -> AUTH and NONE -> NOTEXIST, and these fail
with -ESHUTDOWN while the firmware is down. A station removed during a
firmware crash then triggers, for the disassociation:

  Driver is not allowed to fail if the sta_state is transitioning down the list: -108
  WARNING: CPU: 1 PID: 5952 at net/mac80211/sta_info.c:1561 ieee80211_sta_eosp+0x119c/0x1668 [mac80211]

and for the removal:

  WARNING: CPU: 2 PID: 2080 at net/mac80211/sta_info.c:1652 sta_set_sinfo+0x1118/0x1144 [mac80211]
  Call trace:
   sta_set_sinfo+0x1118/0x1144 [mac80211] (P)
   sta_info_destroy_addr_bss+0x34/0x48 [mac80211]
   ieee80211_del_station+0x1c/0x54 [mac80211]
   nl80211_del_station+0xf4/0x174 [cfg80211]

Two of these failures also skip host cleanup. On a non-AP vdev of a
device with vdev_start_delay, a failed early vdev stop returns from
ath11k_mac_station_remove() before the DP peer cleanup and the station
accounting, and ath11k_mac_op_sta_state() then frees the peer with its
rx_tid state still in place. For a non-WME station, a failed RTS/CTS
update returns from ath11k_station_disassoc() before the peer keys are
cleared.

Warn and carry on with the host cleanup in both, and return success for
every down transition.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v3: none.

Changes in v2: continue the host cleanup after a failed early vdev stop and a
failed RTS/CTS update instead of returning from them.

 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 48795c72d2982..b87b15492a8fd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4987,9 +4987,7 @@ static int ath11k_station_disassoc(struct ath11k *ar,
 
 	if (!sta->wme) {
 		arvif->num_legacy_stations--;
-		ret = ath11k_recalc_rtscts_prot(arvif);
-		if (ret)
-			return ret;
+		ath11k_recalc_rtscts_prot(arvif);
 	}
 
 	ret = ath11k_clear_peer_keys(arvif, sta->addr);
@@ -9925,10 +9923,8 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 	    arvif->is_started &&
 	    arvif->vdev_type != WMI_VDEV_TYPE_AP) {
 		ret = ath11k_mac_stop_vdev_early(ar->hw, vif);
-		if (ret) {
+		if (ret)
 			ath11k_warn(ab, "failed to do early vdev stop: %d\n", ret);
-			return ret;
-		}
 	}
 
 	ath11k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
@@ -10082,6 +10078,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr);
 	}
 
+	/* mac80211 does not let a down transition fail */
+	if (new_state < old_state)
+		ret = 0;
+
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
2.53.0


