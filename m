Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,BOGUS_MIME_VERSION,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3C7C433C1
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:03:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF776199E
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBF776199E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LPnUtXlHkJhVu/7WAUkW83E4WfWeNLRU/Fh9ISIyjZE=; b=qMMvmauxr9ew0g7hag8FrXvn6+
	X5DyzAFt39xTMz2WyeAyPpx9chQKyeu7mcM7dc6rG/KUfDn+v36pDrEdgR2dZbxmPbAO/Y9+Ej485
	kk72X6FPRKC4gTgQODYTm/i81yE9df7Vx+zX3if/9GCP9F/AW/5jOlidYv3+iquR/Kh7p9dv1G0PY
	04K/9/noJlDTZEyc6hQ9kVrmmX441tl413zXU8xtF8HgMrupRdmDe4qARWZXxicS75KwjBTxe6/dr
	3mzwZpPm3YZ/nBFcBSyeI04bkTAy2TKnaHm+AXmv/DYvLMOTHLNbYiHF2X0SOBnl+Twj6+n75DVEG
	BXP1XHbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON1K-00Bx7U-2L; Mon, 22 Mar 2021 16:03:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON1D-00Bx5j-UB; Mon, 22 Mar 2021 16:03:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B49F619A1;
 Mon, 22 Mar 2021 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616428980;
 bh=443r2a53XZrLPy3VFDNzKFCONnuuJaVZhGXWFTRxMGo=;
 h=From:To:Cc:Subject:Date:From;
 b=Wm1CETPpBfKZZ3lkNCemLWeIZGtbFVmw4nKK+xzlHh6SjshNPJfKJvKmWNXvf1K/F
 5o2Ww58tt6oERHDBipAS4BwOz2CJOvMh/uBNklODZ0dsfVzZt5cj7OrnLB7U+iYnI+
 V9LYQbKfb8Z/fsl+P+r2cUIk2R08rZtGx280ke6EJyn8vt+7YkwV0naEM1o/sQwiUN
 Si9atqBgkFPNOL0NiRMLIEOjWWQ3UF2GIm92tB+iawDYiaDCLVZNub5gpWn3V4pP25
 Ov3hZNHbzywOnT474a9kxX7y+Z8vSF7APRLbZu9IopXbelGoOeiLfQvjhYZz099ogD
 8vEYHTLGBXuSg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	Martin Sebor <msebor@gcc.gnu.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Ning Sun <ning.sun@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 linux-arm-kernel@lists.infradead.org, tboot-devel@lists.sourceforge.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH 00/11] treewide: address gcc-11 -Wstringop-overread warnings
Date: Mon, 22 Mar 2021 17:02:38 +0100
Message-Id: <20210322160253.4032422-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160304_591298_DD8E2EBA 
X-CRM114-Status: GOOD (  10.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

The coming gcc release introduces a new warning for string operations
reading beyond the end of a fixed-length object. After testing
randconfig kernels for a while, think I have patches for any such
warnings that came up on x86, arm and arm64.

Most of these warnings are false-positive ones, either gcc warning
about something that is entirely correct, or about something that
looks suspicious but turns out to be correct after all.

The two patches for the i915 driver look like something that might
be actual bugs, but I am not sure about those either.

We probably want some combination of workaround like the ones I
post here and changes to gcc to have fewer false positives in the
release. I'm posting the entire set of workaround that give me
a cleanly building kernel for reference here.

        Arnd

Arnd Bergmann (11):
  x86: compressed: avoid gcc-11 -Wstringop-overread warning
  x86: tboot: avoid Wstringop-overread-warning
  security: commoncap: fix -Wstringop-overread warning
  ath11: Wstringop-overread warning
  qnx: avoid -Wstringop-overread warning
  cgroup: fix -Wzero-length-bounds warnings
  ARM: sharpsl_param: work around -Wstringop-overread warning
  atmel: avoid gcc -Wstringop-overflow warning
  scsi: lpfc: fix gcc -Wstringop-overread warning
  drm/i915: avoid stringop-overread warning on pri_latency
  [RFC] drm/i915/dp: fix array overflow warning

 arch/arm/common/sharpsl_param.c         |  4 ++-
 arch/x86/boot/compressed/misc.c         |  2 --
 arch/x86/kernel/tboot.c                 | 44 +++++++++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c |  2 +-
 drivers/gpu/drm/i915/i915_drv.h         |  6 ++--
 drivers/net/wireless/ath/ath11k/mac.c   |  2 +-
 drivers/net/wireless/atmel/atmel.c      | 25 ++++++++------
 drivers/scsi/lpfc/lpfc_attr.c           |  6 ++--
 fs/qnx4/dir.c                           | 11 +++----
 kernel/cgroup/cgroup.c                  | 15 +++++++--
 security/commoncap.c                    |  2 +-
 11 files changed, 69 insertions(+), 50 deletions(-)

Cc: x86@kernel.org
Cc: Ning Sun <ning.sun@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: Simon Kelley <simon@thekelleys.org.uk>
Cc: James Smart <james.smart@broadcom.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: Anders Larsen <al@alarsen.net>
Cc: Tejun Heo <tj@kernel.org>
Cc: Serge Hallyn <serge@hallyn.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: tboot-devel@lists.sourceforge.net
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: cgroups@vger.kernel.org
Cc: linux-security-module@vger.kernel.org


-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
