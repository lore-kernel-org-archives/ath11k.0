Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACD1CA6015
	for <ath11k@archiver.kernel.org>; Thu,  8 Oct 2026 22:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xRoGZQlYlVAuxRfgdxXpGqhgqrrcnM9oFsa9ZYtBb+A=; b=lHlVRKPYp42N6fnAvEVoxLFT79
	4ZIsS8uXx3QmMolK5uMNh8qjMfVy9NlC4Y1xErrtlamrVMuNwGcLJeh8IPIHTPMjTexmJbUOeMhIm
	id+iXlk7WQv30cbvtdDgXmszs7+yaH4FdnA8W7lOyRyH7U8OVIyaGgYSliX34ltT5aFM+jH6Cbu6r
	AOkwiU4GwAPvrzCadwDU0vhLp8Kwm0A3xQBFKeI1sZyryyod+DIJN7ArlIsi+U2jv7k6wkru/bnbN
	LRvB2VhPpdIlh9v93hfPqVsTMxrZcBZ1LpkFbq4E0r+6LNIFoBLREzL3WipvUv0ZZ9guqEdL4+fwH
	2I7O3R9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEx4z-000000059Ad-0zC8;
	Thu, 08 Oct 2026 22:59:13 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEx4v-0000000599t-3vI2
	for ath11k@lists.infradead.org;
	Thu, 08 Oct 2026 22:59:11 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso564333666b.0
        for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 15:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791500347; x=1792105147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRoGZQlYlVAuxRfgdxXpGqhgqrrcnM9oFsa9ZYtBb+A=;
        b=ObyM/9YMxa2f35PsrRDA/09YUsbMJY1yHzvYHi/xLPG8r5DqpwcnbCAupoaYD+1UT5
         4dFYCPmaGUX9XLVioCic8KDqnRW1GgWliCWk61JgkKKergTn6z7LTCzmB8+LUy2CGcrY
         m1n2HLEf4VZtNSaGZ/x/rVR/gdz7GGf381bMfDfgI4f/cABBykTBAk5nM54SbOs7uYi+
         2T2sWRGn7DgmBIurN1+vLD7IITf1HXJhlp9zunTB7a+bZRseqV5Yz0FQxHUA06EowlEz
         CvRh7PG0XNVHNUZY/frp3kxVbMikmyYp4vxG9fXP2Hkr1KfrdZJCsz3GZZY9F4Ta2LLa
         CSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500348; x=1792105148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRoGZQlYlVAuxRfgdxXpGqhgqrrcnM9oFsa9ZYtBb+A=;
        b=n3N2QP3lLfKbKjxCorxslENAwsdc20dy76141/EaKphZkZBizmY8lDQ2JVfaNTS8G9
         n4VHjlvcpjBiwqQZspur80UnDEny+j/YxMSwQNcnldLY5oQAERDflylqPbZEDoo91f6J
         uUh2nD5xDqfadE01IefHmyxREzexX0bYo3RixegTKNKGNbHod9McxsYshqGcZ7AhrRRj
         fYLl7bgVCKIKJmBsRleNltdWNrBld5jl6RR7pTEW3wIfN5JjSCngPX7gpUaoUECwLQDr
         70S0I74p3CsqFHPJurKCG+xvvH0wJechW4OuG2tZuMlUtf0m/qzHXziQ7BT1oiEXTTcK
         G8Vw==
X-Gm-Message-State: AFuF++mKAS808nx+1VEsU4iZb3RlfgQTGCgd5MczkqUlkfvaUR1IqqzH
	89uux+jK5s9qa/RANv4rD5wwzIyz9Sx2pj145TGr0Iu8gJMNmn2isF4Z
