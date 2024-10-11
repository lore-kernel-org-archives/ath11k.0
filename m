Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F176D2447F
	for <ath11k@archiver.kernel.org>; Fri, 11 Oct 2024 06:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+zztn8OGm5T9Dev73bEcKrvo8yczZXjOdvebFEeUvOQ=; b=Am6Kpgu3183bx5M0I0SAlMsNa2
	h5ULyY1HJ3PlpdJPCqepRtS4chtYRwTb5st69QOTokf2K2DtKS3umbb91ITXlvwEPdUbdeFmbDZHz
	CkbU5UejxdF+Q3OJ64cZvH+NqukD2hQE3zSBPtB52jKVZVdVLPKa4joja6l/yVw4WwImTBXsRTAyv
	LBaMS7ALhcAq5G4QH5D/F+UQbLH6j2dv7uFjY0Ils2SQ7DYE6SjcUI1K/Iq2pLRgkhSPZ/pt63e2j
	gSgE9gg1i1SfukT+Y/fvnjGmf+1FBmBqN5MzaU0tjyqfv6H7yYQ3JiRsyOI5WcLvY7GUhNOdSzcVZ
	4I4wv46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz8wh-0000000FN77-3ZjM;
	Fri, 11 Oct 2024 06:16:15 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz8we-0000000FN6i-1S3i
	for ath11k@lists.infradead.org;
	Fri, 11 Oct 2024 06:16:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539e08149efso125350e87.1
        for <ath11k@lists.infradead.org>; Thu, 10 Oct 2024 23:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728627370; x=1729232170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zztn8OGm5T9Dev73bEcKrvo8yczZXjOdvebFEeUvOQ=;
        b=OfnQZNATPRZhwD7fFjfJ6E25k5L440kJQO+B/JkE5+mAbj+I6gaZuZWpeXVVlllCY3
         rlC2ydbr6W3uU4omoLxCWt0KxAyAUnlYEdehZP0UYuu98O1/06jrxAceV27eCX/u4HG9
         UxRnr8TgtaGdrDPJH2pszSrtNPso1Cxf5VSKxzILIamqUEQ/gI2dNpwKOmUC3V0A1+4u
         3P2DMyooQQOCHFVvTXaDXs/OE0c+q+UzWWoCGoIdD1/0XLZWRyqEEtlVH1IwGcbu3MDh
         fxlm6m4/PG53ivRyvwL3puf8qIBoD1yEhLr3VmUWCw1+S7FXSfLTFb0oExErV+s42wic
         PQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728627370; x=1729232170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zztn8OGm5T9Dev73bEcKrvo8yczZXjOdvebFEeUvOQ=;
        b=voHNOIzsFJQsTRDw2/X7aQEa9TZjwByepr2XGpGDzHxb9zx9876l0vPBWHqZDanv+F
         JHySYWMHLOp+gl0eTVrrD90CGnMrVBG6UszaHT0VBP9CiEPkghIMbZVle3jjZePSrK9n
         dFS/iKP3AiulC9Shj/DGag6Tt4PyUVl2Qpw9fdXqmnUzf2GSG14m+ITr4+IjJjvWV2ri
         KopSKA+rFt4vkKsj1I+0zGUKlVFrpVxex1OuRHCpZzhEZRSPRFCatFZRPPkMr748f+8i
         kJP3eSCIogVRbv6GtcMXpL1bi3ny3vZJVghmepcppk5n7yGUbIAcTFKnejCcHzi+9Gjv
         /DhA==
X-Gm-Message-State: AOJu0YyUv0IVxAn5gQMSSBld2cRowRevodrhHiaqmyqIeFShEHXpQ1e7
	ErJ0/qiwXA3kA0WxfZQT4AO2vkGdElACDrQrcqhODhvyRra5BY/yvhEzRoDYKjs=
X-Google-Smtp-Source: AGHT+IGc7gwTinuZHuGbc8LwJ5A7daFk3nc9VI9bk/hUTAkqi5rsZF98BxeF52XkN+XPoNa2N5quuA==
X-Received: by 2002:a05:6512:3a96:b0:536:7ba7:496d with SMTP id 2adb3069b0e04-539d6e555efmr477576e87.11.1728627369655;
        Thu, 10 Oct 2024 23:16:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8613sm496309e87.74.2024.10.10.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 23:16:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-firmware@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific subdir
Date: Fri, 11 Oct 2024 09:16:06 +0300
Message-Id: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_231612_440705_879B1654 
X-CRM114-Status: UNSURE (   9.56  )
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

The firmware under ath11k/WCN6750 can not be utilized on other devices using
WCN6750 to provide WiFi (e.g. on the Qualcomm RB3 gen2 board).  This is an
attempt to propose a solution by moving the file into device-specifig subdir.
Other platforms can place firmware files in other subdirs, depending on the
SoC.

Note, while performing the move I also propose squashing the firmware file.
This is the practice recommended by the msm platform maintainers for the DSP
firmware (not to mention that it also saves us from the extra symlinks). If
Kalle, ath11k maintainer, objects, I will keep the firmware in the split form.

For now this is an RFC in order to gather opinion form respective platform and
driver maintainers.

----------------------------------------------------------------

The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:

  Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware wcn6750-device-specific

for you to fetch changes up to abe8c109a2b4c422b627335d124473734c8790d8:

  ath11k: move WCN6750 firmware to the device-specific subdir (2024-10-10 22:26:20 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      ath11k: move WCN6750 firmware to the device-specific subdir

 WHENCE                                             |  12 ++----------
 ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
 ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b08                      |   0
 ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
 11 files changed, 2 insertions(+), 10 deletions(-)
 rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt

