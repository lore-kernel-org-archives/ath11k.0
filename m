Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040A8606AE97
	for <ath11k@archiver.kernel.org>; Fri, 13 Nov 2026 12:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=40qMNSTq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fernandotapia.eu header.i=@fernandotapia.eu header.a=rsa-sha256 header.s=mail header.b=dKlnCSne
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EmvKM7P0z4AgDWd2TYZO47QnXmVaXNutw5jqNJgTHfw=; b=40qMNSTqdbs9yOo5nB7rZnnJbP
	5GexPfvCZ5/DgwYZoYYLfFkV8xSuqp52piudR5uJDl6zMrTn7R/WP/awrxFcBxsT6OEHtNl/xsGih
	HNGkJ0DKOqTfePEuw8M1/+N/8W70AhUXMOZa6jWrB5hHUEUdCk2DSY9LXrlcmx4oQCo2z+Bv9AHcE
	OatHIji8PQ5VMbIHW0iyWtJmfgr2FK2vwtPOC8tdAZcMiiQlmXD4l+JoZrfcRo1h+BIKw/keIFjT7
	Piak3aKB/flSniwECkW43ueAyCp2a24Uy5qsDPhVT3YJWc9crXwyTb1qOCTDv7V9QzJMlHxIMvMfp
	Cteyjwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq0D-0000000CdfQ-1p3b;
	Fri, 13 Nov 2026 12:03:36 +0000
Received: from mail.fernandotapia.eu ([173.249.8.110])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq0A-0000000Cddc-3E0Q
	for ath11k@lists.infradead.org;
	Fri, 13 Nov 2026 12:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fernandotapia.eu; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EmvKM7P0z4AgDWd2TYZO47QnXmVaXNutw5jqNJgTHfw=; b=dKlnCSnet/UN2TzGAWJycMjBs7
	6VX/bIv8prmmd9LktkdXGUCm6McgrzxAjhvj7mQNgDynNgqWSKfPFj5XSCbrgnphXpDoKV3sLoZLD
	VSC+u73GFEtQvuBTNmZx5xw7OJ4SD9N8RL68JKMvgAnbx1W2bDcQsFEfKBxmJB0oiZE1NeQFKumUr
	HRLY2/I//C+VzJPUlsRyNIcLwH+A4N11KvNvdqcKAalwaikGiXuhEwHz9o1EA0l7+wHCVmKPo/rd7
	nblInY6gtA/+REIpMi2q1cwhzc2ODW2Z9b+FKP3VxCTHfgW+NiyQe929X4CiVrSi6Qh2FEInU1hiJ
	wt1YGfyw==;
Received: from [86.127.250.161] (helo=workbench.lan)
	by espabilao.fernandotapia.eu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.97)
	(envelope-from <fernan.tapia@fernandotapia.eu>)
	id 1xRq06-0000000FD9g-1fk6;
	Fri, 13 Nov 2026 13:03:26 +0100
From: Fernando Tapia <fernan.tapia@fernandotapia.eu>
To: ath11k@lists.infradead.org
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath11k: don't create a duplicate peer on the same pdev
Date: Fri, 13 Nov 2026 13:03:25 +0100
Message-ID: <20261113120325.2913-1-fernan.tapia@fernandotapia.eu>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_040330_832135_C7432133 
X-CRM114-Status: GOOD (  16.69  )
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_peer_create() accepts an address that is already a peer on
another vdev, assuming the station is moving to another band. That holds
when the old vdev is on another pdev. When both vdevs are on the same
pdev, for example two AP interfaces on one 2.4 GHz radio, a station that
moves between the two BSSes is authenticated on the new one while hostapd
still has it on the old one. The WMI_PEER_CREATE for the second vdev then
makes the IPQ8074 firmware (WLAN.HK.2.9.0.1-02146) assert:

  wal_peer_control.c:2904 Assertion is_graceful_to_handle failed

followed by "failed to find peer ... after creation" on the host, and on
AHB the whole SoC reboots. Tuya devices in pairing mode, which try both
BSSes of a radio within a second, cause a reboot loop.

Refuse the peer with -EBUSY while the address is still a peer on another
vdev of the same pdev, without sending the command to the firmware. The
station add fails as it already does after the assert, hostapd rejects
that authentication, and the client succeeds on a retry once its old
station is removed.

Tested on a Xiaomi AX3600 (OpenWrt 25.12.5, kernel 6.12.94 with ath11k
backported from 6.18.26) for 8 days. A smart plug moved between the two
SSIDs of the 2.4 GHz radio in both directions, the sequence that had
rebooted the router 8 times before: the new warning appears, the client
connects on the retry about 4 s later, no firmware assert, no reboot.

Link: https://github.com/openwrt/openwrt/issues/24864
Tested-on: IPQ8074 hw2.0 WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Fernando Tapia <fernan.tapia@fernandotapia.eu>
---
 drivers/net/wireless/ath/ath11k/peer.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index b30a90698..95379930d 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -367,11 +367,25 @@ static int ath11k_wait_for_peer_created(struct ath11k *ar, int vdev_id, const u8
 	return ath11k_wait_for_peer_common(ar->ab, vdev_id, addr, true);
 }
 
+static bool ath11k_peer_vdev_on_pdev(struct ath11k *ar, u32 vdev_id)
+{
+	struct ath11k_vif *arvif;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list)
+		if (arvif->vdev_id == vdev_id)
+			return true;
+
+	return false;
+}
+
 int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		       struct ieee80211_sta *sta, struct peer_create_params *param)
 {
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
+	int old_vdev_id;
 	int ret, fbret;
 
 	lockdep_assert_held(&ar->conf_mutex);
@@ -392,6 +406,23 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 			return -EINVAL;
 		}
 
+		/* The firmware asserts (wal_peer_control.c
+		 * "is_graceful_to_handle") when a peer is created for an
+		 * address that is still a peer on another vdev of the same
+		 * pdev. This happens when a station moves between two BSSes
+		 * of one radio before its old station is removed. Refuse the
+		 * new peer until the old one is gone.
+		 */
+		if (ath11k_peer_vdev_on_pdev(ar, peer->vdev_id)) {
+			old_vdev_id = peer->vdev_id;
+			spin_unlock_bh(&ar->ab->base_lock);
+			mutex_unlock(&ar->ab->tbl_mtx_lock);
+			ath11k_warn(ar->ab,
+				    "peer %pM still exists on vdev %d, not creating it on vdev %u\n",
+				    param->peer_addr, old_vdev_id, param->vdev_id);
+			return -EBUSY;
+		}
+
 		/* Assume sta is transitioning to another band.
 		 * Remove here the peer from rhash.
 		 */
-- 
2.43.0


