Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699AA60A261A
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wlMirtvD;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aS+OiXb4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=; b=wlMirtvDM6pW9s
	Nh7F6lLQcQ1w2tYLLfcTRbDbHUL07V8+wOlBIrlFyuLvegSmtbfxYB7Gv5LzkGOeU0LUB04OQMj9G
	UjY6oymvinkLhPlbInp6kgEeOq+GRMdqVLGH2NbAes0hrNM1hFMm6GYnz3R1msu7Ti5JgHl3J+OtN
	K5i+yIWHTb40A82UofvKKqQilvDE3wOiDmwPspKmoJDK5iZw/eThTNRrM3j6sHh2kSS/Lxf9FlYfi
	8oIYuLzcHMmGW7Z3sPsTFPoZYl2MJtLJD1tBl+0Ddog/SW4kPaNtFEflTyXGzawjKUHHV103tz+uB
	8uyRMrlTc8P5G2zyrgfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtm-00000000wL6-2qcX;
	Sat, 28 Nov 2026 16:03:38 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtj-00000000wHt-1yRh
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:37 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c50e26763a4so533844666b.1
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881813; x=1796486613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=;
        b=aS+OiXb4CUET/oORfau48ixXICzEBou8e6UDgyQ1YMVXsObyW+mleugPB62I3EdqmB
         67mXWFDYAyau9gXnQ/pz5sRcjz9qSO+iEkQQIt9hFDGR0lswuFldfIg5InwmIpQHTZlS
         mQMid1J5OP8QT2I+CZzLZyXGcz4eriJIpGVa9YQEXI8Qs5fSTqpZEtoXh92hP8jfT4Ae
         //kj7oQ5gg3YcbeOXrdAM3xlsGHrcQhv8yHtuxR34kiycUpgwYlEx/23wXm01MFp0uRc
         en20198ekCOwNt51OvwdC4yaTTll4SF8cAgi/7XHkTjAwhBFCOyFJU4x1AuUXlTN0Vt4
         6kRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881813; x=1796486613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=;
        b=wpEAh+IO3PKC8HSXZtJZxd7EduKt8Pilmn7t94IR15Ph7moqZbFyU9VJjzfjlSJAk8
         Oa7kSdrTmYQqemCYINKkynMftZfpEaWRXJDPg6+utb7mVr4Qn5qM2wLJYX3XBXgIaTx7
         mUyiqrgHgm1PiqZscEtdmNwAEV0lkdoAIEe7hBydp6YUJxjHhXMXxHZmY88l6CCpgvzI
         gDOK7cd9g8Mj4wVSS4INEjR6VShVOt5UH7vtJcq9iR0hnVOJYZeMWPWHX8OELIw3jfpN
         p4/rqiESa/KnVpe1ntq4d08NZIc5bUwqfoY+l97xZpbidq2dBAlbpujBWisiYcg/7FNc
         rFJA==
X-Forwarded-Encrypted: i=1; AL+hErFjT/8Z5+6yGJEQCtqCgHLimxIFp1+wkjW9ecXbdIpXNsfcKOhCiBSa7wasDjbrrcYCpML7u8w=@lists.infradead.org
X-Gm-Message-State: APuU4Z94wUHs8v3z6E05knLnG5MYcaJ+pt9C1VoO/BIE8Gwpv+nE34cs
	d9c1wrkcfcl33/8Alnrj8z8d1qOUr2mx6bBDcfX8lqQOESI5JNEssXy8/ubAHmxGHA==
