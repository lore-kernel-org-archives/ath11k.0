Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71190C54ED1
	for <ath11k@archiver.kernel.org>; Thu, 22 May 2025 20:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1wSVqz32Lg2dSnny/+XxgnMzOGKReyfgy7ECXHzhydg=; b=BKlUEls1vg8NqErgpSdDrtJIhn
	ccGIC4LwGQcqeAm5bRLyQNSAkcsmGugyLxI0hrdNssm+bTlZJFdXawGQCVkdxiCzcuHx9FL0ENLki
	aBkey4C7V86j5DoRXHwvog+Kwivw19LDABRIcILLg+9taHoIUbdtVRMNyK6y2l0ppMpUxJedApNBN
	D85fXGDbtAp+3TMlMW6lmrACi61hud+rxfFIRB4Q2ltEwHiCz8uvyc/YcHP70N0XjdSU+mMmbvmrW
	yhOe1NCHS5n2bFdMtRQJxBoJkJV5+aZmLaoqFK40ZaqlzFD2mIh0s/8TuPKJvnL+qqb1nulImtbIj
	jA/P/xbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICBX-000000025kt-3iFe;
	Thu, 22 May 2025 20:06:35 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICAU-000000025ZB-2mkC
	for ath11k@lists.infradead.org;
	Thu, 22 May 2025 20:05:31 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6f8d663fa22so73280116d6.0
        for <ath11k@lists.infradead.org>; Thu, 22 May 2025 13:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747944329; x=1748549129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1wSVqz32Lg2dSnny/+XxgnMzOGKReyfgy7ECXHzhydg=;
        b=cQQJnK62NRLuQDNlIJIfv6PDmcLz6CbBh/aQUbt7dSUF22dclwldR2s2Ea2lQaTO3q
         xthnJ/SlWwjwaqkXnUV9qSD9TwEYnErGGiMyAm0mU5GbLiZwGIL1QTk01KM4aBUI6u+4
         QIDFgf4zSb9adiLFeAejJSWMiKrm/KMUySssO53Do7gtuowIQKBLqXA9za3WhVZamCDh
         pgMtCaZNuDKKILU7PqIZM7tbbqnlG4DJPeS6ohBEfycDYC7rciSUXAi09CuiruKwPJfx
         Ach8WqrC3EAyT2NHvOjEUhlV+X2KA/GGjomtvxg5l3pTJnUCIXHKj1J2+cNYt7fVuGPS
         asLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944329; x=1748549129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wSVqz32Lg2dSnny/+XxgnMzOGKReyfgy7ECXHzhydg=;
        b=HteFaJWuTByLagqYJOlaWlUBT0oKZaYBR330bIDJv0hgU9ZC4VyNs3+TWKsMDsf5vz
         B2TGF0xGJnyBv5KBFASr3mhjY1gNlmf9OO6k6o3HAh6JcLoEBgUJYQqkl0oFj22w9XUS
         EQdSfV35eQR8VRIEdBG4ba/QXQks60/o/CoFkPiCCmBAnWEtYP8B4D1n8hmysxRi1Pao
         egp+vg+OBDqjEfbGZ+WZIX51D1Nejo4xa7TdGxt5zU88DNNwBRMV3nbpipwXgOGOTs1r
         0AWrwgfo11OlIp7/M2vYCKWEN+wLsgYcw06GjgmuobZawYbmo5WT8eig4Uvs638CP0ks
         mInw==
X-Forwarded-Encrypted: i=1; AJvYcCUeFy1Dhd9kCXzb1tqXGmwev0Rggn3ArIcbaUl5Ybbc6rVbMuW0I7Ne+JW0p7sTRlyqHxhIbO0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqyo7qfN+Mg7RMOzUN8crRmHbk2VRLWfb/sFjy/IMGMfwmuHUx
	eWZNRQOb3K7D/4sCxfeSFo7kRpkTl/4AurHWtVrVqRcU9iY5MFpfQr+yxfwnQg==
X-Gm-Gg: ASbGnctlbLA0CO3KfWb9y01E6l+gbQUGu6CrFAlQdBcpFKrSZnx/h6Nu/MhPVRJ3FMv
	oEGAVHXiHUY8eTpwoulNRjQ+PNujxB0yccwQcehyfFVrDa6P1cjfGTZShFzXT7X26a1izOhc4gp
	H1ALh35lP9Txl3Orgg/VpGcgQM7Io3mDrdeiIbvnX/+fAcLecAXV7JBXhKwQj7v/+h56s/dZiPS
	USYQRmUm0p9WmgFZBOC/IpFpf4bI8DiVIRont5udPcvTj1wmEo9NAd8T8kenVUQnZnsH1KxK9td
	iKSekmjowRbmmwZRxCXwnouVulmbwziHmOTorTBpQDbPKuP1yx2NULVbxFU7sEGOjL1TqViUoY0
	=
X-Google-Smtp-Source: AGHT+IG5nSWFEty9vCN6gC150pOJ2PmZw80Dh5SuO3c3/HPGrsLNCcHFR/yUs1nQe+u4ZesyOmiwHw==
X-Received: by 2002:a05:620a:2903:b0:7c7:a5f5:5616 with SMTP id af79cd13be357-7cd47fae57amr2902555785a.42.1747944329026;
        Thu, 22 May 2025 13:05:29 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec228c01sm10867459241.33.2025.05.22.13.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:05:28 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jjohnson@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v3] wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready
Date: Thu, 22 May 2025 17:01:12 -0300
Message-ID: <20250522200519.16858-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_130530_698522_68D3BDCC 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
started/configured. Do the validation as soon as possible in order to avoid
undoing actions in that case and also to fix the following smatch warning:

drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready()
warn: missing unwind goto?

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Changelog:
v3: move validation to the beginning of the ath11k_core_qmi_firmware_ready(), so
we do not need to clean-up things. A small change over the commit msg due that change.
v2: https://lore.kernel.org/linux-wireless/20250515222520.4922-1-rodrigo.gobbi.7@gmail.com/#t
v1: https://lore.kernel.org/linux-wireless/20250515004258.87234-1-rodrigo.gobbi.7@gmail.com/
---
 drivers/net/wireless/ath/ath11k/core.c | 28 +++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2e9f8a5e61e4..b894e27435da 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2134,6 +2134,20 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 {
 	int ret;
 
+	switch (ath11k_crypto_mode) {
+	case ATH11K_CRYPT_MODE_SW:
+		set_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags);
+		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
+		break;
+	case ATH11K_CRYPT_MODE_HW:
+		clear_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags);
+		clear_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
+		break;
+	default:
+		ath11k_info(ab, "invalid crypto_mode: %d\n", ath11k_crypto_mode);
+		return -EINVAL;
+	}
+
 	ret = ath11k_core_start_firmware(ab, ab->fw_mode);
 	if (ret) {
 		ath11k_err(ab, "failed to start firmware: %d\n", ret);
@@ -2152,20 +2166,6 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		goto err_firmware_stop;
 	}
 
-	switch (ath11k_crypto_mode) {
-	case ATH11K_CRYPT_MODE_SW:
-		set_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags);
-		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
-		break;
-	case ATH11K_CRYPT_MODE_HW:
-		clear_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags);
-		clear_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
-		break;
-	default:
-		ath11k_info(ab, "invalid crypto_mode: %d\n", ath11k_crypto_mode);
-		return -EINVAL;
-	}
-
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)
 		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
 
-- 
2.49.0


