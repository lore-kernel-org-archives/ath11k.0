Return-Path: <SRS0=FQv/=HH=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D99C433E0
	for <ath11k@archiver.kernel.org>; Fri,  5 Feb 2021 13:02:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691CA64F38
	for <ath11k@archiver.kernel.org>; Fri,  5 Feb 2021 13:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 691CA64F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XgBvEhHOhOfcwJrL+bFydMTpS7hc+OUe4qQs24/eCQU=; b=n0c9vR3BfQUhHoEUOeGHLXM7YD
	a0LQaUqrW5xxTgqdovfxpLvMK9MCRAh3xEZVw+56iV7UUWPajjaBUSSoajhKpy3Qs9147noMw4fXo
	GgcdxPJTsJNRbbBnqy5aSjERXPrLTrVeko3Mh0UC9hlYzQc2Y7ILzX7pN93f5PxCduC6u4z6pbbzx
	neUqYLHwwgqqpkETtBdo8KCk2kJH/yr0TZeGlljzE4+hywYxg4i4YuSy56f2k/FWQ27Q1RqhyHWKj
	yW8Wd7OkiAg9U6IshAitmY7IVZzXFR+kftlr1JKKTyqDzTIHE1Y1jL7lpJeDP1OA0oTRQy7JdD++H
	LempecAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l80kG-0006Tu-9F; Fri, 05 Feb 2021 13:01:56 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l80kC-0006TK-Pm
 for ath11k@lists.infradead.org; Fri, 05 Feb 2021 13:01:54 +0000
Received: by mail-pg1-x535.google.com with SMTP id t11so807643pgu.8
 for <ath11k@lists.infradead.org>; Fri, 05 Feb 2021 05:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=nGeMDckkLWCC40p3zLt6eORZusUAfTVspeKPwP+7SUY=;
 b=OabTUYnxjQvIIHYtviRH6WllUaGPW3oQ+UBGLnix/ZL/Mn9uMBh/dhF1X+PmMz3UOv
 D65C05oc1MUg6uLv5DUyWl9VP666javRUNId5bRF4gO3b8CPhFe/pZGcfoDrC/66xyD8
 jhIAJsDVnX96j6S5pS98ah5yviHIrbEKBL9a4pjixd0bReTIZXSClPCO3FXElyyznGVY
 6YT0qCn2dLDVFCzi7acKuYDeJxT+/925zkJfrwXYgSSWtDXXmfzaxpohqZhHbeU3hD+y
 EJXa6t8gpLcujGuPWtL1mfVqZJ5ChcsXNqPglnrt0HrxHxRcX22CETEXIUJmLkzLhMew
 SsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=nGeMDckkLWCC40p3zLt6eORZusUAfTVspeKPwP+7SUY=;
 b=ggZ7XWpvVZJRF9QYzeFMTdUtEWpS4ajoiUDktp15Jmiif1BINBvbGOEhHUfYm+L6lW
 3yRomV1X2XUMDBsZ93SzaXThMwuEjAdUY0fQiMPobEOvx+mSzvGJuUmXaBLa+t1Lb7ko
 /hXnC+PFSgNapED3eyhWOmdfFQJ/JbN6keg8Eu1Z9+ZQANIWYlMVuHtftKjPv2bBVCid
 P+aZKV7eoJZtMIWH28ft8Ob3tEB5s6SKv7XeJ1ya4jGVdBmi3Xzst8DWVdsmxspyShym
 rza0ZERKqB1i2UVMEK23tatEGr2hGjVIZiGUbPB/9Ql+1AlEzcKNofzbGeVncUivoGgN
 D+wg==
X-Gm-Message-State: AOAM5328wSdVaj8wp5mUgjNncOtAH77ja7P/EkW7/z0vwO4y9sX6AdzR
 o9hTEy1jbnIvKWTEwX2EA1kv
X-Google-Smtp-Source: ABdhPJw03aj65fZ+DijctHrGCUKSUeSMIEUA0SQ3MTk0eWdo5sybCYHMQ2IbIu2fxS3YfcUGZH5h8A==
X-Received: by 2002:a63:181e:: with SMTP id y30mr4107842pgl.324.1612530109921; 
 Fri, 05 Feb 2021 05:01:49 -0800 (PST)
