Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD64C433E0
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:03:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52C33619B9
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52C33619B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BOI93R9hHOghB2crlMPEJuDJYYYxwKT1EahG6jdLtbc=; b=rGsJ3iuoIzK0SZFekpaCPUkuL
	+KMM0gTQanKztyenLytpi56z15L5ts3/kyhHtxggriGwi9WugibSQkUy9VxmjPOgp7MfXlDrGpPCi
	LCQjqK55xQHaEw2BXPnydLWzBg6rausjjtgkYuFjkK4BKaVsoDJY4T/LHYN4aBD9SGz7j4mcuMiN7
	9/GvqI/8Lm18nrTjkqLZ3FzL9GPK0PVKQrDxJBPzHGgnfQ5Vm/F3hDLuL6v3kWr5BkZ0XjvQq694Z
	5g4QATEo0fts4BdXP3iYaYNu2zel+pux/n1obUS58bLiIcpaVj6JrxqIz6KxJTf7H3/nCCGOB4lm3
	q6bgi0A+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON1e-00BxBX-I6; Mon, 22 Mar 2021 16:03:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON1W-00Bx9K-2V; Mon, 22 Mar 2021 16:03:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5EBC61992;
 Mon, 22 Mar 2021 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429000;
 bh=3vH1tW/3dz/29rKeu66QIybhctPu7u2aaTt+yHw+ixQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VRbsfgY+z8kWvWs+txugnu/XzSTF1os4UBObTbMaVvuShG2tPdw5ChRNTsdoitI1c
 Os5gXEmTV19Hh0dH4sglqm/fSEpSE1o+cdD5mtmVZ292EJ017mpHo8q2zl1C63RDvy
 9IP52tHZwWSskub+gnvqqJxnuA90avLg12n2yst/hTpywQNyH7pGS5SlpLOCg1l1zv
 SC2S1tGwIlfSqI7YXPTsk7il0mAFtLumFo7AO2H+payHYwT3xe1jEFpNJbjQ5KEMrV
 fL6MEJv6J7008Lwon/8167XZUtB/IGdDaiFW7a3KldjWew3Xisi5j0MtsrpiR6liOq
 jy3MXhpKCZK+w==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Ning Sun <ning.sun@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
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
 "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>
Subject: [PATCH 01/11] x86: compressed: avoid gcc-11 -Wstringop-overread
 warning
Date: Mon, 22 Mar 2021 17:02:39 +0100
Message-Id: <20210322160253.4032422-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160322_412487_27B16585 
X-CRM114-Status: GOOD (  13.58  )
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

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYyBnZXRzIGNvbmZ1c2VkIGJ5
IHRoZSBjb21wYXJpc29uIG9mIGEgcG9pbnRlciB0byBhbiBpbnRlZ2VyIGxpc3RlcmFsLAp3aXRo
IHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhpcyBpcyBhbiBvZmZzZXQgZnJvbSBhIE5VTEwgcG9pbnRl
ciBhbmQgdGhhdApkZXJlZmVyZW5jaW5nIGl0IGlzIGludmFsaWQ6CgpJbiBmaWxlIGluY2x1ZGVk
IGZyb20gYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL21pc2MuYzoxODoKSW4gZnVuY3Rpb24g4oCY
cGFyc2VfZWxm4oCZLAogICAgaW5saW5lZCBmcm9tIOKAmGV4dHJhY3Rfa2VybmVs4oCZIGF0IGFy
Y2gveDg2L2Jvb3QvY29tcHJlc3NlZC9taXNjLmM6NDQyOjI6CmFyY2gveDg2L2Jvb3QvY29tcHJl
c3NlZC8uLi9zdHJpbmcuaDoxNToyMzogZXJyb3I6IOKAmF9fYnVpbHRpbl9tZW1jcHnigJkgcmVh
ZGluZyA2NCBieXRlcyBmcm9tIGEgcmVnaW9uIG9mIHNpemUgMCBbLVdlcnJvcj1zdHJpbmdvcC1v
dmVycmVhZF0KICAgMTUgfCAjZGVmaW5lIG1lbWNweShkLHMsbCkgX19idWlsdGluX21lbWNweShk
LHMsbCkKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL21pc2MuYzoyODM6OTogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvIOKAmG1lbWNweeKAmQogIDI4MyB8ICAgICAgICAgbWVtY3B5KCZlaGRyLCBv
dXRwdXQsIHNpemVvZihlaGRyKSk7CiAgICAgIHwgICAgICAgICBefn5+fn4KCkkgY291bGQgbm90
IGZpbmQgYW55IGdvb2Qgd29ya2Fyb3VuZCBmb3IgdGhpcywgYnV0IGFzIHRoaXMgaXMgb25seQph
IHdhcm5pbmcgZm9yIGEgZmFpbHVyZSBkdXJpbmcgZWFybHkgYm9vdCwgcmVtb3ZpbmcgdGhlIGxp
bmUgZW50aXJlbHkKd29ya3MgYXJvdW5kIHRoZSB3YXJuaW5nLgoKVGhpcyBzaG91bGQgcHJvYmFi
bHkgZ2V0IGFkZHJlc3NlZCBpbiBnY2MgaW5zdGVhZCwgYmVmb3JlIDExLjEgZ2V0cwpyZWxlYXNl
ZC4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogYXJj
aC94ODYvYm9vdC9jb21wcmVzc2VkL21pc2MuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9taXNjLmMg
Yi9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvbWlzYy5jCmluZGV4IDNhMjE0Y2MzMjM5Zi4uOWFk
YTY0ZTY2Y2I3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvbWlzYy5jCisr
KyBiL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9taXNjLmMKQEAgLTQzMCw4ICs0MzAsNiBAQCBh
c21saW5rYWdlIF9fdmlzaWJsZSB2b2lkICpleHRyYWN0X2tlcm5lbCh2b2lkICpybW9kZSwgbWVt
cHRyIGhlYXAsCiAJCWVycm9yKCJEZXN0aW5hdGlvbiBhZGRyZXNzIHRvbyBsYXJnZSIpOwogI2Vu
ZGlmCiAjaWZuZGVmIENPTkZJR19SRUxPQ0FUQUJMRQotCWlmICgodW5zaWduZWQgbG9uZylvdXRw
dXQgIT0gTE9BRF9QSFlTSUNBTF9BRERSKQotCQllcnJvcigiRGVzdGluYXRpb24gYWRkcmVzcyBk
b2VzIG5vdCBtYXRjaCBMT0FEX1BIWVNJQ0FMX0FERFIiKTsKIAlpZiAodmlydF9hZGRyICE9IExP
QURfUEhZU0lDQUxfQUREUikKIAkJZXJyb3IoIkRlc3RpbmF0aW9uIHZpcnR1YWwgYWRkcmVzcyBj
aGFuZ2VkIHdoZW4gbm90IHJlbG9jYXRhYmxlIik7CiAjZW5kaWYKLS0gCjIuMjkuMgoKCi0tIAph
dGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
