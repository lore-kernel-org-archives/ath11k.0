Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3346AC433E1
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:07:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC49619B6
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFC49619B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OMqoDMMJquWJEyXGPly3iB6ESTLBOnbbsGV1rFFpJzw=; b=ZrK7ncka2feGeMTfJjFcY8ckR
	4xbBjXWavMNIbhYkmewXFytETNNSkY2/+pu49q1Ve8GnlsMvsjq3c9iVRHvzc7jBdUAjj4lirsfrs
	y98yJ77LWoDb50yJD6FnQVJnnImvZH3Ul7DwigFfQrznIaMvF+PsR02pkSEXmw3ScSe5Hv3CGtiHc
	c20QLHK6iaLAw5pEsT4UDXCO5FtmI7I2u+gJBhxVEF5zEcGkR5jPE7xiaG8s5b9JgkuZ5JlwVPVHa
	F9y52hLq8czomaLMtnyOUWgcZk1MPTEHhw8YsyhJUkAeAr90p7MAht+AQc8tBmbNZBcIE9yKLVD6S
	hskl4ToJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON5E-00ByaE-Kx; Mon, 22 Mar 2021 16:07:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON3o-00Bxyl-I9; Mon, 22 Mar 2021 16:05:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49D21619CF;
 Mon, 22 Mar 2021 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429143;
 bh=ppc9fZupOrjA6hpvzPGCige1HMZi82rKq0OzuPiwp30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KfNQhB8I6TCilI9rWZIUvrD60VxxXK7zzzf2CzYQVcPCX4dTFC+5vrq57/HXue9eN
 7bPBi+K09Uuo8FgLHJN5cLADDDnPtd+D6sEhJhO/VLvKBoLaRa1BESfKHtMpZuvnwh
 D3Vc4uZU9Dcg74j9eeiZa4qkcbeOz2ZvcezhMcicUmJ4FzCGExiFKR4ER32CvaOaWV
 akMTcdJNfGrFGH5JvGZ7qns0oNxpRTzGH0qZ76EqyoQfhjLJvxqyHurET1PBvf6svb
 dBMESSwDo3iJsmPDGBQ1mVtfw03/ahNqDciEznfWOfvZZJNzU8YYxi4I1doMFPdTRo
 oo8eGNoKcMUqQ==
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
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Animesh Manna <animesh.manna@intel.com>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 11/11] [RFC] drm/i915/dp: fix array overflow warning
Date: Mon, 22 Mar 2021 17:02:49 +0100
Message-Id: <20210322160253.4032422-12-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160545_302305_48D0A692 
X-CRM114-Status: GOOD (  14.33  )
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

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSB3YXJucyB0aGF0IGlu
dGVsX2RwX2NoZWNrX21zdF9zdGF0dXMoKSBoYXMgYSBsb2NhbCBhcnJheSBvZgpmb3VydGVlbiBi
eXRlcyBhbmQgcGFzc2VzIHRoZSBsYXN0IGZvdXIgYnl0ZXMgaW50byBhIGZ1bmN0aW9uIHRoYXQK
ZXhwZWN0cyBhIHNpeC1ieXRlIGFycmF5OgoKZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcC5jOiBJbiBmdW5jdGlvbiDigJhpbnRlbF9kcF9jaGVja19tc3Rfc3RhdHVz4oCZOgpk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmM6NDU1NjoyMjogZXJyb3I6IOKA
mGRybV9kcF9jaGFubmVsX2VxX29r4oCZIHJlYWRpbmcgNiBieXRlcyBmcm9tIGEgcmVnaW9uIG9m
IHNpemUgNCBbLVdlcnJvcj1zdHJpbmdvcC1vdmVycmVhZF0KIDQ1NTYgfCAgICAgICAgICAgICAg
ICAgICAgICFkcm1fZHBfY2hhbm5lbF9lcV9vaygmZXNpWzEwXSwgaW50ZWxfZHAtPmxhbmVfY291
bnQpKSB7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwLmM6NDU1NjoyMjogbm90ZTogcmVmZXJlbmNpbmcgYXJndW1lbnQgMSBvZiB0
eXBlIOKAmGNvbnN0IHU4ICrigJkge2FrYSDigJhjb25zdCB1bnNpZ25lZCBjaGFyICrigJl9Cklu
IGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmM6Mzg6CmluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaDoxNDU5OjY6IG5vdGU6IGluIGEgY2Fs
bCB0byBmdW5jdGlvbiDigJhkcm1fZHBfY2hhbm5lbF9lcV9va+KAmQogMTQ1OSB8IGJvb2wgZHJt
X2RwX2NoYW5uZWxfZXFfb2soY29uc3QgdTggbGlua19zdGF0dXNbRFBfTElOS19TVEFUVVNfU0la
RV0sCiAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fgoKQ2xlYXJseSBzb21ldGhpbmcg
aXMgd3JvbmcgaGVyZSwgYnV0IEkgY2FuJ3QgcXVpdGUgZmlndXJlIG91dCB3aGF0LgpDaGFuZ2lu
ZyB0aGUgYXJyYXkgc2l6ZSB0byAxNiBieXRlcyBhdm9pZHMgdGhlIHdhcm5pbmcsIGJ1dCBpcwpw
cm9iYWJseSB0aGUgd3Jvbmcgc29sdXRpb24gaGVyZS4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCmluZGV4IDhjMTJk
NTM3NTYwNy4uODMwZTI1MTVmMTE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcC5jCkBAIC02NSw3ICs2NSw3IEBACiAjaW5jbHVkZSAiaW50ZWxfdmRzYy5oIgogI2luY2x1
ZGUgImludGVsX3Zyci5oIgogCi0jZGVmaW5lIERQX0RQUlhfRVNJX0xFTiAxNAorI2RlZmluZSBE
UF9EUFJYX0VTSV9MRU4gMTYKIAogLyogRFAgRFNDIHRocm91Z2hwdXQgdmFsdWVzIHVzZWQgZm9y
IHNsaWNlIGNvdW50IGNhbGN1bGF0aW9ucyBLUGl4ZWxzL3MgKi8KICNkZWZpbmUgRFBfRFNDX1BF
QUtfUElYRUxfUkFURQkJCTI3MjAwMDAKLS0gCjIuMjkuMgoKCi0tIAphdGgxMWsgbWFpbGluZyBs
aXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
