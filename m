Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F63C433DB
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:04:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA437619AA
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA437619AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wiTW87BdYOFz81XfEiXnzBkeM1Mh/st+dALruvNlzFE=; b=KQNkTUGoR/ogxEnxfCHvsAWgO
	k7boMexFSVLMET2QdkjxH+Pm93lmU/yvwWSazHAAVrwTjBwNF6jTOe1XUcgeL888dje4/vf32Dp+O
	BiNGkFPl8WDdvMuLpnhJ2hTeLHlRyovcQ/QPvRmVTwAW0IZ28Qi58USLgVNd52Nfvwv9RQynfNBAD
	b6IHP8cFzPhp7kAB1AxeeO5ebN0aeVe9z62+MT/t3SZk4jS1ETZPI/1wEo6jAuJUYVNcGoAY0KA7q
	UKXBfigBCVdphfRw57fXBRtOJMscdE2Dacym2McdTYsE5/vr47fc1sjhaiLWHKt7RGBPb+axRK115
	/goT+th4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON2D-00BxJo-Hb; Mon, 22 Mar 2021 16:04:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON25-00BxHu-Rk; Mon, 22 Mar 2021 16:04:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4428761998;
 Mon, 22 Mar 2021 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429036;
 bh=yFqEt0Vza9xx1ZEH6vpmadF/s9WD+9cr+PvfYFx1jTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DnY2VvcIHWNR00CmYsS8o9sdpXW8IfqlUTn3pfDogyHxX/SIITlr8SG6GxkT3eSRZ
 a7K8jLXsPna4Mm190+MpWcuBICb/n+i193Sgx5UJVnr/NQaks4zNGBOOkdJN7kk+Zx
 IrtL2gHR1/fBjD9NvgLiYwkQqQ/EKWhfodExGrNMHcxDZouSH1dybJZC/EbBnOcXm9
 XQLG8dt1bjMaDOofLpAx013Fhy9k111G7DuVnc/32l3avRksgUDzsBf0x12znYeUYk
 RAdBhG+/y/EhxEsBwjpyhm77vbHfFV6Wbj7ETM5qbIRB/4/X2e34tKnfe8hgDnqlGY
 gToo1OwJ8lpqg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Serge Hallyn <serge@hallyn.com>, James Morris <jmorris@namei.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Ning Sun <ning.sun@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Imre Deak <imre.deak@intel.com>, linux-arm-kernel@lists.infradead.org,
 tboot-devel@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, cgroups@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kees Cook <keescook@chromium.org>, Miklos Szeredi <mszeredi@redhat.com>,
 Tycho Andersen <tycho@tycho.pizza>
Subject: [PATCH 03/11] security: commoncap: fix -Wstringop-overread warning
Date: Mon, 22 Mar 2021 17:02:41 +0100
Message-Id: <20210322160253.4032422-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160401_660157_F038AFE2 
X-CRM114-Status: GOOD (  14.21  )
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

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSBpbnRyb2RjZXMgYSBo
YXJtbGVzcyB3YXJuaW5nIGZvciBjYXBfaW5vZGVfZ2V0c2VjdXJpdHk6CgpzZWN1cml0eS9jb21t
b25jYXAuYzogSW4gZnVuY3Rpb24g4oCYY2FwX2lub2RlX2dldHNlY3VyaXR54oCZOgpzZWN1cml0
eS9jb21tb25jYXAuYzo0NDA6MzM6IGVycm9yOiDigJhtZW1jcHnigJkgcmVhZGluZyAxNiBieXRl
cyBmcm9tIGEgcmVnaW9uIG9mIHNpemUgMCBbLVdlcnJvcj1zdHJpbmdvcC1vdmVycmVhZF0KICA0
NDAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1lbWNweSgmbnNjYXAtPmRhdGEs
ICZjYXAtPmRhdGEsIHNpemVvZihfX2xlMzIpICogMiAqIFZGU19DQVBfVTMyKTsKICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKVGhlIHByb2JsZW0gaGVy
ZSBpcyB0aGF0IHRtcGJ1ZiBpcyBpbml0aWFsaXplZCB0byBOVUxMLCBzbyBnY2MgYXNzdW1lcwpp
dCBpcyBub3QgYWNjZXNzaWJsZSB1bmxlc3MgaXQgZ2V0cyBzZXQgYnkgdmZzX2dldHhhdHRyX2Fs
bG9jKCkuICBUaGlzIGlzCmEgbGVnaXRpbWF0ZSB3YXJuaW5nIGFzIGZhciBhcyBJIGNhbiB0ZWxs
LCBidXQgdGhlIGNvZGUgaXMgY29ycmVjdCBzaW5jZQppdCBjb3JyZWN0bHkgaGFuZGxlcyB0aGUg
ZXJyb3Igd2hlbiB0aGF0IGZ1bmN0aW9uIGZhaWxzLgoKQWRkIGEgc2VwYXJhdGUgTlVMTCBjaGVj
ayB0byB0ZWxsIGdjYyBhYm91dCBpdCBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBzZWN1cml0eS9jb21tb25jYXAuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3NlY3VyaXR5L2NvbW1vbmNhcC5jIGIvc2VjdXJpdHkvY29tbW9uY2FwLmMKaW5kZXggMjhmNGQy
NTQ4MGRmLi45YTM2ZWQ2ZGQ3MzcgMTAwNjQ0Ci0tLSBhL3NlY3VyaXR5L2NvbW1vbmNhcC5jCisr
KyBiL3NlY3VyaXR5L2NvbW1vbmNhcC5jCkBAIC00MDAsNyArNDAwLDcgQEAgaW50IGNhcF9pbm9k
ZV9nZXRzZWN1cml0eShzdHJ1Y3QgdXNlcl9uYW1lc3BhY2UgKm1udF91c2VybnMsCiAJCQkJICAg
ICAgJnRtcGJ1Ziwgc2l6ZSwgR0ZQX05PRlMpOwogCWRwdXQoZGVudHJ5KTsKIAotCWlmIChyZXQg
PCAwKQorCWlmIChyZXQgPCAwIHx8ICF0bXBidWYpCiAJCXJldHVybiByZXQ7CiAKIAlmc19ucyA9
IGlub2RlLT5pX3NiLT5zX3VzZXJfbnM7Ci0tIAoyLjI5LjIKCgotLSAKYXRoMTFrIG1haWxpbmcg
bGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
