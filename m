Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1918ECA6013
	for <ath11k@archiver.kernel.org>; Thu,  8 Oct 2026 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmc8osNOh8IgZplHnLzxqA7D71f13vW1JNQrlYkSov0=; b=b3bHzRLslhlUJYgdQUAN20kCIT
	L51oA75Her4KtgqYKGGL8Tu4i3DA8aDcVGLSSTExGCMz9eq/OgJxE8d3qHhs67D6cq4Ua1U4KH4Zz
	jI8LUDi22IdTTscfzHWWTQjuvl8xfVX/iqUHZ/FiwUathsg5i5CCVSwVs298ALk4ojm4RQMbvG2lF
	5BZXM6YAcaaiOKN3We0Vj1m7hp1srNF8GbI41n7tA0EuKS0p7c4V/dWUk445Ct2r5kwfYbx4nrUfL
	UMOhGPpQZxc8fn6bOqERaUh24x2UURa18XvBP608Y/UWLOGl1ztIqvChdKf4d0X8UVqR5JL/Gevfd
	KAjfUVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEx53-000000059Cr-1jOM;
	Thu, 08 Oct 2026 22:59:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEx51-000000059BS-2FEj
	for ath11k@bombadil.infradead.org;
	Thu, 08 Oct 2026 22:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fmc8osNOh8IgZplHnLzxqA7D71f13vW1JNQrlYkSov0=; b=RFTnmYJZzwYirv6rA3ae9F2ZDi
	5762XlSJXKdmHMBCSkpmaHM98WpWCssS8kXEjXPWcQ5R4UaDsOZY/dgRj6t1GJBwDU9zZ+Y1g8KUP
	j9yuqBqIsVD3bdc2rdSYpPAy+V37lyjOD1eKgNaQxziXNjRkQD7Ff9am9zewznAZ3DnH5+twTXStZ
	mXanQ7+mE6y417K4DY7Oi+iTXulxnaO4AHjL70khwQxKVw8X0sMlvKgyyDlxduWM2e3zuxYNZRiVu
	BC4o6JbYL0OvcrKPJRBRSq7zs9oNXWunrn3mChHkhiPNeOQQLWAVgO9Z0joYfsHl7Q0W0PII2C0X2
	KiwuqKag==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xEx4x-0000000AilX-3gwA
	for ath11k@lists.infradead.org;
	Thu, 08 Oct 2026 22:59:14 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c2e7496f947so557247166b.1
        for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 15:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791500350; x=1792105150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmc8osNOh8IgZplHnLzxqA7D71f13vW1JNQrlYkSov0=;
        b=A/fIxeppKLqbjwMLRa5BLmZI+M0Zq1VKEN/+eR2lONmvrlKXRFXMzN8LI6MqIXVeyF
         Vm/dx00GqdGT/GkNfMxDH617iMO34DeR73viKBoETU4riBjIk12M81c67P6a1X1MY/5p
         bXAljSCZH3UCnDoGnIVE6Lq3xjxw4xYpMDIm6m9L+ocQ/wwfaAfmnFewCUDY7JJyFPwY
         OgPtCDkLVSzCU/OXs6tX/mJpHwrsJm/kC/1UIBLIiVmMa7hAf4XkUJoHIRumG52X9nKq
         iIJUcMWtAP0garp4Rw9sd98zFPbT87gW4ew+MUOxMnLRqTKh2F7qxERhnbRifXomId9h
         Ur9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500350; x=1792105150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmc8osNOh8IgZplHnLzxqA7D71f13vW1JNQrlYkSov0=;
        b=iziXQSurevHndXtmz+DaA5D+8KlbgA434KclpvwYkbXIcBKo+IWE2iOQrx3EfUnVc9
         qjUGPLKYK6TD2QiRjDPW12lu5SiGWNqOuvun++cBNADbk4t8fdKYFGN4EEeG5NVtYnuo
         BTBHIUqgRy1wfWkt8suKUUkjHSNT1+bUYc/5/Y7wuKuRFz+nFdHFM9iu3h9NAK8g4sBi
         +S5fJ+0UWVlbS/Ywo3iq2P2QUAsuPsYoqdkI963b7vauO2Ydu6tkeemPpaymFSZkITbX
         HohWywfnrTJIzRMKSqUcS1QrASjoFpkUMSojRuGyOSgGHTXutUrelP5ta35kK2gkxbFw
         tPpA==
X-Gm-Message-State: AFuF++n4mrGwrHEsfKIJeeKr3cCyYsQ9Atx69DBF1ATowVsXMGr1gPTL
	UhBJ+xh68wSSJLmP2jGyzjCZmt5fadlc3X4/WWMlDLV+GBvtMbPSIcgm
X-Gm-Gg: AYBFou283uASYlrWRqPL+K/rXMgPkdJaw4H2zoesoDluWpPpyVbyOk0hXY6espDvQzr
	L/fD1ubozlQYNYFWMn6RJgmi9CXcT8ZfM0r2V8kf2qyiGQ8GdwtcTR81dqD6k1vjeWfceX+fy0E
	GbWLvBDf4Xs5sZO1wpVV/26FFGcTd54+vQkd77xDD+shWWruBNsjxHL2KPmLljdfW96H196iL/o
	3gdhNNIlyiHW7Lbs6lH0i2UkEiSE9uIETcYfwf+NGT1hqTFQzqKTWc71iu3Rkk3K84rm6mm8glH
	BzsG/HrZP7yT+hNU9+U7PZHHWolMX4d3OhfpucCghF49xEjvWkcrBo9T1ETSA+T8gkQrgIC/Nrk
	wSkY+QctcIybsae7lBBaefyQu3Gwgh/Y/z1minzzYBmEfkQRc0r5+v7IUaAZRYUVbB0E5GEt/cX
	jhPIsusOFLFBc70bhgEFgZw8sMirlTCUFPAzr1ZooW3W3EdrlICzytqNW2jdUTUiKWI6X4zP5z9
	mm/ig==
