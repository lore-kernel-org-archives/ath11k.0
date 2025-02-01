Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64143C02194
	for <ath11k@archiver.kernel.org>; Sat,  1 Feb 2025 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KVrpqivVclrkNJ3DXwl8qw6V7kQmEH15SzRImukJaRc=; b=1qlirUjPeVt6eYKxgQPQQzMGhn
	6yx4Zoa027Ls8qZc9GtXCtoBK627ZN50HzkjLKYHDvITGqkgQXN3dRcs4LAG4JFm2yld/y+cR3L1a
	4+nUlKQFaVNfMV//OP7K8fFhR4yzCGPX4TQ/v8IbLbkH4qCWSHgVSp/5ZbFwHZTpvMr6kr70mhZRH
	NITYtFIfkSbmzi87KRW8Q4FrBJ++z0NPpnm5dKtthcWOCMwvLIFrkNjl+9wGwd+1rPmjaO4Zh6qji
	zMjAikw+/WSBMB+vdVg4AOf/czXA/o9Q1rOSlUaxNGguQrdSrvAGtc+kdIfukbXwKGEdcq4Ce8dxn
	mmgBkOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teGEw-0000000CqtZ-039N;
	Sat, 01 Feb 2025 16:21:02 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teGEt-0000000CqtE-1nLt
	for ath11k@lists.infradead.org;
	Sat, 01 Feb 2025 16:21:00 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so3306137e87.3
        for <ath11k@lists.infradead.org>; Sat, 01 Feb 2025 08:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738426857; x=1739031657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KVrpqivVclrkNJ3DXwl8qw6V7kQmEH15SzRImukJaRc=;
        b=weox4BdlUnGWpKxlvhO3lDLND78+J2tXXJrlby1hBfVJj6Mzljx380yBCRFZ228pSY
         WvTal2eAXhLBdS72Sfgoi327T32q8D/fNS8fQTxEq4gFBhVmRxid902RnhnEy3mAQcwZ
         bscxW4SGneqkam7LDT8qPB4AhDN/6nWs+35QM43j8VmoCCw6GyPa36h9IEU6i+NgSLkJ
         Swv8lJQmG5aocdMlvn88CnQod1OnutgZSBalvb6irtGjs6oxc1DGYRVryUSgV7MCj/8j
         JEFRPeXQLaAZ+thNmOwGjt7orQr4K+TH3U+RzXHzwh75MvB/BQImXI9eTIqaCsqGNLvb
         DjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738426857; x=1739031657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVrpqivVclrkNJ3DXwl8qw6V7kQmEH15SzRImukJaRc=;
        b=MnaGHSBPMwfz3qNOhaEH4+ehX8JiPinjjBeP6YCwZOWT/uqgCIgv2bMvAHY/IGjGMD
         cFk796LxA1TfVg6628M52aAz2rCvYsnFu+f2oqU4DfT/31BNMb2vXKatyfEfNezMpwhy
         kYlCubfdiFkDTRS/RrbtM9/Y22dV7DTeqai402M9qKdhD7qQ9AQEHk4zU/Ix10hLKcKo
         Idv57r65DgncOCBEIma3tpWcqtHIzTVI1G7+SlMzphtfFcmWT3iSbLX1HyCIphp3xX9m
         qMXE23BOVcDCMZryiEmISE+V988oYyvTMwywfcUmAfBCD3V6f4uQ/VSbez55EpCS6IQy
         xiRA==
X-Forwarded-Encrypted: i=1; AJvYcCWjOgliFfUjOzkkHBtZkJbD1f2pPEe49uTxQKENGuTsvGx72yc7Mjk6ITmZNovlruSiVZB2nQ4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4m8wmMX05JA2nn2dF5sCkAjvqU6+MiynUAyKOZ9vsk1jhlmq0
	CyLA+cPhm/87OBciXahMm3ll2krLtoVTHjUP0gjRoLDZTYA17J5kN6kQq163C+A=
X-Gm-Gg: ASbGncthFmiXjC5tFMyGDwMJGWyW/fyZb49Q4D7d+ieWt866OcJogiHa25I7J/Ue7D0
	1FYb0OjgLUovcTS8JusKwnC+3vhqvbM86808wQLTJbKblvUvmgA8WVcwadyw+2i0vz6/niZw8Ah
	L9Y5fDQNUGDi7zuz7r91YGEjYy4hmZafYJu2Yd7b+WtZSbZHQ1FTcHceLMmqy8BfmvyUu5nhpY2
	fF67a3ulGa17SMNxGVLEooN7Gix76PZN3Teh7xvmLxPhLOC2Z9mrQqXZ5wiHv7MW8XvLouaKrZY
	kavncCiHlUhuJ5uI13PAHswaEtLSaDo=
X-Google-Smtp-Source: AGHT+IGzLjvNy5md5KJMNowDOz5fBZmGTDNe2Ls3qAbLpqBRkp4azUKYm8Ap4tW15m6c0DiiSs6j3g==
X-Received: by 2002:ac2:4d05:0:b0:540:1e17:10eb with SMTP id 2adb3069b0e04-543e4c3a0d9mr4750727e87.48.1738426855892;
        Sat, 01 Feb 2025 08:20:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf0fb8sm775308e87.7.2025.02.01.08.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:20:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-firmware@kernel.org,
	ath11k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: ath11k: add device-specific firmware for QCM6490 boards
Date: Sat,  1 Feb 2025 18:20:52 +0200
Message-Id: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_082059_479868_4520A776 
X-CRM114-Status: UNSURE (   7.50  )
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

Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
NAK this.

Compatibility links are added to follow the names in the existing DTs for the
QCM6490-IDP and Qualcomm RB3 Gen2. If platform maintainers think that breaking
those is fine, I can drop those link.

The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83a7:

  Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware rb3gen2-wpss

for you to fetch changes up to f0e750f347227cb1e0008715a27b2020399b5efc:

  ath11k: add device-specific firmware for QCM6490 boards (2025-02-01 18:10:11 +0200)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      ath11k: add device-specific firmware for QCM6490 boards

 WHENCE                                |   7 +++++++
 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn | Bin 0 -> 7734064 bytes
 2 files changed, 7 insertions(+)
 create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn

