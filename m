Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16EDC433DB
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:05:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A8EC619B4
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A8EC619B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XXnMaJFRW4llkKR/JxOPOR3GMp/bGyws9Pmg3Fkkkzw=; b=gaE9kYYduv9p0FaDJImXz5XBm
	mMIflsSbDxSDt0Xw45tE9gto7WrmY0opfHFrPxxCeFcRDXNI4xvHiRM4OR3lA/op9RzSBYizkSiAj
	KdXrmsjJz4d1scNKfi1gdu8URS8Y5Res6pxiT+n8YtjvILgXHH3bc80cj9LJ+qZCIWKTVD8RkBFEI
	raz2sJ6VdKA99/o3NDK27B1iq55T3ubLKhwMvgAMNJEyCPmq5WloTQf2NWYPZqoHFwoB3FbsklBmI
	nf7dS/L9YFtW9j0WJ0zk7VyLK1I8oZOV0y4Il2oRQoF7BFaIdUF1Id1NV99K4qY6lFEafJz15riAP
	zkFNae3CQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON3k-00Bxxn-OX; Mon, 22 Mar 2021 16:05:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON3F-00BxlC-Hg; Mon, 22 Mar 2021 16:05:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2816A619AD;
 Mon, 22 Mar 2021 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429107;
 bh=hZ+CAtng3yIYZIb+ah3e8qtw8iX8HVHsX0ExOcLMkVU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dwkY1GeSKE6uqnx1AxEi3VFdRhYPg81cUVXGmS7VFECNmiWnHG9H8Xs03DE5r5UkI
 2VYRrKWZEbiYE/8Go+UBgggdeU5IHX8PCQyERsMz4uhXvD8S/WDGEhcAqel5lYAhxx
 GH5OrCzsuWJ7MemQavOxq36ZBrGw8QsN0rHVPucenBu12gisEUNifGSz6+0j2xJ9ZZ
 bEVaUqft+/YBHP8/oDZqfcdvztMrcHT8BJQ3udH192n6G7X4gUnHIGCuLP1ptF/QU4
 TnlXa1Qe8PUzWprVm8njgDc/yGpNfz20AWAFmYDGGOfZtOuyJUs4ZC7Fgr12Ezshk/
 OxLRDx1pnNY1A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Simon Kelley <simon@thekelleys.org.uk>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Ning Sun <ning.sun@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 linux-arm-kernel@lists.infradead.org, tboot-devel@lists.sourceforge.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Pascal Terjan <pterjan@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 08/11] atmel: avoid gcc -Wstringop-overflow warning
