Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324D606A33E
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uQB5z8ql;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TiwVDmuM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=; b=uQB5z8qlJZTJBfIrDQGvRbdCgX
	LWtlEFu/R+BZjXsvoFdRu7FnmT06CBRV3Q5QzvB7gnDg5ia0zulJn+b+YmM6gSNbXS0hQvcaMQFP2
	z/+jbgeRv+r2DCY7li4Cd8p6fQ+Aa86AYXUYHVMRNiEDLcJODxBGuCcF5bW7PEjTa0gVzvdO8+49h
	u5LYF0pCGtaKytYHZBnvxdp9W7uukuPR9tPOrZyjPneZkbzViBhHDLh4DYqjWrakkqToO0f4cbqdN
	KoWaHwNzDSmYAYO46mHu9EC3sRCq1cy2Y68+njWI05eg8oHbgiNpVYZXjudnpWhSmW3H8JA9g+0Sl
	qLRsp+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7py-000000019Yd-0sut;
	Sun, 22 Nov 2026 13:42:34 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7pt-000000019Uh-1BrA
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 13:42:32 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c4cdc606b47so415127966b.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 05:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354947; x=1795959747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=;
        b=TiwVDmuMNhQ0yZYz0KAFj2qRvewkN6gHsSQZk0vBERfNbZo08MxA1uNrjJ/48v6g3n
         V+Tb3vRT/z05IZTDWeHE/L73HNBruzK8pNNApGicioFgf9PPwbAg8udbHK4rUGSJZUZK
         Dt7zHR824YYPiodaKk/cfCEVimkgiZ3iRlnAnNdIpFfkteUBEGP6C1DXBb0xS2VraCMr
         Z2A7mVzgHpLvCY4s6dttyLQ/++1u0w7QwQkKuzmUZeOfVpho0KHkZbEZFxM8tK0IFzIt
         Q6y5cty4FFpy5yhZY5Rg0geDmcpg4HZIfqIdh4LFkknRGEQVCPlPjoi+U8wiyuona3X9
         uR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354947; x=1795959747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9qJb/G70CWhRDyDOXO3PSTyr68Kfj29Z7JRpthaS1o=;
        b=VTxOuYvNjqKmTuySgFEdxcShOKUGGistlINjrnb+LIxPYZNUpYB6jV64/DttlFU8ar
         B58x5ePrPKaQZOIGGNZqJ5fImmOqIaNYFBFRedZCErxEZhQmPsnZtx2MXtzdQhZIGdv8
         yC+j0MBVCzW6qOsg+XjLJtS6nJmELf+JHpuKY6Yvg7a7I5AT/0TO8f3ENLdsGCw85HcE
         JEVwtnVdJCfo0DIRJSG7rtK5G9fBDGWcXsWsIsG+dPiRtChIHlPh7YcJbW776Yeq81XF
         ASJnJFh+mtraaDKnw8nQNElI7rIXg5s5DFCRxxN2L40OaA4IN8VKUD+ncmM/Y73R4Zer
         B7Cg==
X-Forwarded-Encrypted: i=1; AL+hErFs9VBNezCm0YZlVPbkOs+1zHhLOefAUCRDuP5QmGbt9R/HcXX7v04ivsLboA9V/+Bv9zL317k=@lists.infradead.org
X-Gm-Message-State: APuU4Z8O9GjdQnBNXFQ3NrO4W4TBH1fRjleVVD01vJ0Nw7lXHnXDtPkG
	9gzx7MYtdWgf7hdc1T0MC5pF4n4e++3s1mKo+QJ9yhbGtaSnP4ANeVRA5o03LU6+YL6W6NLIGSe
	YMGnBjFaI
