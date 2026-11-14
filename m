Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C3606A8B9
	for <ath11k@archiver.kernel.org>; Sat, 14 Nov 2026 22:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lS/aPle6;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=FdyoCdLO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=; b=lS/aPle6msVrIB
	ZupYegHx+dybBVoh4luV0j765K4r+upgeYWZgdPUL/DgjMEJ+jQ4Ww/SzIGVsGFEzN3Vl4elgI3SS
	lpXvcOgjekhjvSlkVIOB92tQ890qdh8GvWZi6T59FZPVvOIRt7vcYV4oLPjvsNXNDzQ5GAPREI5cT
	qel3ijrHKeGqapIT+dWCb3lY/B+h9TYIAFwfBDMJsz4jopu3VfyCWe4B4LDrzKPyP64d/wIKmj7ba
	rvjlYcCmDTj55sKgYZ6W3ObcudQ4Cu7Zaphzr7VvVj5hklsbZMiE23Y6OpWeNNUiS68ilXVsSrCCV
	4nQ7QeoAx6fwNjrrwrbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM7P-0000000GpTk-3IuM;
	Sat, 14 Nov 2026 22:21:07 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM7M-0000000GpRW-3rhZ
	for ath11k@lists.infradead.org;
	Sat, 14 Nov 2026 22:21:06 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so377896766b.2
        for <ath11k@lists.infradead.org>; Sat, 14 Nov 2026 14:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694863; x=1795299663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=;
        b=FdyoCdLOFhDKRm85QtNs2UzyPR9E4hn/1GtXSS2z2SAEWmFtUm0+eAP080972RmOLo
         6kIdt3VDwP+uckmcFWycoDTh48jh79rAO/aVOzUig4CLUUk9YT8uemsrmr4fArEDLOcf
         67c6IksnmJNBEJeE8afK9LuonzmvjNo/boteY8e2vLvIoSDS3d1agofTlHdeisYeeqMH
         exbO3MwUHltWwxUTy3UYdSKoMKlIpC3C5xZhokfqUJNBgIaJ2Qidcoa4NdIe2v9vzFPN
         r017CwasrKO8BIMjOmGsi9lXpe54XhfE1Jyd9cqtqirseo7qJB7o4qDRsGoYtdqKAG8+
         /uVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694863; x=1795299663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/lcEoG8SzzM6dCHzIQ7cKV185X11yB2lBIT1K3NOMs=;
        b=S7IjXrbVAdbA2yQh+58rxVBSD+ih/Lay3Z15oq53FDxzDQkHa/JGAPNBO+9RkMxIB8
         n9mQ/T5xFd3gy0FwWrYt879+6xKiOvp6yA8+drQYV5gi7ydzCaJlaXjtHrRtn/IxAKMf
         e2yvWMww4bJzTbx6IY+bJU6TdOAURb78RdzWn4EWgU8ks7gQmVstHwZgNBMPeygZWgYS
         xMaZI8CBO3LJOVFAdmLQhDXRN3UmcKdTTWX9XPPvyI+ptDXVx0AnA/UHh48DZQ3JxHnv
         Cz9BKfEQHrgg59JmWvUndEqRfyjLedvqsS5Rjlc0qUomXup+PbDThO5qCaHbnuvDt9W+
         LLSA==
X-Gm-Message-State: APuU4Z/TFxoSgqfjwXI9z9FUFQmHMd/RcNwd801i4/ZxybYPK8zxfnxk
	mm4nWGgd/MUYi9FLurBzhxNwc3OvHaKArt4QK9zAaKTLmj9xmUPhapF/ixrW0j2sqA==
X-Gm-Gg: AYBFou1nrNdG+xoQ8vD6Nus4aYkg7K9Z4lM0HOaevVmnIRD3DLntRhJ0THQMZYzS0lV
	8V41dmD3Ye0g2kQ7u3RXZWJbE/B5d+x+gZ1GuhP8ZQNo/v+jYG1jMyiwrFlvRyj9YRqpslp4so6
	zKxSMCb5ZF1Bb30E62j5iS0fZCEumoSMMRI+3PoCR2I52fLzAft/1gxkK/U9HgitDsbYU3p43EQ
	iEhtkyacnkPjJlINZIYbBeiotFGkH0GByOCzh9iw7la64OKS2oMf5SJA1CSb8zEK4GD1EEP4tV9
	j4pERT/NBZXM8KFjNlr/uYwZtocQSA6y7Kn+Trp3msZrwxVA8qRGLivi6wQltbM+uXsKIW6wnv9
	wPOH4wNGjVvNC2ohpg7E+8g9Z5yHsXumICR5B9d8vk5jb1vSLsbiLPgs7yQ+DHN1AoVTwcg1e7n
	53SRtwv1cHEoeR09RGfKsN8kJFrl6SZPEvq2MVPpB7jaftlkvLOGV0zHRxYKvtwKgN0l//VWlkr
	kz2V++kCO+lbEgv5IVqb/4JfrbVRf6sJeIKshhwob8TQ9Gkf6d86q4H5wcYR9qeE7OxHpATLSWI
	KBa4gNfm/QoCqW2OYWS4iCrJ4aOA7OYe2J1Man2tERCHG15GclZjttaoYZ54JF4+Xesh5mXiBZa
	v6vt7Q1elSDqufwSaP2wFU0itnyKKO0itPhsFUzEOKtKc5slaDedtQ6c9oBypnwgmh06iDYq5f9
	iJGwV/cUJ8VlaTFKzunAAaDrwfth5TF/s4Bh4CPrwQ1KqJfA60i/mdBK3WoHzZhH48CTQSfk/5w
	hkQXNG0l2PwEBWRTO+r6Ln1DF8Nn3aAN0Yet7Xcge9p+INWXTttcq5hYiha2sZ3ylVwaGXuLxzS
	g+TO0SspqX/bdYuLaYbS19pIQKDOFXzqZH0JYBBMbXpeaU46rbdQuwTzT2CJR7s1
X-Received: by 2002:a17:907:a909:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c50963777b8mr508487166b.11.1794694862973;
        Sat, 14 Nov 2026 14:21:02 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:01 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 1/2] wifi: ath11k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:57 +0100
Message-ID: <20261114222058.184034-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114222058.184034-1-julius@bairaktaris.de>
References: <20261114222058.184034-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_142104_980611_2DE41AD6 
X-CRM114-Status: GOOD (  14.34  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k requests the optional firmware-2.bin with
firmware_request_nowarn() and uses API 1 when the request fails.
firmware_request_nowarn() only silences the kernel's warning. It does
not set FW_OPT_NOFALLBACK_SYSFS, so with
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y, as OpenWrt sets, the lookup of
a missing file falls back to sysfs and sends a firmware uevent. OpenWrt's
procd hotplug handler answers it and logs "Could not find firmware
/lib/firmware/ath11k/IPQ8074/hw2.0/firmware-2.bin: No such file or
directory" each time the driver loads on an IPQ8074 device that ships no
firmware-2.bin.

Request the file with request_firmware_direct(), which sets
FW_OPT_NOFALLBACK_SYSFS, so a missing file is not passed to user space.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Closes: https://github.com/openwrt/openwrt/issues/24743
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- target ath-next in the subject
- name the code path that produces the message and why request_firmware_direct() avoids it
- drop the Assisted-by trailer
- rebased on ath-next 1be6c8d3027d, no code change
- new 2/2: ath12k has the same pattern (Rameshkumar Sundaram's request to fix ath12k alongside ath11k)

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

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


