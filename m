Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E9CC43334
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 16:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BGn73mZDX6LpwFUXUGa3f/NzfYgkG8ZPnUE1WD9FNRI=; b=iRCVNt/wnnphb/
	BvD7Iqa8nn0udb4hvzBsPqO0tMvFAG8+exCwM+venL8ENxaYwe8Wi/M7qJCrlwcyjgfp/AxieugBM
	G1hFupv4WFQPRvBsY9eKJNk2KTiIw2CdbXgoNLCVhqPdYalIYXpHRa7evV5H3xkHtUKfKcYMiepXr
	xiUrelaypsrIJsYDh9n+tSRYKJH8YkTypvrf/rgf6vY98HmallUHxd68sAYfybjOvJXA+709S6kb0
	zbFeJrhvP8jaAvn257VJYek23/mNxPZledM7jOsymlmFNkIwMF59l8DbsaAX5LvQKskVxE1/J4BBV
	C9cU07k5zONPeF2N3+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxARO-008D0U-FG; Fri, 03 Jun 2022 16:46:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxARL-008CzS-Dx
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 16:46:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id v25so10908279eda.6
        for <ath11k@lists.infradead.org>; Fri, 03 Jun 2022 09:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Woceb0Rke0kHZAKQOxFNrONpwZyqKA30q2Uef9j1sWg=;
        b=O+nr7Y4GlgXVxyiPhIS/JwPUvloVGcydyPndUaBGvyEf2pxef/YWw5Qqe6eac/4XzD
         voUH4cvEFs8nGlotS6fFiDzMX+owWrmB6mgMEf8rr/JF6tEI3ZSO2Uuj5U8456CcjlQf
         TYB0HwcKWQtGKWIa9ZOj28tDeWjuKEyFgs1jcaiIM9ZGaXLsQ/uXiVEq/0xl725fnCFj
         XRb7p/OD3ZgjurbGyrbq7DvqmJWo08nfqupNBp8WGebWXEi8sg9fvBsDLxVpOOu2M4cS
         QuFbo6lm+xP35t2tq4H6MEQUqLwYIn3x1YRRyw90Is6nTn4Z/Xx6O7bwNEtDnhqMl2Vs
         lQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Woceb0Rke0kHZAKQOxFNrONpwZyqKA30q2Uef9j1sWg=;
        b=AHQaD+TtBW6tiPKsEKbVmpojCg05JbJmrj9H47STWAMEgzAbOQPa6yoQJ/6SIlI3fk
         UgHXjpODhcBpiEDzRBBG+rh0i3HL0rLfPlCTZcpQ2Oa81T9FS+MtN8ugZjpJukOxYpeZ
         aaMCbIsysKhaLFjtrVzn36Zh/UxNLYdzk9M4Zpk6AqxlBF2h6FcnWEtk1WNlLsgjSvUu
         ZCD7t5W7/A6HYHZVJA7aSIPu/+tojSl+r/4qE8AZDuDJTsa0+sgd9lvJalHCNfMmzwQf
         YsoL0HJyKJw5n2MtCR7YfMQDH6XfMcU0SJKL2GFGANJ8aw6sRXgpbMNuKuLhj6JnMnH4
         txIw==
X-Gm-Message-State: AOAM5324DyW4J/Xqw1iXvV+7Ia67nFoLWaH4QCvD8zM28y/Sn0dyR8Mm
	FX6XZBEsul9JYIou2hJs2ZjE41EpFkI=
X-Google-Smtp-Source: ABdhPJwox2o3lpWBvFvHM5Z3hm3Ssg58lh8U+R8DMB58iiRmtt5SYLeE+KthNUIacPOMey6H2eiBrA==
X-Received: by 2002:a05:6402:20c:b0:42b:d302:a80f with SMTP id t12-20020a056402020c00b0042bd302a80fmr11687092edv.330.1654274780902;
        Fri, 03 Jun 2022 09:46:20 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id f22-20020a1709067f9600b006f3ef214db6sm3010819ejr.28.2022.06.03.09.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 09:46:20 -0700 (PDT)
