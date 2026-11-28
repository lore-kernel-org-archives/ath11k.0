Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26CC60A3801
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sRZjSAkB;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=R5QDyezQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=; b=sRZjSAkBXjTbrd
	YjziH6iEqoUcfBblPkL7Pk9lCb3ZQ1XPlhuS+3Js0SxMi/GRQ4Eie6vTiuG2FeWrCMAjxv5H1cgEd
	O5aVrXRrlffDK4OkXiKnKLyfd27nAcUVfusYAhmc/uqL9W4EJublKWWWkiI3BTYi40FFYvVxVXSOx
	9XCrmQI4oGbvXNM3g+aDORIieXgGJOXAO/PmiOXhCAiVrMdfATxbThTLo7FeNQiUusfyV8DLp8GXa
	vlKLQLWIMKqubKsH2FgmJ9EIlCMAUQ7B4soF/NiK3wleMBG+ZAVpDIZGOC0UmFD9p3IZrSxF3v6cs
	gpRtIoeSHUmj4webW0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtp-00000000wPc-10Sg;
	Sat, 28 Nov 2026 16:03:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXKtk-00000000wIW-3m87
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 16:03:38 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c5188e17487so520425366b.2
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881815; x=1796486615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=;
        b=R5QDyezQVQFXQM4cz7Bp3IK0ov0Nn58v4OqYGJqzQFg7MPh9hVmNVaR9CqIeltUtWp
         f/7lts+aoGt0IBeeP5NANKvejDOhRQmhF8ULrZ/vqW2tsbqkhyM0VNpHtDtIpjyTicSJ
         XvKAmD/MFBBn71/4Dq/ktTtEaS6meKyj08ACHgqhsLpHpotOyllfTViyX41xp67ifDtv
         wW++yrgVNUcjpBArbMJ5vuIHM58La6T2xOjH8tmUIAcYkPynV4orFHW3TMWUI+XxFVzL
         qkf4yIk90j7xU87QLAKoFNZpTe0U7kYlCf4P0y9RPOflbthiSAiVrNbEakc8UAVApDqx
         4g0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881815; x=1796486615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=;
        b=u09YDOwu5YEICRktWuOzwtRZvS1v8/jwUlB/Gl81FLUfmlwGKOLVu+Ez4fPPTEHJLi
         dbs48rT2XoxS4y1dI3kFPziqBNZHSaxKUrtk5tqzhNPu8W3C/aSkO6xnWiCdbHqfDvOi
         97RcZ55x6cziIXVERXOj7nxiCf/7bNdhef5M7RtG3nsClzAfNV7YOcwz+MQhV2Z7hjgw
         1oZ3c8V4CDnF7UDSQCW/yu+/g7UWPdaTnRhve6AZg6RI230H0ZGgSlfLqWpAaqy6Yr+X
         QHyjc2/iWdEMlDhcD4WI1/VBDXEev3gwp4B6mTKIpZSI3rrPAEHB4LSYVpOtyFYZmBJV
         pkUw==
X-Forwarded-Encrypted: i=1; AL+hErFJP0hfvyFllBFGnOG3nx0M6wQ4kHj4bA+kzxevMchUfPP4IW/HNrcZwsyXclk5phq/capSrBo=@lists.infradead.org
X-Gm-Message-State: APuU4Z8hJueBj06vGi8gkbsM90obTuHW/QOGoLienhfZpuAQvtmwGMbc
	Ysm43jgRC5eMjrrSg6mB49ze+VahY3v3Y7mSgPGxrQby2rUhP30ZcsLLgO9tS9y4Iw==
X-Gm-Gg: AZFdTZd5rAHsNJcEipxHofwwOpVf2bI3H1luWLW5Bg2qgitBmh+X6xnyyWHTDS9cnQE
	HTNCdbtiUw6sF/lC24PEwjmGZufD+ZZ2xj1ag0+53gkwzX0W1hhRhLj+TqLZ7u7aDPR/WlJv0JD
	WcsDwelM7eylRS6T6mQ2cvzQRa3elPuDMIEzUxJNMp5xoNzF8mX5D454I18tIqA1UwKNNZF8qJy
	nkMCJvm5CmflhQ+JosB+AuEuUabq307C9Bj1XcNbW9xB2T+ZxBG9W8qbZ4TSTH/Fx88dU0ThbAV
	4lrLUaP9OyCu7Wl83hqt6ll1yAmJFJ9UDBkC+A0H9aT9oBq8YuphxeHvHupd1FEPDdusTz25Q+y
	3Mx9wwsnNQsJJrWyYhMmEo4sqxXZUjMZQNHkESvK0rG79UHZ/ObnE32R0QDXNQjomI16wTxBTWj
	aro8zRABnHyKB/P5EO2cLm7sLFfgEtzvZYo8Nz8HFY24FCdWLXktbkqsf+VGLyxCAdtYNeaN1Qt
	GUYkA61Ej8lN2eUfvOOFplOFLLw0IloaRegrqovH4Od+P8WhlH9S1q6rFkkZAfz8Tkm15cAjEZB
	j2qdYxAGKKIyjnSA9E8ShGv/ZWj2S36kK0uE/vMyPUlvtLiMa4A4k9zfiM0MpFbVWC2KLcG2fqw
	IzXmi++9AnxN20YQLb1VAq3I8HByYiY2f4dYAdXXag0vfxnxViJ1q6OBpU+PArhVic1KP/dGFyU
	0sKc9/pJ/hv9em1SDX8ks43JIuom8/e8QyW3EPTelwfgew7/vBR0f7cnasZp2WakkvR3Nr09+LU
	55ioVGhLuQhilULFUfMysYkB7aq5kpLrQsQ8zOgzch05a6ZkytZvLQG+M5vZ3nRiCyd+EApAGGp
	4LqFLxhewBSRug==
X-Received: by 2002:a17:906:bcfb:b0:c40:b59:1b with SMTP id a640c23a62f3a-c513aca41b9mr1650900866b.44.1795881814994;
        Sat, 28 Nov 2026 08:03:34 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.33
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
Subject: [PATCH wireless-next v2 2/7] wifi: mac80211: use the ampdu argument of ieee80211_calc_expected_tx_airtime()
Date: Sat, 28 Nov 2026 17:03:30 +0100
Message-ID: <20261128160335.1815537-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_080336_999860_9EBE99D9 
X-CRM114-Status: UNSURE (   8.95  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since ieee80211_rate_expected_tx_airtime() was split out,
ieee80211_calc_expected_tx_airtime() passes true to it and ignores its
own ampdu argument. ieee80211_tx_dequeue() passes false for a frame on
the VO queue, which AQL is then charged as part of an A-MPDU: its PHY
overhead is divided by 2 to 64 instead of charged in full.

Pass ampdu on.

Found by an LLM review (Claude) of the airtime code.

Fixes: 094dc1619cb0 ("wifi: mac80211: factor out part of ieee80211_calc_expected_tx_airtime")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New.

 net/mac80211/airtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index 55bc451d4a9d..d3b911fb711a 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -843,7 +843,7 @@ u32 ieee80211_calc_expected_tx_airtime(struct ieee80211_hw *hw,
 		u32 duration;
 
 		duration = ieee80211_rate_expected_tx_airtime(hw, tx_rate, ri,
-							      band, true, len);
+							      band, ampdu, len);
 		duration /= 1024;
 
 		return max_t(u32, duration, 4);
-- 
2.53.0


