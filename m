Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984F0C77B73
	for <ath11k@archiver.kernel.org>; Mon,  8 May 2023 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xrXEwgVPpqDnv9eMRD84hJvalGl5+87HK0zTdMYcK8=; b=hgUk9doLY/onE9
	YDHFhLE6QtL85/xiZHNo5ObcDCY/cEC+ZhF/HxYb4q0lpytYyQp1X8eZ4kOBROLB78MRvC8M5nREq
	wOBztkAWoLv7PUOnkbsSYGlxXvmBiwcHnKCYJV93UGEHna3beVg7ziNXVnqckF+1eO7MkTBgb6urJ
	NCopC6a5upIveKcMuCPuMSJPpAZqpGlQAH5Z5VgilAGOoNCHcPuXo2k0lY3LCYtmlVEbBbNLDeXz5
	d57owu38HJiZBJ1oxkRUkDJNWddMjbLGE0jEktfVNo8BbavYVmAA9uGYpbQEt4YdiTm90Rj/3QZCX
	k8vMikK3zBDvlfQKGQyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvxw6-0009yt-19;
	Mon, 08 May 2023 10:17:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvxw3-0009xO-2Y
	for ath11k@lists.infradead.org;
	Mon, 08 May 2023 10:17:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5576B624DD;
	Mon,  8 May 2023 10:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464ABC433EF;
	Mon,  8 May 2023 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683541058;
	bh=VcVr4HRav66u8ZpAo9LD0FoqBN0HlX52IbJUdRpdA3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VFzLzFjuY2C57YW22SpejTYohrt+YvL6XWMUzbeAa2wmlMmPOaVr8IdIGpeZwHMKc
	 sxMlYx/Yr9iHu7PvuUZj87Lu2qzGEO8ncC6q6+vrbI9VJZSJY0Ijtny12h9fzwM/Fm
	 tlYgsK7xSIif8u2TFHCb7Ea3KE/ZOrMLSt2MkZr0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Martin Liska <mliska@suse.cz>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>
Subject: [PATCH 6.1 601/611] wifi: ath11k: synchronize ath11k_mac_he_gi_to_nl80211_he_gi()s return type
Date: Mon,  8 May 2023 11:47:23 +0200
Message-Id: <20230508094441.433673192@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508094421.513073170@linuxfoundation.org>
References: <20230508094421.513073170@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_031739_879356_49D4DAFE 
X-CRM114-Status: GOOD (  11.46  )
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

From: Jiri Slaby (SUSE) <jirislaby@kernel.org>

commit dd1c2322694522f674c874f5fa02ac5ae39135dd upstream.

ath11k_mac_he_gi_to_nl80211_he_gi() generates a valid warning with gcc-13:
  drivers/net/wireless/ath/ath11k/mac.c:321:20: error: conflicting types for 'ath11k_mac_he_gi_to_nl80211_he_gi' due to enum/integer mismatch; have 'enum nl80211_he_gi(u8)'
  drivers/net/wireless/ath/ath11k/mac.h:166:5: note: previous declaration of 'ath11k_mac_he_gi_to_nl80211_he_gi' with type 'u32(u8)'

I.e. the type of the return value ath11k_mac_he_gi_to_nl80211_he_gi() in
the declaration is u32, while the definition spells enum nl80211_he_gi.
Synchronize them to the latter.

Cc: Martin Liska <mliska@suse.cz>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20221031114341.10377-1-jirislaby@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath11k/mac.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -163,7 +163,7 @@ void ath11k_mac_drain_tx(struct ath11k *
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
-u32 ath11k_mac_he_gi_to_nl80211_he_gi(u8 sgi);
+enum nl80211_he_gi ath11k_mac_he_gi_to_nl80211_he_gi(u8 sgi);
 enum nl80211_he_ru_alloc ath11k_mac_phy_he_ru_to_nl80211_he_ru_alloc(u16 ru_phy);
 enum nl80211_he_ru_alloc ath11k_mac_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones);
 enum ath11k_supported_bw ath11k_mac_mac80211_bw_to_ath11k_bw(enum rate_info_bw bw);



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
