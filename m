Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC1CC433C1
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:05:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22397619B4
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22397619B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RyBYc9pfSz2GTsJxAYs162zwWh0zb2VQge+FQiwUKiM=; b=dprWthM2/dG/QnipU8oqOG5sa
	JUopOE2HnJmhvof5XDvDYL3aq/yK7X9anqXxkgePY731vfb/rn4c+nPvPKFz5COCjsXYzW32IM93P
	vRzsm+YSg0gc6gzcyTwDsdok+gR1xhkT6mVFeTgcF6PjUtIkiRl/YGLuRe5eb3Nuldh3+Pe/iCQPF
	ScqokOGB6Us1TySfpmI4tDlAPUMGc7sNIUCBC4hP/VuhISI4fc6NEBEGFN7ldTYiNSQiIMx69oMup
	6367ezbgMTRBVWtTcJAkHIb8LAM3niG0xNGJjNRpyWZKd17JXcEVvdkCvFrbT/+tXgosXEYjmNRJN
	DgVfCldFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON3Q-00Bxp6-6M; Mon, 22 Mar 2021 16:05:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON31-00Bxf2-DA; Mon, 22 Mar 2021 16:04:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1F12619AA;
 Mon, 22 Mar 2021 16:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429094;
 bh=xAtyylaIqASvvaS85ZKuu0hXHauLkQxCojv0RLX/Mb4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qF3TQ/qAB99dHQJQ17LkEWSGHzxXaa6ah0V394Zl3kvv8RzfyZLGR5LrTvWyC7H1A
 Y/FGboTYdhxs+1JdIoA84vXMKDdcAhTrEkBBb0UQUQKweCwvIzhlEQaLj3V5+EtINN
 TkIcf5XVjUiGPrExh51GxNaO8HstdwbBZt6yPypCRTLZ7dgkDLCsQKmQNcTUMokkXV
 S8QQatAQDJMuuHsGK0sG76w09rCi8u76J/NCDygW1XdPiFPESnsqpJ4LRffqASyFiK
 CjWew/HiP9HZ5pWACV/kafDp0YkSlO5krvl5NtQtLs6m/hkRHKNSKqc2U8LuhcidQu
 4FzJ0OAQMgZGg==
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
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>
Subject: [PATCH 07/11] ARM: sharpsl_param: work around -Wstringop-overread
 warning
Date: Mon, 22 Mar 2021 17:02:45 +0100
Message-Id: <20210322160253.4032422-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160455_641070_04C243A5 
X-CRM114-Status: GOOD (  12.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYyB3YXJucyB0aGF0IGFjY2Vz
c2luZyBhIHBvaW50ZXIgYmFzZWQgb24gYSBudW1lcmljIGNvbnN0YW50IG1heQpiZSBhbiBvZmZz
ZXQgaW50byBhIE5VTEwgcG9pbnRlciwgYW5kIHdvdWxkIHRoZXJlZm9yZSBoYXMgemVybwphY2Nl
c3NpYmxlIGJ5dGVzOgoKYXJjaC9hcm0vY29tbW9uL3NoYXJwc2xfcGFyYW0uYzogSW4gZnVuY3Rp
b24g4oCYc2hhcnBzbF9zYXZlX3BhcmFt4oCZOgphcmNoL2FybS9jb21tb24vc2hhcnBzbF9wYXJh
bS5jOjQzOjk6IGVycm9yOiDigJhtZW1jcHnigJkgcmVhZGluZyA2NCBieXRlcyBmcm9tIGEgcmVn
aW9uIG9mIHNpemUgMCBbLVdlcnJvcj1zdHJpbmdvcC1vdmVycmVhZF0KICAgNDMgfCAgICAgICAg
IG1lbWNweSgmc2hhcnBzbF9wYXJhbSwgcGFyYW1fc3RhcnQoUEFSQU1fQkFTRSksIHNpemVvZihz
dHJ1Y3Qgc2hhcnBzbF9wYXJhbV9pbmZvKSk7CiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+CgpJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIHdhcm5pbmcgaXMgYm9n
dXMgc2luY2UgdGhpcyBpcyB0aGUgYWN0dWFsCnBvaW50ZXIsIG5vdCBhbiBvZmZzZXQgb24gYSBO
VUxMIHBvaW50ZXIuIEFkZCBhIGxvY2FsIHZhcmlhYmxlIHRvIHNodXQKdXAgdGhlIHdhcm5pbmcg
YW5kIGhvcGUgaXQgZG9lc24ndCBjb21lIGJhY2suCgpMaW5rOiBodHRwczovL2djYy5nbnUub3Jn
L2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD05OTU3OApTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGFyY2gvYXJtL2NvbW1vbi9zaGFycHNsX3BhcmFtLmMg
fCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb21tb24vc2hhcnBzbF9wYXJhbS5jIGIvYXJjaC9hcm0v
Y29tbW9uL3NoYXJwc2xfcGFyYW0uYwppbmRleCBlZmViNTcyNGQ5ZTkuLjYyMzdlZGUyZjBjNyAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vY29tbW9uL3NoYXJwc2xfcGFyYW0uYworKysgYi9hcmNoL2Fy
bS9jb21tb24vc2hhcnBzbF9wYXJhbS5jCkBAIC00MCw3ICs0MCw5IEBAIEVYUE9SVF9TWU1CT0wo
c2hhcnBzbF9wYXJhbSk7CiAKIHZvaWQgc2hhcnBzbF9zYXZlX3BhcmFtKHZvaWQpCiB7Ci0JbWVt
Y3B5KCZzaGFycHNsX3BhcmFtLCBwYXJhbV9zdGFydChQQVJBTV9CQVNFKSwgc2l6ZW9mKHN0cnVj
dCBzaGFycHNsX3BhcmFtX2luZm8pKTsKKwlzdHJ1Y3Qgc2hhcnBzbF9wYXJhbV9pbmZvICpwYXJh
bXMgPSBwYXJhbV9zdGFydChQQVJBTV9CQVNFKTsKKworCW1lbWNweSgmc2hhcnBzbF9wYXJhbSwg
cGFyYW1zLCBzaXplb2YoKnBhcmFtcykpOwogCiAJaWYgKHNoYXJwc2xfcGFyYW0uY29tYWRqX2tl
eXdvcmQgIT0gQ09NQURKX01BR0lDKQogCQlzaGFycHNsX3BhcmFtLmNvbWFkaj0tMTsKLS0gCjIu
MjkuMgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
