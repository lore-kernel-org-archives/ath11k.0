Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D94C433C1
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:03:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B600161998
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B600161998
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FKYp/XUdtRLhKBGjQ6dOdC/uvPlah91UrObCGotLQec=; b=A0nmzhr6ztTh9cf/btrdm8iuP
	UWCjyPl9505dMZ5g9Rfmy6BZhMXSGUCvAyhkcmKygfO7Y2NLm73O5SzvinC2yRrbmMjx+bsIv31xT
	FXEH7wYE/SmvY/yJDAlpjTfe2E/No3hHN7KzbXAwM5g+Al0Sa05f1dH1s1uKQKFmwrWxwlQA8VId7
	MQlb9bhruBcVwFa2RcxsEYv5AdrKveLFfBoPjWEGLJBJWsR5yHSyGDwBich81ZICcw3IYvbs3Wxd1
	ypmuDhALFqo0E70SoZWVcybaXOUAlZK2pByYo/DjGsRm3BqgIWEWIiZfs0dz7pdJNgC7yuPAEKf/g
	x5CngoJfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON1t-00BxFG-18; Mon, 22 Mar 2021 16:03:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON1o-00BxDU-BY; Mon, 22 Mar 2021 16:03:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA0F66199E;
 Mon, 22 Mar 2021 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429019;
 bh=by6x6Rsrr+/5kT7BQ0fn/CIy488q3HO6uAtxXzMMlIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O6Jy+HmUTikJ1x1bJ304Vrp1sBfWbLm1PtId9ZJsKafzCLMEYQU//L/uQ5NyHGzrh
 RhBcv0KcZohevaQjWtq/m2PyDxHXZ6oO/xPHdEAeZN27qebnzt5Wg4fhtjqGJK48VY
 UL94XPmfJWp5a2JWF1yBFnnQqkdteTxWc08FTIpJX/wa6/CiiShyqAZe7XpjIeOmzt
 cO/lp91PJ7K5iDRKpXJ1LzXMgwxLeTNc1hWrW+Oj2cHQ8M1FuYfEUnJHvIMPGvZ3nY
 pOppyp2fEDOWTHfMFCcVXI+sMo5gidr9nyHaAyqJ/Nlnh1nTbp/etdZKIJcUsxQAJ9
 FpT/4xvv9xvFg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Ning Sun <ning.sun@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 linux-arm-kernel@lists.infradead.org, tboot-devel@lists.sourceforge.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Will Deacon <will@kernel.org>
Subject: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
Date: Mon, 22 Mar 2021 17:02:40 +0100
Message-Id: <20210322160253.4032422-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160341_142389_C4A14858 
X-CRM114-Status: GOOD (  15.89  )
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

gcc-11 warns about using string operations on pointers that are
defined at compile time as offsets from a NULL pointer. Unfortunately
that also happens on the result of fix_to_virt(), which is a
compile-time constant for a constantn input:

arch/x86/kernel/tboot.c: In function 'tboot_probe':
arch/x86/kernel/tboot.c:70:13: error: '__builtin_memcmp_eq' specified bound 16 exceeds source size 0 [-Werror=stringop-overread]
   70 |         if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I hope this can get addressed in gcc-11 before the release.

As a workaround, split up the tboot_probe() function in two halves
to separate the pointer generation from the usage. This is a bit
ugly, and hopefully gcc understands that the code is actually correct
before it learns to peek into the noinline function.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/kernel/tboot.c | 44 ++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
index 4c09ba110204..f9af561c3cd4 100644
--- a/arch/x86/kernel/tboot.c
+++ b/arch/x86/kernel/tboot.c
@@ -49,6 +49,30 @@ bool tboot_enabled(void)
 	return tboot != NULL;
 }
 
+/* noinline to prevent gcc from warning about dereferencing constant fixaddr */
+static noinline __init bool check_tboot_version(void)
+{
+	if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
+		pr_warn("tboot at 0x%llx is invalid\n", boot_params.tboot_addr);
+		return false;
+	}
+
+	if (tboot->version < 5) {
+		pr_warn("tboot version is invalid: %u\n", tboot->version);
+		return false;
+	}
+
+	pr_info("found shared page at phys addr 0x%llx:\n",
+		boot_params.tboot_addr);
+	pr_debug("version: %d\n", tboot->version);
+	pr_debug("log_addr: 0x%08x\n", tboot->log_addr);
+	pr_debug("shutdown_entry: 0x%x\n", tboot->shutdown_entry);
+	pr_debug("tboot_base: 0x%08x\n", tboot->tboot_base);
+	pr_debug("tboot_size: 0x%x\n", tboot->tboot_size);
+
+	return true;
+}
+
 void __init tboot_probe(void)
 {
 	/* Look for valid page-aligned address for shared page. */
@@ -66,25 +90,9 @@ void __init tboot_probe(void)
 
 	/* Map and check for tboot UUID. */
 	set_fixmap(FIX_TBOOT_BASE, boot_params.tboot_addr);
-	tboot = (struct tboot *)fix_to_virt(FIX_TBOOT_BASE);
-	if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
-		pr_warn("tboot at 0x%llx is invalid\n", boot_params.tboot_addr);
+	tboot = (void *)fix_to_virt(FIX_TBOOT_BASE);
+	if (!check_tboot_version())
 		tboot = NULL;
-		return;
-	}
-	if (tboot->version < 5) {
-		pr_warn("tboot version is invalid: %u\n", tboot->version);
-		tboot = NULL;
-		return;
-	}
-
-	pr_info("found shared page at phys addr 0x%llx:\n",
-		boot_params.tboot_addr);
-	pr_debug("version: %d\n", tboot->version);
-	pr_debug("log_addr: 0x%08x\n", tboot->log_addr);
-	pr_debug("shutdown_entry: 0x%x\n", tboot->shutdown_entry);
-	pr_debug("tboot_base: 0x%08x\n", tboot->tboot_base);
-	pr_debug("tboot_size: 0x%x\n", tboot->tboot_size);
 }
 
 static pgd_t *tboot_pg_dir;
-- 
2.29.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
