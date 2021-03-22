Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92543C433E0
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:06:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F59619B5
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F59619B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qKsrr1WRKs7tanPlW0OKH+Y1cGk0P18czhW+lN+CEpc=; b=W5k5RfXi2lU7NYdHW8uKa5mqt
	iDHKWf/nBRTznkdT2BFKfUgW/R37pnFdklz8PYawbU56O0MoHLA97+BD4atJTsTGuBG3Ss56EPbpH
	qPrz3dqVDyTwjhe7H828G4yzp6SjgS49t45tTvT4tIg5X6/ht+YYwJLoPsogKVHUjp/Bw2QnO8z2l
	YIXcjvCZEdGerh9fqsZrNDWfiGMbdcrvEq0G9mNTm2Duo03c77MmBUcOEybSTfPlPTifGNWL1cx1Y
	KA4nJuzNsAUAgo4///fB/CrmdFzpNW9FRD8i37t3b205v/bdRMdWZ0F0l3CUGOs1MAeAiD8rKe+0i
	tZ+5fUr5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON4s-00ByQA-BU; Mon, 22 Mar 2021 16:06:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON3b-00Bxtm-Jp; Mon, 22 Mar 2021 16:05:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E526619B3;
 Mon, 22 Mar 2021 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429130;
 bh=Cz6Ib/Jy2MCBRG3RkrW7YxIgzj/6kEv+v4DuuyruVdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YmX1KQkIWDTM9oL9SIaizhQuXBgId2TgjaOHRvpRa8ujB1Hj1aOwCgrCrMNJVi2gq
 P8VgokfOwAmfnYZLX1rsRk4pLvkeDX2bspNuX1VYi25/JXoxXtnn7F2MgFWC0FsAFu
 N+uQuJ3Me21QeU0KrCs4aFbaBIGeJwlctHwPj1pA51MBMY2ra+UvbFh+zl+P+BsSj9
 1ElKemq6Wxa1TUdo/FGf/LywTMYZxZt3573Q+qI3GKdCXVd48krzSZHquQETNI++01
 tCB8r6B7NO2iohCFFlGopnfYJGFYOD5rOpt+nJhCejnPW+cx72ztkTHm7tbHkrEoPf
 S1/KeKBMSo8Ag==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Ning Sun <ning.sun@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 linux-arm-kernel@lists.infradead.org, tboot-devel@lists.sourceforge.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Aditya Swarup <aditya.swarup@intel.com>
Subject: [PATCH 10/11] drm/i915: avoid stringop-overread warning on pri_latency
Date: Mon, 22 Mar 2021 17:02:48 +0100
Message-Id: <20210322160253.4032422-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160533_568125_AE4B4A1C 
X-CRM114-Status: GOOD (  14.99  )
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

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSB3YXJucyBhYm91dCB3
aGF0IGFwcGVhcnMgdG8gYmUgYW4gb3V0LW9mLXJhbmdlIGFycmF5IGFjY2VzczoKCkluIGZ1bmN0
aW9uIOKAmHNuYl93bV9sYXRlbmN5X3F1aXJr4oCZLAogICAgaW5saW5lZCBmcm9tIOKAmGlsa19z
ZXR1cF93bV9sYXRlbmN54oCZIGF0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmM6MzEw
ODozOgpkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9wbS5jOjMwNTc6OTogZXJyb3I6IOKAmGlu
dGVsX3ByaW50X3dtX2xhdGVuY3nigJkgcmVhZGluZyAxNiBieXRlcyBmcm9tIGEgcmVnaW9uIG9m
IHNpemUgMTAgWy1XZXJyb3I9c3RyaW5nb3Atb3ZlcnJlYWRdCiAzMDU3IHwgICAgICAgICBpbnRl
bF9wcmludF93bV9sYXRlbmN5KGRldl9wcml2LCAiUHJpbWFyeSIsIGRldl9wcml2LT53bS5wcmlf
bGF0ZW5jeSk7CiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZHJpdmVycy9ncHUvZHJtL2k5
MTUvaW50ZWxfcG0uYzogSW4gZnVuY3Rpb24g4oCYaWxrX3NldHVwX3dtX2xhdGVuY3nigJk6CmRy
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BtLmM6MzA1Nzo5OiBub3RlOiByZWZlcmVuY2luZyBh
cmd1bWVudCAzIG9mIHR5cGUg4oCYY29uc3QgdTE2ICrigJkge2FrYSDigJhjb25zdCBzaG9ydCB1
bnNpZ25lZCBpbnQgKuKAmX0KZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYzoyOTk0OjEz
OiBub3RlOiBpbiBhIGNhbGwgdG8gZnVuY3Rpb24g4oCYaW50ZWxfcHJpbnRfd21fbGF0ZW5jeeKA
mQogMjk5NCB8IHN0YXRpYyB2b2lkIGludGVsX3ByaW50X3dtX2xhdGVuY3koc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2LAogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KCk15IGd1ZXNzIGlzIHRoYXQgdGhpcyBjb2RlIGlzIGFjdHVhbGx5IHNhZmUgYmVj
YXVzZSB0aGUgc2l6ZSBvZiB0aGUKYXJyYXkgZGVwZW5kcyBvbiB0aGUgaGFyZHdhcmUgZ2VuZXJh
dGlvbiwgYW5kIHRoZSBmdW5jdGlvbiBjaGVja3MgZm9yCnRoYXQsIGJ1dCBhdCB0aGUgc2FtZSB0
aW1lIEkgd291bGQgbm90IGV4cGVjdCB0aGUgY29tcGlsZXIgdG8gd29yayBpdApvdXQgY29ycmVj
dGx5LCBhbmQgdGhlIGNvZGUgc2VlbXMgYSBsaXR0bGUgZnJhZ2lsZSB3aXRoIHJlZ2FyZHMgdG8K
ZnV0dXJlIGNoYW5nZXMuIFNpbXBseSBpbmNyZWFzaW5nIHRoZSBzaXplIG9mIHRoZSBhcnJheSBz
aG91bGQgaGVscC4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCB8IDYgKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X2Rydi5oCmluZGV4IDI2ZDY5ZDA2YWE2ZC4uMzU2NzYwMmUwYTM1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfZHJ2LmgKQEAgLTEwOTUsMTEgKzEwOTUsMTEgQEAgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUg
ewogCQkgKiBpbiAwLjV1cyB1bml0cyBmb3IgV00xKy4KIAkJICovCiAJCS8qIHByaW1hcnkgKi8K
LQkJdTE2IHByaV9sYXRlbmN5WzVdOworCQl1MTYgcHJpX2xhdGVuY3lbOF07CiAJCS8qIHNwcml0
ZSAqLwotCQl1MTYgc3ByX2xhdGVuY3lbNV07CisJCXUxNiBzcHJfbGF0ZW5jeVs4XTsKIAkJLyog
Y3Vyc29yICovCi0JCXUxNiBjdXJfbGF0ZW5jeVs1XTsKKwkJdTE2IGN1cl9sYXRlbmN5WzhdOwog
CQkvKgogCQkgKiBSYXcgd2F0ZXJtYXJrIG1lbW9yeSBsYXRlbmN5IHZhbHVlcwogCQkgKiBmb3Ig
U0tMIGZvciBhbGwgOCBsZXZlbHMKLS0gCjIuMjkuMgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