From: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
Subject: [RFC PATCH] ath11k: fix peer addition/deletion error on sta band migration
Date: Fri,  3 Jun 2022 18:45:59 +0200
Message-Id: <20220603164559.27769-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_094623_514880_01A4C08A 
X-CRM114-Status: GOOD (  33.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This patch try to fix the following error.

Wed Jun  1 22:19:30 2022 kern.warn kernel: [  119.561227] ath11k c000000.wifi: peer already added vdev id 0 req, vdev id 1 present
Wed Jun  1 22:19:30 2022 kern.warn kernel: [  119.561282] ath11k c000000.wifi: Failed to add peer: 28:c2:1f:xx:xx:xx for VDEV: 0
Wed Jun  1 22:19:30 2022 kern.warn kernel: [  119.568053] ath11k c000000.wifi: Failed to add station: 28:c2:1f:xx:xx:xx for VDEV: 0
Wed Jun  1 22:19:31 2022 daemon.notice hostapd: wlan2: STA 28:c2:1f:xx:xx:xx IEEE 802.11: Could not add STA to kernel driver
Wed Jun  1 22:19:31 2022 daemon.notice hostapd: wlan2: STA 28:c2:1f:xx:xx:xx IEEE 802.11: did not acknowledge authentication response
Wed Jun  1 22:19:31 2022 daemon.notice hostapd: wlan1: AP-STA-DISCONNECTED 28:c2:1f:xx:xx:xx
Wed Jun  1 22:19:31 2022 daemon.info hostapd: wlan1: STA 28:c2:1f:xx:xx:xx IEEE 802.11: disassociated due to inactivity
Wed Jun  1 22:19:32 2022 daemon.info hostapd: wlan1: STA 28:c2:1f:xx:xx:xx IEEE 802.11: deauthenticated due to inactivity (timer DEAUTH/REMOVE)

To repro this:
- Have 2 Wifi with the same bssid and pass on different band (2.4 and
5GHz)
- Enable 802.11r Fast Transaction with same mobility domain
- FT Protocol: FT over the Air
From a openwrt system issue the command (with the correct mac)
ubus call hostapd.wlan1 wnm_disassoc_imminent '{"addr":"28:C2:1F:xx:xx:xx"}'
Notice the log printing the errors.

The cause of this error has been investigated and we found that this is
related to the WiFi Fast Transaction feature. We observed that this is
triggered when the router tells the device to change band. In this case
the device first auth to the other band and then the disconnect path
from the prev band is triggered.
This is problematic with the current rhash implementation since the
addrs is used as key and the logic of "adding first, delete later"
conflicts with the rhash logic.
In fact peer addition will fail since the peer is already added and with
that fixed a peer deletion will cause unitended effect by removing the
peer just added.

Current solution to this is to add additional logic to the peer delete,
make sure we are deleting the correct peer taken from the rhash
table (and fallback to the peer list) and for the peer add logic delete
the peer entry for the rhash list before adding the new one (counting as
an error only when a peer with the same vlan_id is asked to be added).

With this change, a sta can correctly transition from 2.4GHz and 5GHZ
with no drop and no error are printed.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

Fixes: 7b0c70d92a43 ("ath11k: Add peer rhash table support")
Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
---

Some additional comments external to this patch.
I tried to find different way to fix this...
One of them would be mod the logic of the rhash and using as a key both
the vlan_id and the addr but this is problematic for the function
where ath11k_peer_find_by_addr is used as vlan_id is not always available.

I honestly think a correct solution would be have a rhash list per vdev_id
or per mac_id but again this is problematic for some function that just handles
data and have only the addr as a way to identify the peer.

So unless some change are done to the firmware to provide the vlan_id in the
msdu data this to me seems to be the only solution to correctly handle this case.

Another solution I tried was to add to the peer some additional info and put
the rhash addition in the peer delete logic by passing the "to-be-added peer" to
the peer to delete but I notice that it's unreliable since it can happent that
the new peer hasn't been mapped at the time the peer delete is called.

So this is really how to handle the rhash table in this corner case.
Considering how peer are handled in theory it should never happen to have
dangling peer that are not deleted.

Hoping this is not too much of an hack and we find a good solution for this
problem.

 drivers/net/wireless/ath/ath11k/peer.c | 30 ++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index 9e22aaf34b88..1ae7af02c364 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -302,6 +302,21 @@ static int __ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
 	spin_lock_bh(&ab->base_lock);
 
 	peer = ath11k_peer_find_by_addr(ab, addr);
+	/* Check if the found peer is what we want to remove.
+	 * While the sta is transitioning to another band we may
+	 * have 2 peer with the same addr assigned to different
+	 * vdev_id. Make sure we are deleting the correct peer.
+	 */
+	if (peer && peer->vdev_id == vdev_id)
+		ath11k_peer_rhash_delete(ab, peer);
+
+	/* Fallback to peer list search if the correct peer can't be found.
+	 * Skip the deletion of the peer from the rhash since it has already
+	 * been deleted in peer add.
+	 */
+	if (!peer)
+		peer = ath11k_peer_find(ab, vdev_id, addr);
+
 	if (!peer) {
 		spin_unlock_bh(&ab->base_lock);
 		mutex_unlock(&ab->tbl_mtx_lock);
@@ -312,8 +327,6 @@ static int __ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
 		return -EINVAL;
 	}
 
-	ath11k_peer_rhash_delete(ab, peer);
-
 	spin_unlock_bh(&ab->base_lock);
 	mutex_unlock(&ab->tbl_mtx_lock);
 
@@ -372,8 +385,17 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_lock_bh(&ar->ab->base_lock);
 	peer = ath11k_peer_find_by_addr(ar->ab, param->peer_addr);
 	if (peer) {
-		spin_unlock_bh(&ar->ab->base_lock);
-		return -EINVAL;
+		if (peer->vdev_id == param->vdev_id) {
+			spin_unlock_bh(&ar->ab->base_lock);
+			return -EINVAL;
+		}
+
+		/* Assume sta is transitioning to another band.
+		 * Remove here the peer from rhash.
+		 */
+		mutex_lock(&ar->ab->tbl_mtx_lock);
+		ath11k_peer_rhash_delete(ar->ab, peer);
+		mutex_unlock(&ar->ab->tbl_mtx_lock);
 	}
 	spin_unlock_bh(&ar->ab->base_lock);
 
-- 
2.36.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