X-Received: by 2002:a17:907:9709:b0:c2e:1b4d:e9f4 with SMTP id a640c23a62f3a-c31a9f68e76mr15707666b.31.1791500349693;
        Thu, 08 Oct 2026 15:59:09 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm6993566b.80.2026.10.08.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:59:08 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	johannes@sipsolutions.net,
	Nikolay Bryskin <nbryskin@gmail.com>
Subject: [PATCH 2/2] wifi: ath11k: apply the initial regdomain before registering the wiphy
Date: Fri,  9 Oct 2026 01:58:53 +0300
Message-ID: <20261008225853.15399-3-nbryskin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008225853.15399-1-nbryskin@gmail.com>
References: <20261008225853.15399-1-nbryskin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_235912_202607_BC31EA69 
X-CRM114-Status: GOOD (  15.57  )
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

ath11k marks its wiphy REGULATORY_WIPHY_SELF_MANAGED in
ath11k_reg_init(), but applies the regdomain received from the firmware
only after ieee80211_register_hw(), and asynchronously:
regulatory_set_wiphy_regd() just stores the request and schedules
reg_work. Userspace is told about the new wiphy from wiphy_register(), so
it can query the regdomain before there is one. iwd does exactly that as
soon as the wiphy appears, which triggers the WARN_ON() in
nl80211_get_reg_do():

  !regdom && self_managed
  WARNING: net/wireless/nl80211.c:10576 at nl80211_get_reg_do+0x229/0x270 [cfg80211], CPU#4: iwd/716
  Call Trace:
   genl_family_rcv_msg_doit+0x144/0x1a0
   genl_rcv_msg+0x1cc/0x300
   netlink_rcv_skb+0xcd/0x150
   genl_rcv+0x28/0x40
   netlink_unicast+0x2fb/0x4a0
   netlink_sendmsg+0x219/0x480
   __sys_sendto+0x226/0x230
   ...

The regdomain is already known at that point (ab->default_regd[], or
ab->new_regd[] if an update arrived meanwhile), so apply it before
ieee80211_register_hw(). wiphy_register() then installs the pending
regdomain itself, via wiphy_regulatory_register() ->
reg_process_self_managed_hints(). That happens under the same RTNL hold
as the NL80211_CMD_NEW_WIPHY notification, and nl80211_get_reg_do() takes
the RTNL as well, so userspace can no longer see the wiphy without its
regdomain.

The window matters beyond the warning. With an msleep(2000) inserted
after ieee80211_register_hw() for testing, iwd associated before the
regdomain was applied; the late regdomain then went through
ath11k_reg_notifier() ("driver initiated regd update") and the channel
list update to the firmware while associated, and from then on TX was
badly degraded while RX stayed fine (QCA6390, 5 GHz DFS channel, signal
-33 dBm, no beacon loss):

  tx packets: 2012, tx failed: 1678, tx retries: 0
  tx bitrate: 48.0 MBit/s
  rx bitrate: 648.5 MBit/s 80MHz HE-MCS 6 HE-NSS 2

ping showed 39% loss. Without the delay, the WARN_ON() shows up at boot
only occasionally. With this patch and the same delay neither the
warning nor the TX degradation occurred.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Link: https://lore.kernel.org/all/16aa99921c4e92e8d4da3c84aacbec2e673666aa.camel@sipsolutions.net/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Nikolay Bryskin <nbryskin@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3dfd24d7b5a6..4ebdde872213 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10648,6 +10648,16 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	    ab->hw_params.bios_sar_capa)
 		ar->hw->wiphy->sar_capa = ab->hw_params.bios_sar_capa;
 
+	/* Apply the regd received during initialization. Do it before
+	 * registering so that cfg80211 installs it while registering the
+	 * wiphy, before userspace can query a self-managed wiphy without one.
+	 */
+	ret = ath11k_regd_update(ar);
+	if (ret) {
+		ath11k_err(ar->ab, "ath11k regd update failed: %d\n", ret);
+		goto err_free_if_combs;
+	}
+
 	ret = ieee80211_register_hw(ar->hw);
 	if (ret) {
 		ath11k_err(ar->ab, "ieee80211 registration failed: %d\n", ret);
@@ -10662,13 +10672,6 @@ static int __ath11k_mac_register(struct ath11k *ar)
 		 */
 		ar->hw->wiphy->interface_modes &= ~BIT(NL80211_IFTYPE_MONITOR);
 
-	/* Apply the regd received during initialization */
-	ret = ath11k_regd_update(ar);
-	if (ret) {
-		ath11k_err(ar->ab, "ath11k regd update failed: %d\n", ret);
-		goto err_unregister_hw;
-	}
-
 	if (ab->hw_params.current_cc_support && ab->new_alpha2[0]) {
 		memcpy(&ar->alpha2, ab->new_alpha2, 2);
 		ret = ath11k_reg_set_cc(ar);
-- 
2.56.0


