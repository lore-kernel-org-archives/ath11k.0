Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7226CCF2EA
	for <ath11k@archiver.kernel.org>; Mon, 19 Jan 2026 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jwBK6AZaPzGdovVFSWV9sDTCdheN7IXtWZT7jcQOxKQ=; b=h1iz+/AHrh61A65jhd/2vyvyNr
	hqfGZY1iHdQDJKy7ata8/CPTSV6Mut/6GL0UljKk693M3QoQVpNhsmPQgpSw5/L9yoIQcNIL4Ee2e
	oqb/lDD3hwKjFykES/MdD5JtD1MBQy/CyuwKbKqSSVE+XuXs59T23gKkDl9oDD795/UOUW+Bp5aai
	PUXy4Tx7MuzN/vtRd3rILv7q/Sna2U+HFpLJ5kRtqSZwNYOZjXkhALDkfcXHMLxvDx8F2fCpoH9Bo
	rgnm36XOTegbfD/StCB1Kl/7jx9qrN/KTFABotiLfnpEBSJKlcaJ8v4tf4KhYlz7iPYuPYK4klz3c
	D1uq/D1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnVc-00000001u5w-2h3l;
	Mon, 19 Jan 2026 11:33:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhnVZ-00000001u4q-4BzH
	for ath11k@lists.infradead.org;
	Mon, 19 Jan 2026 11:33:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b876bf5277dso787039766b.0
        for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768822400; x=1769427200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jwBK6AZaPzGdovVFSWV9sDTCdheN7IXtWZT7jcQOxKQ=;
        b=BGlwjv5aMg6a7/U4gelgVwxqSjxj+TEszGCbRDScB5qw5u3XSu3dpsCNKmdQ0TcoKk
         99BI5abJHb17/T3S4NCS6h62nhR1CIE160MN1h9cxsJiq8t+/KuoTU6RLPeD4VCGRS0U
         wsIwcA3CGEQVTeFI2e0xM7LMoYnRAICv8Wu0dNyGvOCVKX0URihG34GAsnzr9w1Ql29n
         OqiyOr1ywprrBV+9vec5UDm6LHeV6Qsg3v22Wk2HMzGVTFhhc9Xl5pujlSFBFo9r7OYd
         Db9T22lKknGHb+fz+a4i57hF+YrDzhQF/YFL26zZRvPQX/4IItM7z8ckyrfIF+ADVCa7
         wvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768822400; x=1769427200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwBK6AZaPzGdovVFSWV9sDTCdheN7IXtWZT7jcQOxKQ=;
        b=vCK1ngZXOogo+ysm7Q6VBQJg46is4qa+/96QOt9azQeOk0r6YxP+L/QCiWUY/DfSTK
         xZh31bP7hPLwcUWqelLHqVscdr6yXfb2Mo7mI8/hZk0vaNqEFVrkekJXERXCm/niwe/v
         WUBQYf1TPU73dv/NtDexmCCDKT8+5EvtJeRHdCZzc19S6aTgT6oQ+C3wsnyA/d6huTsR
         8erUA7AR4ZY1MjzkF/dsbSWLQ/MdpzFuX/1Ag84DNSO+BfFTACHmJ3myalOn+m+J9Sk3
         wWtGo49z0I4K2+ZRZ9+3DudCFVWSbHqNgKRCduFWLvyzBJMGj6Ayss00DJRI3OB4ijHG
         h70g==
X-Forwarded-Encrypted: i=1; AJvYcCXbcGKxMTIpevgP28I5SkqYMZJ0r24YazKeyBJVTl4Vi1P795H0sVVJu+sZeAr1Lng4yXBWNj8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGKH2040+rm1vC9OPJjAqG7HCik6JHAGzY0/scIx7/R4SCvQMg
	qLfbih36Y6szm15Kpv2fIfjJXa2oCCCCURO8Y+drvbyVLBeKGyK8KoQ=
X-Gm-Gg: AY/fxX7G+lzG6uZkNbtpaOTl1+z3rjiu2YnjT3fbWRE7DDJfD8jTkI62oXcpKtk7DDg
	zP6k7gWro0TGJR427qWkpIHumwAxomqa7oimSg6e/giscX7TQ7QjO0qsXzU3ZQ3CHpkh/dJEgAj
	dJst9o/TNtlk22l9tr5AOeszqYJQ+cSvBk8w5BBdTJGAE2Nmi4wh0nLCaL6BdmOkfxD5rPKTQh3
	NC5kr3tqYu4C+LXVjKpOJzyikwsXjcOjNX0+0FCsIXiTDPVqQSDkxlVarttSJQiBUsYo6ShNxsZ
	sMapLnJ/PEQLIe7VVUwsuO+47PweZBMv81yga9rb6PWCs/SzEnJambsxtQw57HSJdMcRdMiW5pF
	oXbjDnfF+Bl+2VH8rz0gDD6e25UBr3/5lVQuZEf8ihDLS855zYzimRlg7iZr36mC0RS5w4c2K0Z
	iqZlQa9LFzErIAeUF3gVdJYkp3/ChIp5s2oM3vdA==
X-Received: by 2002:a17:907:2da7:b0:b79:eba9:83b4 with SMTP id a640c23a62f3a-b87938586efmr1148569066b.6.1768822399465;
        Mon, 19 Jan 2026 03:33:19 -0800 (PST)
Received: from cachyos-x8664 (public-gprs367335.centertel.pl. [37.47.66.40])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b8795168e6asm1141447466b.22.2026.01.19.03.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:33:18 -0800 (PST)
From: testuser7 <frut3k7@gmail.com>
To: 
Cc: Gautham Kumar Senthilkumaran <gauthamk@qti.qualcomm.com>,
	=?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	"Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath11k: Fix the WMM param type
Date: Mon, 19 Jan 2026 12:33:01 +0100
Message-ID: <20260119113305.30440-1-frut3k7@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_033322_046066_BAC36E1E 
X-CRM114-Status: GOOD (  11.03  )
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

From: Gautham Kumar Senthilkumaran <gauthamk@qti.qualcomm.com>

Since FW does not support the 11ax EDCA parameter in WMI TLV command.
FW was crashing as host was sending this parameter, now changed the
WMM parameter type as default zero before sending to FW.

Fixes: b78c02f7c710 ("wifi: ath11k: add support for MU EDCA")
Signed-off-by: Gautham Kumar Senthilkumaran <gauthamk@qti.qualcomm.com>
Signed-off-by: Paweł Owoc <frut3k7@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 451cc4c719ae..2779ebb5e88b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2700,7 +2700,7 @@ int ath11k_wmi_send_wmm_update_cmd_tlv(struct ath11k *ar, u32 vdev_id,
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 
 	cmd->vdev_id = vdev_id;
-	cmd->wmm_param_type = wmm_param_type;
+	cmd->wmm_param_type = WMI_WMM_PARAM_TYPE_LEGACY;
 
 	for (ac = 0; ac < WME_NUM_AC; ac++) {
 		switch (ac) {
-- 
2.52.0