Received: from thinkpad ([2409:4072:6419:ab3e:3106:54ac:6216:6b24])
 by smtp.gmail.com with ESMTPSA id 124sm9339596pfd.59.2021.02.05.05.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:01:49 -0800 (PST)
Date: Fri, 5 Feb 2021 18:31:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Subject: [GIT PULL] MHI changes for v5.12
Message-ID: <20210205130141.GE3221@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_080153_132054_B41ACC0C 
X-CRM114-Status: GOOD (  16.26  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: loic.poulain@linaro.org, jhugo@codeaurora.org,
 linux-arm-msm@vger.kernel.org, cjhuang@codeaurora.org, bbhatt@codeaurora.org,
 linux-kernel@vger.kernel.org, hemantk@codeaurora.org,
 ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Greg,

Here is the MHI Pull request for the v5.12 cycle. As like last time, I needed to
do PR this time due to the immutable branches with net-next and ath11k-next.

Patch details are in the signed tag, please consider merging!

Thanks,
Mani

---

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v5.12

for you to fetch changes up to 026c5b1ec29cb9904406c7b3090eaf54e345e7f2:

  bus: mhi: pci_generic: Increase num of elements in hw event ring (2021-02-05 17:59:29 +0530)

----------------------------------------------------------------
MHI changes for v5.12

Loic improved the MHI PCI generic controller by adding support for DIAG channel,
PCI error handling, suspend/recovery/resume, and health check. Loic also added
support for resetting the MHI device as per the MHI specification. This includes
writing to a specific register for default cases and looking for controller
specific callback when provided.

Along with this Loic, also added a new API which gets the number for free TREs
(Transfer Ring Elements) from the MHI core. The client drivers can make use of
this API and the current consumer is the "mhi-net" driver. For taking both the
"mhi-net" driver change and the API change, we created "mhi-net-immutable"
branch for this patch and merged the same into net-next and mhi-next.

Carl added a patch which lets the controller driver to pass the custom IRQ
flags for BHI and MHI event interrupts to the MHI core. The current consumer of
this feature is the ath11k MHI controller driver. For taking both the changes,
we created "mhi-ath11k-immutable" branch for this patch and merged into
ath11k-next and mhi-next.

Finally, Loic cleaned up the MHI queue APIs and fixed the shared MSI vector
support.

----------------------------------------------------------------
Carl Huang (1):
      mhi: use irq_flags if controller driver configures it

Hemant Kumar (1):
      bus: mhi: core: Add helper API to return number of free TREs

Loic Poulain (16):
      bus: mhi: core: Add device hardware reset support
      mhi: pci-generic: Increase number of hardware events
      mhi: pci_generic: Enable burst mode for hardware channels
      mhi: pci_generic: Add support for reset
      mhi: pci_generic: Add suspend/resume/recovery procedure
      mhi: pci_generic: Add PCI error handlers
      mhi: pci_generic: Add health-check
      mhi: pci_generic: Increase controller timeout value
      mhi: pci_generic: Add diag channels
      mhi: pci_generic: Set irq moderation value to 1ms for hw channels
      bus: mhi: Ensure correct ring update ordering with memory barrier
      mhi: unconstify mhi_event_config
      mhi: pci_generic: Fix shared MSI vector support
      mhi: core: Factorize mhi queuing
      mhi: pci_generic: Print warning in case of firmware crash
      bus: mhi: pci_generic: Increase num of elements in hw event ring

Manivannan Sadhasivam (2):
      Merge branch 'mhi-ath11k-immutable' into mhi-next
      Merge branch 'mhi-net-immutable' into mhi-next

 drivers/bus/mhi/core/init.c   |   9 ++-
 drivers/bus/mhi/core/main.c   | 194 +++++++++++++++++++++++------------------------------------
 drivers/bus/mhi/pci_generic.c | 381 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 include/linux/mhi.h           |  22 ++++++-
 4 files changed, 461 insertions(+), 145 deletions(-)

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
