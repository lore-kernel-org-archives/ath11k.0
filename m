Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858ED606A8B7
	for <ath11k@archiver.kernel.org>; Sat, 14 Nov 2026 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MMPi/o4V;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gQdNMGZP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=txq5guNEURnzloFUxneFtdgs7wfJ4RtNVYK1I5nSsoQ=; b=MMPi/o4VDiCzca
	v03CPGucu1x+qLffE3u4gOCDtsTUc0QlNuoQU3EXf9O+qUJPBodmtDPqeM+5O3UMiKN9WFicGG8xF
	c5ukG33DutidfsaetdrBnllsejxBLSoUaOTh9XKN/sRxsMpM1QzK6G2fGi6WmwD6O0urysW6wO8Mk
	EBZfjrFCVUdRoEXaa9SFrJ01VYKBX82Tk4PGEU3VgMXT8jUVmvhqY/YIADBI4M+pt1T2QTVRGpkIq
	i52t1/kMEJTVsQMUsSZmQ9ZVsCyNLDRIa6hQBx4pwQWGdZCHYUGM5/zsFJtXftGo8nmTs+JxhARTM
	PGfkuPYJJRPJWB5JaO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSMg2-0000000Grcq-0lSF;
	Sat, 14 Nov 2026 22:56:54 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSMfz-0000000GraA-2XCH
	for ath11k@lists.infradead.org;
	Sat, 14 Nov 2026 22:56:52 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so424462166b.3
        for <ath11k@lists.infradead.org>; Sat, 14 Nov 2026 14:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697010; x=1795301810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txq5guNEURnzloFUxneFtdgs7wfJ4RtNVYK1I5nSsoQ=;
        b=gQdNMGZPBBEW6Sj+rf0v0S1zGAcB8QqH956B9QDXxjYTB4q4AauUuq2BiT5SvL3APK
         wqAuivOwW8LbBHMzy/cpXpMV8gGPZ+FpfMPSIqUIsKvSrgB9eePLfdM5T+7D8Z67zCV+
         eG/9/V8bOOHGRW7Gy6Klz/AgSCwEYYOQmGsCCvfcs6znLrqkqM6KwY+7Q6RhVgYfFsQj
         zXpEJ73sxh2UhGMeFIKDlILhOu+og+gvOpC7A+VivdG3D7sXu0dKf+CVeOrvBF/ivqL7
         p7Sr409iSswV767YgugZN2vcdIgtHoYUh/aISn4QAGvFt/H7kCy2Uefzb2ZKOSCJw+Yt
         BhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697010; x=1795301810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=txq5guNEURnzloFUxneFtdgs7wfJ4RtNVYK1I5nSsoQ=;
        b=Uh8f7LJvZ/x2c3Ajo9gUfULeiNI6KXr+1+LAcNvPNA9FpP+kTqf7ZegDWiFxJYcqOM
         sJv+IRES4qORHCMi+rXG5ruJF2XGls46XVKuh/P3baOFjHPM+56q723pSJPP7FM0/iiK
         HW/R/xUK9r3mUfUyn0CrCU+Ab2Mkxa6ZjfzCYXgf/UTEiNBe4onWJSCCBop5fZ7cf018
         urOIPtVuEOdxyDMXPjCRGBGl8xbDXw8b4L7ovMxg0SDPieeUyJ9KxADWG2Bq2S31+HMV
         ebioZ2D2gKEAYlfmd090VHqXZsrxEDr2Hwp6tIX2gVk0oWTMByIVKLeZNlygjbllETTa
         g94A==
X-Gm-Message-State: APuU4Z9bCR62niFqsVzWi3VR1yiqT85fF8PBYNj3cenAVnAzAHNfqpMj
	qorlcKliex4Ke7LeyKcrLimVzdnbvfOA1BJCu7fcKu/UJtG2pU7cfQkGYTdgv8Fxpg==
X-Gm-Gg: AYBFou0sM+UEzG6CCkd9I97FhVPf+ugvmOqrXQytsImnD4SQqQQmSr5HKu0LbZaR4mf
	r6zeF77tdyI22JPpIQ5en26YBKVEaNPAu3QBBW2+xXuYv7DX07VpvyjFkMK+duCue1FXkS99Bax
	0poCXOG3uWZMsqVUcrTDpH7y0vNYjNUCRNTG74IeU4+u57HJsyae1YDVMMs0W7M7Fvp4stUpzKo
	StAPu2q8ZgjI0SNT4uct4lBtxwKBriLPgs3Xr4JraV4AzF3cDDUYIjT2zc03y9+9z9j+o+iqkHf
	Ks0mIkk/lX4C53rEZNJRxhBZuJMvsAq8fZEWGWGLe9s9+gQwWkkgjR7/Sx2f8DoVExd/zcGLror
	ME3/XVZyIgEizD0ak1ReAazKaBdUALO5VZhURW8Hs3vBwLJKfC8L14TMV0eyi7ir2kLJhhBl3YV
	KpMbZpZQZT5ZJfg2B479OZpCD+od0xaj+lqGynXNxZ4mgGNVRM4+REDY79RZg/2uhL2PXLoxWQR
	SR4voeDiX0Tws3gg7xGpfOxAkIUrOHqBrO8pKcxvCd7xueZ5lUgqH0sl47usOwZbXuuPjQYNsiZ
	/lu9mJ7ZX35v0TsfPidLj0XKh8mk2mBx/s7UUcym51J0+/3Z9Luo1E8jyoPSZgvuCNeEofv2kVv
	UayYuJWv4VRikqQQrezbCpbDcKX3hUaAvcqS11AgMv1HHy9NA1HwWwvwnzKAsxn2FU9FM2LbzJk
	9z2uXJ8s/fhMCe+azaNhnlV0srh7gnlgbQSC4FntnmfC9qibYHJpgjyEUF8QQpKbTbPxuBk/9e5
	4nNpXTrl3UbjpZn0O6+6n2/dLKHz6wgZU23jAErzMWIGiMsLGZF2PKhFHUWWdZDOUscGoOOpkH+
	PINfTCMoZx5iwCu4pXzvaNWK1Qa2g/tc6+Mihj2yDmC+Hr8sohLT3byjI8+4vbrM
X-Received: by 2002:a05:6402:194a:b0:6b6:f5b0:889a with SMTP id 4fb4d7f45d1cf-6b7c0ccf784mr6027031a12.35.1794697009564;
        Sat, 14 Nov 2026 14:56:49 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm2751595a12.17.2026.11.14.14.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:56:48 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	John Crispin <john@phrozen.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	kbuild test robot <lkp@intel.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sat, 14 Nov 2026 23:56:43 +0100
Message-ID: <20261114225643.962015-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114225643.962015-1-julius@bairaktaris.de>
References: <20261114225643.962015-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_145651_660833_88915904 
X-CRM114-Status: GOOD (  14.11  )
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
Changes in v2: continue the host cleanup after a failed early vdev stop and a
failed RTS/CTS update instead of returning from them.

 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9c3f577c9562..a86d1b6c0d73 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4984,9 +4984,7 @@ static int ath11k_station_disassoc(struct ath11k *ar,
 
 	if (!sta->wme) {
 		arvif->num_legacy_stations--;
-		ret = ath11k_recalc_rtscts_prot(arvif);
-		if (ret)
-			return ret;
+		ath11k_recalc_rtscts_prot(arvif);
 	}
 
 	ret = ath11k_clear_peer_keys(arvif, sta->addr);
@@ -9922,10 +9920,8 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
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
@@ -10079,6 +10075,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
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


