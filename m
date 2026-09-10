Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7A7C79FB9
	for <ath11k@archiver.kernel.org>; Thu, 10 Sep 2026 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3oKadEwUB89/gkFFNEt4XJ5XQBlxybI+fNNIa++1CA=; b=UXdr9E0Whk7XW7E9JnINwP5eVO
	awVDVoQf1keXkvAQgSm1nU0EOk/QItEWX/mexYzzs9tWwDwc3Vb6kKXtTWPcyYYvlTikdxFr3cug/
	qppsVd2Xe8E7HekQmmrBr/8futLpBvSjHSCumW+HwNOHi6TCIy21UZCGy+d1tMs/8jkNZYITRDDvk
	ubEtQ2Tv+9OcPoWayW6gP0jpPb8yxqqMLKQqLWwRjem0AzZWGx4GMSPtj9m/FGyH/gryo+saO8tI0
	BSx4iz2GQfcqk6sQWGjsGOgASxyQe7xDCR60FFm1s+gfphWIePKwRYtfMcDeEnw0OVI64VHLSaOAq
	NnoaZR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z3V-0000000Dc46-1jQD;
	Thu, 10 Sep 2026 07:18:45 +0000
Received: from mail-ej2-x0a.google.com ([2a00:1450:4864:34::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z3T-0000000Dc3i-1q7n
	for ath11k@lists.infradead.org;
	Thu, 10 Sep 2026 07:18:45 +0000
Received: by mail-ej2-x0a.google.com with SMTP id a640c23a62f3a-c25b4493edfso296193466b.0
        for <ath11k@lists.infradead.org>; Thu, 10 Sep 2026 00:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789024721; x=1789629521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3oKadEwUB89/gkFFNEt4XJ5XQBlxybI+fNNIa++1CA=;
        b=N3CRknDRImyAWlNUSA+FDbkX0ooXJhWRxVGw1e5X21/cLMxL+cWBRx/Hds/YjhvLP0
         lb87bnTHSzG38hxW9JVN8puEVSd5BRGO0I4u2E4rcIrhk4ZECsWEvvGPMqzddO4MNu/x
         FIifjHGpaQabX1GVqElRCyh5+RNIFwDtwFWwB09EVKPqJf94RCSMPDAYBlO8Ws+guvsW
         kOAUkYUDUF5vAwu/EGo4rPd0ARfpn1fLMnvpMZsijIHXGb/mQabz2/mTEFt8aFUA1jka
         3bqQEl0ZD+wcKUUx/ZJ79uP2nnnjtVa0vvZUvmW0uPv7IcHjCMqZNDs3ZayDfKhIruce
         MXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024721; x=1789629521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3oKadEwUB89/gkFFNEt4XJ5XQBlxybI+fNNIa++1CA=;
        b=VZEfAwl7CbsPBhB6TNi/Hdad5ZOpo1Ly+xC+ApTRrP8sKJSyg04k4//9pypB+XXdbx
         PD4lG9WcYGhBRom8zcBQvl1yrbuMSjEXrYMASawZWNTDbzgaN8L6z/WDdr7kuUzqJ9DE
         +7S4LRxir5uBhsklpB1ibDnMekt+BiVFHdb87FkD1vPstvvQXYBb8Tpo4ZdHsX/Sarl4
         pxD+AymOUKgirxnCX23G2ORv9B/7lnx3Uv7xD3k8YQSuS09Ve+20HQQDZgtyJUGcTEvJ
         +jUsQUStYDAkPTd6A2KFGIg/N2kTXDfmpaqmiZJc7G7nIfJ++K93ltT2il7cBjR1ZV2d
         81sg==
X-Forwarded-Encrypted: i=1; AKwUvBzE7B1XvT5Z3OX8eXvbKzYuxiyJyvsJ3zUyoeG/iaBfqyBt/uUfSe0yuGspEwUyiWQYlEXyV4I=@lists.infradead.org
X-Gm-Message-State: AFuF++n5WkpRl2aQPxz5hRgLOom+uHCxf/wyq11X5oQqKsMMK2cIaBA1
	3Inr81jog8OCfiEshagopN7p8i4nYQ+ZAn9gRMAZ9uxJHFZcJJID+5oosqbIceIFXw==
X-Gm-Gg: AYBFou0NZBah/enacfCJz6b8EBdpGqokJURJCPsbi7bFgCVCml77Q4ZRECoigUuhg+v
	QmPmFmeW4D4CFMLyp2Uv5IOjcohUeR8lzFjSktxKUQzajZxKFUxwkmwyoudTtnyRL9/59yWbe36
	fF9VevMHh3cQcoAvtuzkmzUVp2q3ZvDlIegsjBGNvCmyWafgmiBvMe36C0LW8tuAYn8GPZS8mtV
	0uIMSIrv44jftb6fokCe8RZ2X7M2UKW2J4JmKG/UazcJY5/wRiQjkLpdYtcbh6HCiT3tXcL9qXz
	jL03xcEc/GM4KTWtKnhtCCXkTyKt2W9Eczf9QQynkKZZT5SiW87yH6z1foH/DmuctPphZ+I858B
	vF0uD0yQLb9HdDF4yGp2vgiudbJ/JUUI3dAyc++5ykOfPc5ULTDBkyE1wLV+/jAUIJ9HvRbF3W2
	yzJX75ODAj5E4AQap/dkKkpIsjFq/wCIHud4seQZvek7uk3OW5T0b7J4Z3ImkmxeCecp/ui1ToC
	EqA95GmkFIWKzxLi/oYpDGTBeB0Xo4dGqt0QmnpApoce2kVhHimVW4fFg5qCtGTbDHSb1MjQ6lA
	SyamycENlt5+tPaOqDvZ34yiCOxJZ2fiYpwcS2cxUaxyA82zgqB2DwqEXviXxeDnOSbqf4DOugu
	cFTs6c1cDfOOc5BB+L+sgib8JCVA0zsdhzMFEOn3IKQKL0v4tesRiIslCufZ99XKAwg+yOvAgEk
	kaOTyQ7w==
X-Received: by 2002:a17:907:1c09:b0:c25:2fb9:b897 with SMTP id a640c23a62f3a-c260ca1e763mr1519573166b.18.1789024720961;
        Thu, 10 Sep 2026 00:18:40 -0700 (PDT)
Received: from Desktop.fritz.box ([217.26.235.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2938a59134sm170305966b.51.2026.09.10.00.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:18:40 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath11k: request firmware-2.bin directly
Date: Thu, 10 Sep 2026 09:18:38 +0200
Message-ID: <20260910071838.1983652-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_001843_506961_A41F537D 
X-CRM114-Status: GOOD (  10.35  )
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

ath11k treats firmware-2.bin as optional and falls back to API 1 when
the file is not present. Request it with request_firmware_direct(),
which does not fall back to the userspace firmware helper.

Closes: https://github.com/openwrt/openwrt/issues/24743
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
index ef1b4c81843a..88ec2ffd9f00 100644
--- a/drivers/net/wireless/ath/ath11k/fw.c
+++ b/drivers/net/wireless/ath/ath11k/fw.c
@@ -16,10 +16,12 @@ static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
 	struct ath11k_fw_ie *hdr;
 	const u8 *data;
 	__le32 *timestamp;
+	char path[100];
 
-	ab->fw.fw = ath11k_core_firmware_request(ab, name);
-	if (IS_ERR(ab->fw.fw)) {
-		ret = PTR_ERR(ab->fw.fw);
+	ath11k_core_create_firmware_path(ab, name, path, sizeof(path));
+
+	ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
+	if (ret) {
 		ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
 		ab->fw.fw = NULL;
 		return ret;
-- 
2.53.0