X-Gm-Gg: AYBFou2GDm2RTS3X3svG7kgocdMYA8DIr+b7ZBxCX990yGwTi5H0jjHgjyrtVrf3dXy
	0GBBfSxnWOHDGSJrfF8lwJbNsxkO6S6Y5NdMC1DnDCDtGCbq2uoAIkNjp4gwp9qvCBSIzfCjfr5
	pqdsGn+nGKrKi5e88RTWr8goSnR35mbUlvtIc1+EeuK5OLNiGI84pmH8sDmu6Xu23+hFgEjWv6E
	paHawF//krE36HagvplxvfTszOLoUiLsWpWjXXTxsV27+Ozjgt16L5t9izXJzzzlubAhYvktWq1
	HFWmjPWqpYORF+8BzRbpcAkgBnSRJh7J64+IbQCGksShO9SU7efpRuTdAwdTU9Jj+I1MFyKqr21
	h/YlCIgxAD77BtysFu6ulx/yHwFZpFoynMBqY+HKfsjBdKhBsxTP5DojfVW9yg/8pb+CGxH+i6j
	AXret3r9rRrVsUv9HgiZE+xSQDup2OPFIKNEBbFcwolJmdAB4P0kcAYgZL6cAPcKXMZLBFp3coD
	jK7Lw==
X-Received: by 2002:a17:907:948f:b0:c31:9a1c:de76 with SMTP id a640c23a62f3a-c31a9fd424emr16644266b.14.1791500347484;
        Thu, 08 Oct 2026 15:59:07 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm6993566b.80.2026.10.08.15.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:59:07 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	johannes@sipsolutions.net,
	Nikolay Bryskin <nbryskin@gmail.com>
Subject: [PATCH ath-next 0/2] wifi: ath11k: fix two races between ieee80211_register_hw() and the rest of mac registration
Date: Fri,  9 Oct 2026 01:58:51 +0300
Message-ID: <20261008225853.15399-1-nbryskin@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_155910_018665_32AB5279 
X-CRM114-Status: UNSURE (   8.74  )
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

ath11k does part of its per-radio setup only after
ieee80211_register_hw(), when userspace can already see and use the
wiphy. This series fixes two consequences of that:

1. txmgmt_empty_waitq is initialized after registration. A mgmt TX
   completion arriving before that (e.g. iwd authenticating as soon as
   the wiphy shows up) calls wake_up() on an uninitialized wait queue
   head and panics in softirq context.

2. The regdomain received from the firmware is applied after
   registration, and asynchronously, although the wiphy is
   REGULATORY_WIPHY_SELF_MANAGED. A GET_REG from userspace in that window
   hits the WARN_ON() in nl80211_get_reg_do(), and a connection made
   before the regdomain lands ends up with badly degraded TX once it does.
   This is the driver-side fix Johannes asked for when a patch dropping
   that WARN_ON() was proposed [1].

Both were found on a Dell XPS 13 9310 (QCA6390 hw2.0, WLAN.HST.1.0.1-05266)
with iwd. Patch 2's warning occurred naturally at boot; both failures
were reproduced reliably by inserting an msleep(2000) right after
ieee80211_register_hw(), and tested with and without each fix:

  delay  regd fix  waitq fix  result
  yes    no        no         WARN_ON, then NULL deref panic in __wake_up()
  yes    no        yes        WARN_ON, no panic, TX failing (83% tx failed)
  yes    yes       yes        no warning, no panic, link stable for 6+ min
  no     yes       yes        in daily use, no issues

The patches were developed and tested on v7.2.8 and rebased onto
ath-next without changes (git range-diff shows them identical); on
ath-next they are compile-tested only (W=1, no new warnings).

The same register-then-apply-regd ordering exists in ath12k
(ath12k_mac_hw_register()); I have no ath12k hardware to test a fix
there.

[1] https://lore.kernel.org/all/16aa99921c4e92e8d4da3c84aacbec2e673666aa.camel@sipsolutions.net/

Nikolay Bryskin (2):
  wifi: ath11k: initialize txmgmt_empty_waitq before registering the hw
  wifi: ath11k: apply the initial regdomain before registering the wiphy

 drivers/net/wireless/ath/ath11k/mac.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)


base-commit: 129324b60343dec19d45dcf87736f129b18b95bb
-- 
2.56.0