Date: Mon, 22 Mar 2021 17:02:46 +0100
Message-Id: <20210322160253.4032422-9-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160511_781374_11DBD608 
X-CRM114-Status: GOOD (  14.29  )
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

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSBub3RpY2VzIHRoYXQg
dGhlIGZpZWxkcyBhcyBkZWZpbmVkIGluIHRoZSBhc3NfcmVxX2Zvcm1hdApzdHJ1Y3R1cmUgZG8g
bm90IG1hdGNoIHRoZSBhY3R1YWwgdXNlIG9mIHRoYXQgc3RydWN0dXJlOgoKY2MxOiBlcnJvcjog
d3JpdGluZyA0IGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVuIDE4NDQ2NzQ0MDcz
NzA5NTUxNjEzIGFuZCAyIFstV2Vycm9yPXN0cmluZ29wLW92ZXJmbG93PV0KZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRtZWwvYXRtZWwuYzoyODg0OjIwOiBub3RlOiBhdCBvZmZzZXQgWzQsIDZdIGlu
dG8gZGVzdGluYXRpb24gb2JqZWN0IOKAmGFw4oCZIG9mIHNpemUgNgogMjg4NCB8ICAgICAgICAg
ICAgICAgICB1OCBhcFtFVEhfQUxFTl07IC8qIG5vdGhpbmcgYWZ0ZXIgaGVyZSBkaXJlY3RseSBh
Y2Nlc3NpYmxlICovCiAgICAgIHwgICAgICAgICAgICAgICAgICAgIF5+CmRyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0bWVsL2F0bWVsLmM6Mjg4NToyMDogbm90ZTogYXQgb2Zmc2V0IFs0LCA2XSBpbnRv
IGRlc3RpbmF0aW9uIG9iamVjdCDigJhzc2lkX2VsX2lk4oCZIG9mIHNpemUgMQogMjg4NSB8ICAg
ICAgICAgICAgICAgICB1OCBzc2lkX2VsX2lkOwogICAgICB8ICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+CgpUaGlzIGlzIGV4cGVjdGVkIGhlcmUgYmVjYXVzZSB0aGUgYWN0dWFsIHN0cnVj
dHVyZSBsYXlvdXQgaXMgdmFyaWFibGUuCkFzIHRoZSBjb2RlIGRvZXMgbm90IGFjdHVhbGx5IGFj
Y2VzcyB0aGUgaW5kaXZpZHVhbCBmaWVsZHMsIHJlcGxhY2UKdGhlbSB3aXRoIGEgY29tbWVudCBh
bmQgZml4ZWQtbGVuZ3RoIGFycmF5IHNvIHByZXZlbnQgZ2NjIGZyb20KY29tcGxhaW5pbmcgYWJv
dXQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0K
IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0bWVsL2F0bWVsLmMgfCAyNSArKysrKysrKysrKysrKyst
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRtZWwvYXRtZWwuYyBiL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0bWVsL2F0bWVsLmMKaW5kZXggNzA3ZmU2NjcyN2Y4Li5mZjkx
NTJkNjAwZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0bWVsL2F0bWVsLmMK
KysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRtZWwvYXRtZWwuYwpAQCAtMjg4MSwxMyArMjg4
MSwxOCBAQCBzdGF0aWMgdm9pZCBzZW5kX2Fzc29jaWF0aW9uX3JlcXVlc3Qoc3RydWN0IGF0bWVs
X3ByaXZhdGUgKnByaXYsIGludCBpc19yZWFzc29jKQogCXN0cnVjdCBhc3NfcmVxX2Zvcm1hdCB7
CiAJCV9fbGUxNiBjYXBhYmlsaXR5OwogCQlfX2xlMTYgbGlzdGVuX2ludGVydmFsOwotCQl1OCBh
cFtFVEhfQUxFTl07IC8qIG5vdGhpbmcgYWZ0ZXIgaGVyZSBkaXJlY3RseSBhY2Nlc3NpYmxlICov
Ci0JCXU4IHNzaWRfZWxfaWQ7Ci0JCXU4IHNzaWRfbGVuOwotCQl1OCBzc2lkW01BWF9TU0lEX0xF
TkdUSF07Ci0JCXU4IHN1cF9yYXRlc19lbF9pZDsKLQkJdTggc3VwX3JhdGVzX2xlbjsKLQkJdTgg
cmF0ZXNbNF07CisJCXU4IHNzaWRfZWxbRVRIX0FMRU4gKyAyICsgTUFYX1NTSURfTEVOR1RIICsg
MiArIDRdOworCQkvKgorCQkgKiBub3RoaW5nIGFmdGVyIGhlcmUgZGlyZWN0bHkgYWNjZXNzaWJs
ZToKKwkJICoKKwkJICogdTggYXBbRVRIX0FMRU5dOworCQkgKiB1OCBzc2lkX2VsX2lkOworCQkg
KiB1OCBzc2lkX2xlbjsKKwkJICogdTggc3NpZFtNQVhfU1NJRF9MRU5HVEhdOworCQkgKiB1OCBz
dXBfcmF0ZXNfZWxfaWQ7CisJCSAqIHU4IHN1cF9yYXRlc19sZW47CisJCSAqIHU4IHJhdGVzWzRd
OworCQkgKi8KIAl9IGJvZHk7CiAKIAloZWFkZXIuZnJhbWVfY29udHJvbCA9IGNwdV90b19sZTE2
KElFRUU4MDIxMV9GVFlQRV9NR01UIHwKQEAgLTI5MDcsMTMgKzI5MTIsMTMgQEAgc3RhdGljIHZv
aWQgc2VuZF9hc3NvY2lhdGlvbl9yZXF1ZXN0KHN0cnVjdCBhdG1lbF9wcml2YXRlICpwcml2LCBp
bnQgaXNfcmVhc3NvYykKIAogCWJvZHkubGlzdGVuX2ludGVydmFsID0gY3B1X3RvX2xlMTYocHJp
di0+bGlzdGVuX2ludGVydmFsICogcHJpdi0+YmVhY29uX3BlcmlvZCk7CiAKKwlzc2lkX2VsX3Ag
PSBib2R5LnNzaWRfZWw7CiAJLyogY3VycmVudCBBUCBhZGRyZXNzIC0gb25seSBpbiByZWFzc29j
IGZyYW1lICovCiAJaWYgKGlzX3JlYXNzb2MpIHsKLQkJbWVtY3B5KGJvZHkuYXAsIHByaXYtPkN1
cnJlbnRCU1NJRCwgRVRIX0FMRU4pOwotCQlzc2lkX2VsX3AgPSAmYm9keS5zc2lkX2VsX2lkOwor
CQltZW1jcHkoc3NpZF9lbF9wLCBwcml2LT5DdXJyZW50QlNTSUQsIEVUSF9BTEVOKTsKKwkJc3Np
ZF9lbF9wICs9IEVUSF9BTEVOOwogCQlib2R5c2l6ZSA9IDE4ICsgcHJpdi0+U1NJRF9zaXplOwog
CX0gZWxzZSB7Ci0JCXNzaWRfZWxfcCA9ICZib2R5LmFwWzBdOwogCQlib2R5c2l6ZSA9IDEyICsg
cHJpdi0+U1NJRF9zaXplOwogCX0KIAotLSAKMi4yOS4yCgoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
