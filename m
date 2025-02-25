Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D114C021BC
	for <ath11k@archiver.kernel.org>; Tue, 25 Feb 2025 05:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=COFBXMHPskIsoIit0YmVND2fstaviJl+t/pdbf0Dt6Q=; b=J4Qh3neY+ZOrY9c2p5OWxRaqhv
	d02GRGfjI6EQ4wu66I20Ygg5XCNWodTTyIQY9KB1mDVsdzP/Q0KhcMEV6Flfn+jQELQ69GKLttadR
	xJwnGfNZPw2DctQQbaJunJH/9Px8ftsZci5qFvKKGucgog8wBRnKO51SE8CfTMFL+pcRbMT4rptFw
	+vErXhOFLq09ClPmXdWlfw+hwS8CfjqkuDW9CcnqBjQ2LpsGkB0EMFLnI4pTmMUfXpe79P/XJcmBX
	GrIBt6ZtBntEn2MxYR0tF2o/j92++PLEc6kPyH4fz2YWLTmx45jeL3LyyaWgEMpttkEgF4UoFxnZ4
	OD4zQkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnas-0000000G0qN-0PA6;
	Tue, 25 Feb 2025 05:34:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmnap-0000000G0pU-1zg8
	for ath11k@lists.infradead.org;
	Tue, 25 Feb 2025 05:34:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2211cd4463cso104061425ad.2
        for <ath11k@lists.infradead.org>; Mon, 24 Feb 2025 21:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740461695; x=1741066495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=COFBXMHPskIsoIit0YmVND2fstaviJl+t/pdbf0Dt6Q=;
        b=p2GozwPnVzcxWq1rZZ75WSjlhBl1hCKYXY9e7L32bDCqfykvdNlZN7WxVcVqZRNEZP
         OXfaI9zVsZQ9M4/cxQB1U0B1NMcSsjl7aDEvVXK85gnj53ZbKBHJfeV3wu/lTZ6l2YBH
         dhV6lwH/fkS2Tx7CAlGUd96s3/4i+8WX9b8AszQkSJg+XmiDpXRclcD7t6lTRXfkbTkR
         rAX+TnHUNCITEP2MdciqB8XNFrO0YkFmaAUZes9qKrcjRVTBVj+ttmcg6a7dxGZtfEec
         +BOngwAg9wQxkfNolg5Q7y72vlHuxMIPCCQNTS27hhcQJKwZf/ah/GD/9BW+j5akLmzG
         iL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740461695; x=1741066495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COFBXMHPskIsoIit0YmVND2fstaviJl+t/pdbf0Dt6Q=;
        b=XEodgw9llIRPmiFc6hxni/q3m/oACuDTNtUYZKRGIK3zBI22saqmB7Gq8VA8mZciKN
         wC141Ox3OXVU95YrBR6mcyJ13/jL5o0KTgffSdBlaWuIzs+KIGG2F6t2fm7qd0tAuVKQ
         qlZ3LEmudW74FCwGtme5Q6crRtJX4Bp1KiyQlDHu9dCCWW01MNTjbAMA0Oj9ic234yNc
         L7QhdId3ceL5Ic4Dj7X47Xq/hhrFXMq/GcoUcxEmAhqJhK0zJGnpS1bPIfRu1L5IAxuh
         qshUT0dfV+usxALHtju0xVX38XyPO4wO4Kf2QhSbO7bVi4Fy5SI5vvMlfybduHdH7Jvn
         1nIA==
X-Forwarded-Encrypted: i=1; AJvYcCXe0F05BBy3ZCOpBL+cBT7q7RBhv5IQbB1UWmm9Eg8FclGmyUgN1mqs2T+tBy3mmOxMU8zsf/0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkf7tLSw8xQF4Kk9xN9q8D5LLLujgffgCZa89UI85dx5i+ObET
	hoWKyziPPZ8hiRdAgIZZEcsNwSv5CPrEGFDRsNcN0i5NT8Rkt/joYkPK9gGt0A==
X-Gm-Gg: ASbGnctIcImroq+4UonteDO06gdkCsoVGcNPWbldw9onOpR4P0XCazuakQ4TZ9slcF7
	vDt1DhVJaleYb/3zQhetd6Ttubnhp09WTtkjOBG40hFrECtmDS6L8Hu0MsTOnwAGwS/tac/+yzs
	to9McbjyfdV6Xy93cOYyRULwEzssRz/XUXfbITek7iggwOhwFW8Mnh68vEVW3ss8+EiitM8xqUu
	OQCbBU0HKxp7HNGEvWc7/GbOMBpDF0pMi/8OMrL9ODur/ADO5EwTnV6fS1FJNA7e7QvD+WF7Vrr
	5otWf0TWYdQDennB2bEwTCXsYFt9AmSit6+LsTrropAOM5fsaHq3Yw==
X-Google-Smtp-Source: AGHT+IEcKJ/dXx95j55XEtJ2Yr2v+/ULOkI6H8gKJVMhyZk/j4JRz3SW0id9uRnQMpLfQLa1g1/udg==
X-Received: by 2002:a05:6a00:228c:b0:730:8ad5:90c1 with SMTP id d2e1a72fcca58-73479101286mr3756467b3a.14.1740461694618;
        Mon, 24 Feb 2025 21:34:54 -0800 (PST)
Received: from localhost.localdomain ([36.255.17.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9af3sm582101b3a.110.2025.02.24.21.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 21:34:54 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/3] wifi: ath11k/ath12k: IRQ affinity fixes
Date: Tue, 25 Feb 2025 11:04:44 +0530
Message-Id: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_213455_525109_EE746782 
X-CRM114-Status: GOOD (  10.16  )
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

Hi,

This series fixes a warning from kernel IRQ core that gets triggered in the
error path of QCA6390 probe. While fixing that I also noticed the same issue in
the ath12k driver, so added an untested patch for the same.

Finally, updated the irq_set_affinity_hint() API in both drivers as it was
deprecated.

- Mani

Changes in v2:

- Instead of moving the affinity setting, cleared the affinity hint in the error
  path before freeing the IRQs
- Rebased on top of v6.14-rc1

Manivannan Sadhasivam (3):
  wifi: ath11k: Clear affinity hint before calling
    ath11k_pcic_free_irq() in error path
  wifi: ath12k: Clear affinity hint before calling ath12k_pci_free_irq()
    in error path
  wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with
    irq_set_affinity_and_hint()

 drivers/net/wireless/ath/ath11k/pci.c | 4 +++-
 drivers/net/wireless/ath/ath12k/pci.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.25.1


