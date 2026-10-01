Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687F7CA5FD4
	for <ath11k@archiver.kernel.org>; Thu,  1 Oct 2026 16:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8ErsgCdjJpA/DlSdvk3QC3jh560CNo6DjQxt2VzypIM=; b=v/tAyAE+LQAa9PO+huiKWPJwcP
	vjNhpEd8LbfwtyqFqn1psz4ajAZanWeAdCbdfltwILi8BxbCIq61A4tvRVpQXQpwhsvcZjSMXQtX5
	o3fXk95RROewBI4z7VLVzhhMX/8l+uQJ5Fbq8+jqWuaDFNHV1F7ltTshgFcpw1yhAvAD2qb7sO2xu
	Y0hhANFa+N6EBGmWdiqVTmM2PjIzuOoXKdQuK5c77Gg8Thc9pyGDC00Nwx6BNMr3fg01i5GgELE3u
	oHe0RdUwHUDYZUcfw2gERRwRf3TDh3nwuTfg+ZpRAAcTOW5TjBfA6r2hOSgc+4n9cR/dckMXczdus
	ZYOLWcvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJrS-00000009kjO-0zvZ;
	Thu, 01 Oct 2026 16:42:22 +0000
Received: from mail-oo2-x28.google.com ([2607:f8b0:4864:31::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJrP-00000009kiX-3tyq
	for ath11k@lists.infradead.org;
	Thu, 01 Oct 2026 16:42:21 +0000
Received: by mail-oo2-x28.google.com with SMTP id 46e09a7af769-81a86afd781so3044553a34.1
        for <ath11k@lists.infradead.org>; Thu, 01 Oct 2026 09:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790872937; x=1791477737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ErsgCdjJpA/DlSdvk3QC3jh560CNo6DjQxt2VzypIM=;
        b=IZGiCiyGk5ayuIVeliOWi8OodROD+MZYjxVtLnnmSm8FwD7d64/p3UT6qm33+vRcAd
         37RMBNu6ow1hrlCJtSKid4WXSsn79zoNEq6kb8B9zUDBxSyohwx6r50QSUtQDNCwNqd+
         BmhOvBWDmBQ2lfHwHtI7wybZCzloryC4daDv87qHSIAHOKsIjeU6n0ByHrvQnLfHnMNT
         ONh61m52TZCOSZw04pHqtCJB9yUFRk/fZxvIKeztT6rfX2wA7EqL8yCYiDrU4hLO27Av
         ATc95U/bfbN3xDBdGDCIbjORatouj6OgppV8Dr9NzYTyn/NGmhHRHYxWmG5h1OSXXaao
         7W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872937; x=1791477737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ErsgCdjJpA/DlSdvk3QC3jh560CNo6DjQxt2VzypIM=;
        b=YONx0JPFbyOyyy334Vca89eaQZUOIn8mB7PEwsNjrjrqlJw51BilPila1t1/fsIdzM
         3GEZ9XwRDsKp5GQy4Tqunp5Li1JfvZbZaYFIH9Cqet1KOlBAtOwHS+mbuTNyn0rxDjRV
         +pP/Cd5Vgy/q+IayWqFC5QoGwk9+W1UlwqU1ZbP16/J+hqXAxPDyikbht/mjz8irfmYG
         6bDloKtao8GeePE2dMO/3JPWNuwDiTEVCCd3w7AZ0pwvkh0X3bVKIv1PPEM8TU481SOK
         OSTN5iQ486Vj0YanMazs+Porvb3rLa5JqgADJp0HhUw3eSO7Ue3BjN6tfZda0BK0IvH1
         7ulA==
X-Forwarded-Encrypted: i=1; AKwUvByK54l4l2YBdEpYZbkAtLr8i9pju2Hhr08MB9j/ygk8PWEndQuyqVlJddx7sxcsPd2ciAjCegg=@lists.infradead.org
X-Gm-Message-State: AFuF++mrJLptvEf74IlGYPlJGJRnlugz90x3UpSDO77HKsHrOHjGdUhV
	9WzpgGN7YvCJL0wbIwW07h8qJvvo+1TReeMQihy4RuTcR8XCEGT5gp/t
X-Gm-Gg: AYBFou2L3z823kQEkw60XwDpq+yjbb5ktMGuEAQ44gKRvS963JYxWIJEmpbO5++4onc
	s+1ip1MJpVmOmsSUhpRCWIcaWSk4HYOF4ihksn+5dBd5Nu8RuuTmKgpUmmgt7jcZ6EN2eTFqli4
	4uV1rtpXfEzQ/SnrIRZ9Ngs6f2idiK/Q9W/SNjv78o7hdiZEsfgzqDZP2o4Xz1hxs7aNsJgJj/p
	JFr0+/66UhQt8nQweo4knALTOgzNxP4zGEM0uXcjxMaV2L/wXKv0dXBWLZg6klZqN5JmKtsY5j9
	38pWSwpufdRmuLqNNZoOSqcgjB9JPV/HQyTv318Q044Yq0iYw6HdQNy4gw6bdOWr5nuxUOMItQ0
	qu0QUl/qfNAB7AyJZ2ukK8H4hAgRn01oJ1eyWyg7xC6/W34NiYqXtRJUPacDWCZ9O3FOtgrYeDG
	qZbqbq55duCzeWAGu7XDnAqCBRDmzo5cDiIt6DenAcEZhZibf5llSYH/YKwAfEaqQnyqFHjOQrD
	rnU6AbAF4ZIXCjXuGkNsLkxyF/RMznbEeOUIIY=
X-Received: by 2002:a05:6830:3498:b0:81c:5aac:798a with SMTP id 46e09a7af769-82284552ff7mr195697a34.13.1790872937467;
        Thu, 01 Oct 2026 09:42:17 -0700 (PDT)
Received: from cachyos-a.lan ([216.212.36.213])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8227a16aaadsm304424a34.18.2026.10.01.09.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:42:17 -0700 (PDT)
From: Patrick Lawler <patricktlawler@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Patrick Lawler <patricktlawler@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath11k: require unique station addresses per radio
Date: Thu,  1 Oct 2026 12:41:39 -0400
Message-ID: <20261001164139.370144-1-patricktlawler@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_094220_333543_BA4FE9C0 
X-CRM114-Status: GOOD (  15.86  )
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

Commit 1e744bf218b5 ("ath11k: fix duplication peer create on same
radio") made ath11k_peer_create() refuse a peer whose address already
exists on the same radio, because the firmware asserts when asked to
create it. Commit d673cb6fe6c0 ("wifi: ath11k: fix peer
addition/deletion error on sta band migration") reduced that check to
the same vdev, so a second peer with the same address on another vdev
of the same radio is sent to the firmware again.

This happens with several BSSes on one radio: hostapd adds a station
to the driver when it receives an Authentication frame and only
removes it from the other BSSes once it associates. On an IPQ9574 with
four BSSes on the 2.4 GHz radio, Tuya Wi-Fi devices trigger it while
they are being set up: the firmware asserts, ath11k logs "failed to
find peer ... after creation" and every following WMI command fails
with -ESHUTDOWN. Any station in range can do the same with
Authentication frames from one address to two BSSes of the radio.

ath11k registers one ieee80211_hw per radio, so set
IEEE80211_HW_NEEDS_UNIQUE_STA_ADDR: mac80211 then refuses the second
station with -ENOTUNIQ before the driver or the firmware is involved,
and hostapd rejects that authentication. A client moving between BSSes
of the same radio has to leave the first one before it can join the
second, as before d673cb6fe6c0 and as with ath12k. Stations on another
radio, the case d673cb6fe6c0 was about, are not affected.

Tested-on: IPQ9574 hw1.0 AHB WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

Fixes: d673cb6fe6c0 ("wifi: ath11k: fix peer addition/deletion error on sta band migration")
Cc: stable@vger.kernel.org
Signed-off-by: Patrick Lawler <patricktlawler@gmail.com>
---
IPQ9574 support is not in mainline ath11k yet; this was tested with
OpenWrt's ath11k (backports 7.2) plus its out-of-tree IPQ9574 patches.
With the patch, re-adding the device that had crashed the radio gave
29 refused authentications and no firmware assert, and the device
joined its intended BSS 39 s later. The cross-radio case from
d673cb6fe6c0 could not be tested here: IPQ9574 has one ath11k radio.

I used the mac80211 flag rather than restoring the driver check from
1e744bf218b5 because it refuses the station before any driver or
firmware state is touched. I can send the driver check instead, or as
well, if that is preferred.

 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ae91b57c8..a7574803e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10518,6 +10518,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ieee80211_hw_set(ar->hw, QUEUE_CONTROL);
 	ieee80211_hw_set(ar->hw, SUPPORTS_TX_FRAG);
 	ieee80211_hw_set(ar->hw, REPORTS_LOW_ACK);
+	ieee80211_hw_set(ar->hw, NEEDS_UNIQUE_STA_ADDR);
 
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_ETHERNET) {
 		ieee80211_hw_set(ar->hw, SUPPORTS_TX_ENCAP_OFFLOAD);
-- 
2.55.0


