Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF77C3DA49
	for <ath11k@archiver.kernel.org>; Thu, 18 Jul 2024 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eT3/r8iq9vh5IHb+laarDBOv4FqNaSgzXd7Frm5ubA4=; b=HTK1BBbBLPPmQnFX9W7mxJ+9nZ
	I4GFV37Hatkk4M1bRcmxG/cK6dsm5P7we7s9YoNyRITDfQOCkSGQ+Wek7/4bpo3wwdyiKzuB4wJHZ
	s3Omg5Bc2nEDYxN6KE9GslJbcHI6g6w/95N0at0Dy/DThjgYjqq+iDTUeXZb3xCqYiz2/cUlnl0yX
	VNVRiexsTMee1pspHhBQo1gsPJBTFfEcNyy9BYk2jxpyjU5g4RNmAx9jJnJbomCgmx5bsl0CKjcG9
	hWOFSJrMbDNUPo3DPLkm/Vg+uF1JbSlxURtfqH7GZ9MoNcxzHyWIKlOr4S4UkUbBMFkExikeTn1dq
	eZNYDZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUPmL-0000000Gu92-3ZM5;
	Thu, 18 Jul 2024 11:58:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUPmJ-0000000Gu8B-19fp
	for ath11k@lists.infradead.org;
	Thu, 18 Jul 2024 11:58:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-426717a2d12so1669015e9.0
        for <ath11k@lists.infradead.org>; Thu, 18 Jul 2024 04:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721303909; x=1721908709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT3/r8iq9vh5IHb+laarDBOv4FqNaSgzXd7Frm5ubA4=;
        b=STk0tuknfpd66z9mnNll+aZ0+Dizs7w8N0BGy5C3YQ8ZJhzqUoUBcCTlPhhnFFc07a
         nmVf9Z0wgrcvv2CHUnEtqluj5f+dPQU6hO2kV6IcpPmfuKoixm5lvzpBP2s32a3gYU/e
         I3T4tIFl8Dvc5UmyHHT5uPRXJaGcFdCE50bj5PnYBBlHMmu9zbV9Phk815hP4UPj7rLw
         GHTFfd1uy6F7afxswfmMCPAfkyVPuwVF6qJvGOWnuafq81insMW1Cj5K+x3ADwqccD5U
         c4B8BAo9QG0pHKT55gsSHNWuYix8pjKwtAard59367CpS4T+mIc+J+hFlA5yhdLpkEVb
         FUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721303909; x=1721908709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT3/r8iq9vh5IHb+laarDBOv4FqNaSgzXd7Frm5ubA4=;
        b=DGGhTAP5x7/yoYcoVDjJJMNbw3u2iudFKEpO2cM9+HrDsWdp95b34PG7HpgTMhy45J
         cen3naAccQ2Fn874QyZVOHhf3v1GPTCMOk/qOjx4rgSyBEpKubnpc6lfTwuB1l5dXDit
         qdRNDAFfAccu2lst379jHI79aFw8Or/8zEcooo6pF3UuLEijRKF5fsEOhL2C14qlIWnA
         IA1ZGao2c0wLq+XVPioN3/nFwmGOZLLuEmwYTrDhReR2xMwj8dw9cX+pFN3ZXTWrOZHB
         043nuULe0Nn1MtOrDp88eGfocMO6XEDO1SIymsjUEmNE+j7ruqkpO59F1q28rgm64enf
         WNJw==
X-Forwarded-Encrypted: i=1; AJvYcCUKV/kSyjHdGnRZNL8C0jFGauXFvdhbtvN3C50+fqfo9VqI4Wf6I+NbbXHIxUxFnNhs3gRYpmfJrisHzGlL9viMoPKMu9ahkulg4A==
X-Gm-Message-State: AOJu0Ywq6Sgf4ZeArvpq0LnMWFz/Vmy3B9rsFI1m/hJ0PilBzsAEfhq5
	6VxwyNJojZIYfFPTusdBdkF1TuzdqMafjbsIqjmzVImySxNpWaui+gNjQc9EM7Y=
X-Google-Smtp-Source: AGHT+IHpOFhVVOR50WDCPfi6DXrjDJkGmwaqmpgdsmAo5+FCsTxtL42b6u3Rfj/yngP1z/p7fq9EnA==
X-Received: by 2002:a05:600c:4751:b0:426:5cc7:82f with SMTP id 5b1f17b1804b1-427d2b527demr5295885e9.13.1721303909431;
        Thu, 18 Jul 2024 04:58:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368467a34dcsm2258703f8f.109.2024.07.18.04.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 04:58:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] Kconfig: reduce the amount of power sequencing noise
Date: Thu, 18 Jul 2024 13:58:27 +0200
Message-ID: <172130382340.64067.7765392027721457700.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717142803.53248-1-brgl@bgdev.pl>
References: <20240717142803.53248-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_045831_342087_93D890A3 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 17 Jul 2024 16:28:03 +0200, Bartosz Golaszewski wrote:
> Kconfig will ask the user twice about power sequencing: once for the QCom
> WCN power sequencing driver and then again for the PCI power control
> driver using it.
> 
> Let's automate the selection of PCI_PWRCTL by introducing a new hidden
> symbol: HAVE_PWRCTL which should be selected by all platforms that have
> the need to include PCI power control code (right now: only ARCH_QCOM).
> 
> [...]

I'm picking this up into my pwrseq/for-current branch. I'll be off next week
so I want to give the autobuilders the chance to play with this and I'll send
a PR to Linus with another pwrseq fix I have queued tomorrow evening.

Let me know if there are any objections.

[1/1] Kconfig: reduce the amount of power sequencing noise
      commit: ed70aaac7c359540d3d8332827fa60b6a45e15f2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