X-Gm-Gg: AZFdTZdgVjWidHXEwFJ6kEGZ1CQZqolut01Pcknr1aL4U2Baxrs1Jk/EPz2xOQ9RsBF
	4i1XQLEx5H0FH/qrFHbaRzGP1Pr5bM3hDMbF/bsdbwdRVg6axvYd1BCc1Bs6Z4eBB5HigTzACwh
	f8FfDLAvM/k2bvpLu6iT8btG6NtoAFJt3SUOCdOiEWijKlM0+xDlIsppa7wVYq6wx+YgAVXvAUl
	FzoQzslq6tgFZPeys05PSqTyQ3KASMSte9WKSv82friDpF7huu/Uq01OZgLifk1oHcBPAyg0nBX
	C63MRPe11ehm/e8FVcTRgR4xZTQeQBh/2NV36wImTrDKuxBm4WMjp6O/xWWcbhzIWnBnJOjM4d6
	hduTf+f/og32MMU8cKL4F8aY7SbmU0KAl6vCgVYK2aUVcnh7TCK+txSdGML98ZOT/BVr3XbQPyr
	ud/eYOioBWDiKVfHeWKhYfN6hA9HiAKCj9CnT3cjD9cMzgkVZIZ9LS1E+gLyXTUJy2vAOkRvWFu
	ZaWMbHTjxAKPpR0AJg4vp+tythff74EDNuOEA9GgbUf5r1qjW1btCEo14fL6q7RSQmAZrZT3+jM
	AAZC9F0Y7LyWNWanh5y0h132sUCZI+0BwKsC7ci1J3uXgx9oDJGdr95tdeRfbZnEbhnXsJa7Cp5
	UyV6h788LwQrEXkqp2WGZKKFvJWOuprgjAFaAb0trkWs10SOqeOnlw95Ve0MxCPCEUEOzqaJARR
	JPaFeTiNKgqkmHlDMVvpzELxlw4QWMfHWnwVX35kP/2ytayS9iJZVz1G0uzLerPNVAByDa3slm9
	hH9AwI9Xw9JhjDLKVgZdIl0OZ/CsT4r2bW89GjjJLBon3VbX78pI+UGF98p+mOPnHnWcGTdohwX
	0GRaZnijSo0gEZVFlj11DNs0pFlJ8BeMuKC/F4nKMuPoOVrFWzdu3T8=
X-Received: by 2002:a17:906:6690:b0:c4d:167d:dcee with SMTP id a640c23a62f3a-c513aabb216mr555094366b.40.1795354947374;
        Sun, 22 Nov 2026 05:42:27 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:26 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/4] wifi: mac80211: TSO and SG for encap offload, and the TID of 802.3 RX frames
Date: Sun, 22 Nov 2026 14:42:24 +0100
Message-ID: <20261122134228.956044-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_054229_346695_26702F6D 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch 1 lets a driver offer TSO and scatter-gather on the netdevs that
send with 802.3 encap offload, without offering them on the 802.11
path. ath11k uses it on IPQ8074 in a series for ath-next that lets the
TCL segment TCP batches, which depends on this patch.

Patches 2 to 4 count frames received in 802.3 format on their TID: the
802.3 receive path counted all of them on TID 0. Patch 2 adds the field,
3 and 4 fill it in ath11k and ath12k.

Patches 1 to 3 ran on a Xiaomi AX3600 (IPQ8074 hw2.0, firmware
WLAN.HK.2.12-01460) as part of OpenWrt's 6.18 kernel with wireless
backports 7.2, as an AP with Ethernet encap and decap.

I used Claude (Anthropic) to help write these patches.
I have reviewed the commit messages and the cover letter myself and
edited them where needed.

Julius Bairaktaris (4):
  wifi: mac80211: advertise TSO and SG for encap offloaded frames
  wifi: mac80211: take the TID of an 802.3 frame from the driver
  wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
  wifi: ath12k: pass the TID of a received 802.3 frame to mac80211

 drivers/net/wireless/ath/ath11k/dp_rx.c |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c |  1 +
 include/net/mac80211.h                  | 19 +++++++++
 net/mac80211/iface.c                    | 14 +++++++
 net/mac80211/main.c                     |  3 +-
 net/mac80211/rx.c                       |  3 ++
 net/mac80211/tx.c                       | 53 ++++++++++++++++++++++++-
 7 files changed, 91 insertions(+), 3 deletions(-)


base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.53.0