X-Gm-Gg: AZFdTZfZpazmjH2GHsbTJEKovT5nqE2BWKM3IbyRTi68PuJ1+Caer3OzZszTwY6dtGY
	MUfFBFZxXmpyQQ8xG20awl700xVj0e8Fwc+CwRcu42reK6jxadpnMtIenzQak9tlWKGUEHFli32
	NDvRBK3F37Xk2Re14gyU8/WCrluTKSAW4OGwjR1wMhFsahuMhAQZzSSXZ/eBo8ccXop0pXQdUTn
	DsyKzfunJv+3Bv+7zBc5c6C3vOtakq/vkTdu2mZSYRDOVZoK7LFrEwW5keCMv7g3Ofb62CvgjKh
	I+fSnbA9aZSvWKsAQGncK+1RTG3zFY5vD/mIYUOR/r7uUfkQ0mT6Zvt9q8wKZLLcgTJ1mPF01rH
	jnUxAGZfKVr107MmOP5vu+qb7gfB6zZd8fAyXhGN2j92lH7x+c01yWj6oAtIIoskGXR3d1gxsFv
	bqlTpZD4qxjM2jISc5+tYoc09ZHaLrDKWXhvb1yr+FxOTaBf9fjjcANNRRYKOSVTj96zdCgLWot
	DPyHmyJY9eIERgGw0xsrGGQrqNSPbAbo8IW2XL/M+QKxB66K9W/M2+1P2FsRsKtVpw//MbRYYjL
	GJ8r00Zf9oCMyXYARKo+yZtE4s4i5j0l8zj7k2N5HT6TIyAnZSlPtkVlcj3Pi7cO4QgqvFGiAa3
	GY5jmZ/8wPMLL6GOBe63+7TWpXRkFYHUlRyCHjHzJdkiDA4auYf5KOL8b/qS8LiMLBkX6ZcWJJo
	vgSse6rWWQU29Mz86s6qenyil3WTo1pNGPWlhbRH/wY0j6AUzZo/VDWjgqL7U0JFWo8TcoJXR0R
	5jDyOtdhISbocfHihWqwlQxowpeg+6mX6mDHXvIrRAQ8gVI7brJ8H7j/wHt11r0lawIZVydCw9X
	ADVBHYAg8Zjh5m8=
X-Received: by 2002:a17:907:d1d:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c513a47e325mr2433115666b.4.1795881813536;
        Sat, 28 Nov 2026 08:03:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:33 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 1/7] wifi: mac80211: compute the airtime estimate in 64 bits
Date: Sat, 28 Nov 2026 17:03:29 +0100
Message-ID: <20261128160335.1815537-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080335_591870_7763CBF9 
X-CRM114-Status: UNSURE (   9.17  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ieee80211_calc_rx_airtime() and ieee80211_rate_expected_tx_airtime()
multiply the duration of an AVG_PKT_SIZE frame, in 1/1024 us, by the
frame length in a u32. The product is the airtime in us times 2^20, so
it wraps once the airtime reaches 4096 us. At HT MCS0 a 4096 byte
A-MPDU comes out as 945 us instead of 5041 us.

mt76x0, mt76x2 and mt7603 compute RX airtime in software and pass the
length of a whole A-MPDU to ieee80211_calc_rx_airtime(), so a station
that sends at a low rate is charged a fraction of its airtime.

Do the multiplication in 64 bits. Where it did not wrap, the result is
the same.

Found by the hosted Sashiko review of v1.

Fixes: db3e1c40cf2f ("mac80211: Import airtime calculation code from mt76")
Fixes: f01cfbaf9b29 ("mac80211: improve AQL aggregation estimation for low data rates")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New. The GSO estimate of v1 1/4 wrapped here.

 net/mac80211/airtime.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index ee5dc524347c..55bc451d4a9d 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -616,9 +616,7 @@ u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
 	if (!duration)
 		return 0;
 
-	duration *= len;
-	duration /= AVG_PKT_SIZE;
-	duration /= 1024;
+	duration = div_u64(mul_u32_u32(duration, len), AVG_PKT_SIZE * 1024);
 
 	return duration + overhead;
 }
@@ -813,8 +811,7 @@ u32 ieee80211_rate_expected_tx_airtime(struct ieee80211_hw *hw,
 	else
 		agg_shift = 6;
 
-	duration *= len;
-	duration /= AVG_PKT_SIZE;
+	duration = div_u64(mul_u32_u32(duration, len), AVG_PKT_SIZE);
 	duration += (overhead * 1024 >> agg_shift);
 
 	return duration;
-- 
2.53.0


