Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AF0C433C1
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:04:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1411B619A9
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 16:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1411B619A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JxlhmvSD5r3TaB6FCQFiKvZhDzONMiAw3879yQ0a498=; b=Tjib6LSq3fQL4X1PkAubYtQOg
	7W8bUs1hZy791X644QHL1L++jIzwxyydKvK6PshTiWhfoh2ceNGVPP5/jHf16sV98786MoKolpdtv
	RsOe/+90cFep0fWd+0TwbtfmmU53U/hLTYIV6rIhWc6RF6hYcXU6/V+oNQ0QoR4UmE7iOxPqxzBKE
	rz8LJlaFF0Nfr/WWWvo1ZSabk/Fuy9Nmdhph1TIoU7OpM52SkLwpjNH92YruIcF+XJ+EYLwiZGxrD
	lT0agym9qytuhY0qLul5T05boMjuIXkj+97S9yn6yXdLpppXMzmg3k89cuU2k09XpFl/IvI3Hgecm
	Nm/76FtdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lON2r-00BxYZ-1Y; Mon, 22 Mar 2021 16:04:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lON2Z-00BxPj-C8; Mon, 22 Mar 2021 16:04:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D63E5619A4;
 Mon, 22 Mar 2021 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616429066;
 bh=nkpO3F9iV2LP9C5b1X1yN1ZVysmYmotRTLuBUWIaptM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MU4IL9JNNK+J8U+vvpLpwovR+/suU+W9R4RhhhMaub4p/qt1HSm7/5H/LxJjfRA1v
 f+dccndcC0t+6DndIOBCJbVJvgtAFbUO/Xj+Ad4PAK3HRVGVN0VmdJVzwNG2nWP60W
 yoMi7GzhcMMul2Me0RQEOrAkh9+ikItIp0T7LrmMn4UxhxHfYhCqAAaad++VD478Ly
 WRurbxWp7EoqaQbB5aDSFB4iZyCpOkFivtOdus8BKdINgwMELaIsTcoM1dTXGsBCvO
 NUlZI47cRIaTlBnQpp36y5LIoHJRasVTH3KqfKgtuhF/A3Vph299qnut15q3EDnfE2
 ATElHLu2Uchbw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Martin Sebor <msebor@gcc.gnu.org>,
 Anders Larsen <al@alarsen.net>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Ning Sun <ning.sun@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 linux-arm-kernel@lists.infradead.org, tboot-devel@lists.sourceforge.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH 05/11] qnx: avoid -Wstringop-overread warning
Date: Mon, 22 Mar 2021 17:02:43 +0100
Message-Id: <20210322160253.4032422-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322160253.4032422-1-arnd@kernel.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_160428_221198_075D25D4 
X-CRM114-Status: GOOD (  13.40  )
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

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSB3YXJucyB0aGF0IHRo
ZSBzaXplIG9mIHRoZSBsaW5rIG5hbWUgaXMgbG9uZ2VyIHRoYW4gdGhlIGRpX2ZuYW1lCmZpZWxk
OgoKZnMvcW54NC9kaXIuYzogSW4gZnVuY3Rpb24g4oCYcW54NF9yZWFkZGly4oCZOgpmcy9xbng0
L2Rpci5jOjUxOjMyOiBlcnJvcjog4oCYc3RybmxlbuKAmSBzcGVjaWZpZWQgYm91bmQgNDggZXhj
ZWVkcyBzb3VyY2Ugc2l6ZSAxNiBbLVdlcnJvcj1zdHJpbmdvcC1vdmVycmVhZF0KICAgNTEgfCAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplID0gc3RybmxlbihkZS0+ZGlfZm5hbWUsIHNpemUp
OwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGZzL3FueDQvcW54NC5oOjMsCiAgICAg
ICAgICAgICAgICAgZnJvbSBmcy9xbng0L2Rpci5jOjE2OgppbmNsdWRlL3VhcGkvbGludXgvcW54
NF9mcy5oOjQ1OjI1OiBub3RlOiBzb3VyY2Ugb2JqZWN0IGRlY2xhcmVkIGhlcmUKICAgNDUgfCAg
ICAgICAgIGNoYXIgICAgICAgICAgICBkaV9mbmFtZVtRTlg0X1NIT1JUX05BTUVfTUFYXTsKClRo
ZSBwcm9ibGVtIGhlcmUgaXMgdGhhdCB3ZSBhY2Nlc3MgdGhlIHNhbWUgcG9pbnRlciB1c2luZyB0
d28gZGlmZmVyZW50CnN0cnVjdHVyZSBsYXlvdXRzLCBidXQgZ2NjIGRldGVybWluZXMgdGhlIG9i
amVjdCBzaXplIGJhc2VkIG9uCndoYXRldmVyIGl0IGVuY291bnRlcnMgZmlyc3QuCgpDaGFuZ2Ug
dGhlIHN0cm5sZW4gdG8gdXNlIHRoZSBjb3JyZWN0IGZpZWxkIHNpemUgaW4gZWFjaCBjYXNlLCBh
bmQKY2hhbmdlIHRoZSBmaXJzdCBhY2Nlc3MgdG8gYmUgb24gdGhlIGxvbmdlciBmaWVsZC4KCkxp
bms6IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTk5NTc4ClNp
Z25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZnMvcW54NC9k
aXIuYyB8IDExICsrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3FueDQvZGlyLmMgYi9mcy9xbng0L2Rpci5j
CmluZGV4IGE2ZWUyM2FhZGQyOC4uNjgwNDY0NTBlNTQzIDEwMDY0NAotLS0gYS9mcy9xbng0L2Rp
ci5jCisrKyBiL2ZzL3FueDQvZGlyLmMKQEAgLTM5LDIxICszOSwyMCBAQCBzdGF0aWMgaW50IHFu
eDRfcmVhZGRpcihzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGRpcl9jb250ZXh0ICpjdHgpCiAJ
CWl4ID0gKGN0eC0+cG9zID4+IFFOWDRfRElSX0VOVFJZX1NJWkVfQklUUykgJSBRTlg0X0lOT0RF
U19QRVJfQkxPQ0s7CiAJCWZvciAoOyBpeCA8IFFOWDRfSU5PREVTX1BFUl9CTE9DSzsgaXgrKywg
Y3R4LT5wb3MgKz0gUU5YNF9ESVJfRU5UUllfU0laRSkgewogCQkJb2Zmc2V0ID0gaXggKiBRTlg0
X0RJUl9FTlRSWV9TSVpFOwotCQkJZGUgPSAoc3RydWN0IHFueDRfaW5vZGVfZW50cnkgKikgKGJo
LT5iX2RhdGEgKyBvZmZzZXQpOwotCQkJaWYgKCFkZS0+ZGlfZm5hbWVbMF0pCisJCQlsZSA9IChz
dHJ1Y3QgcW54NF9saW5rX2luZm8gKikoYmgtPmJfZGF0YSArIG9mZnNldCk7CisJCQlkZSA9IChz
dHJ1Y3QgcW54NF9pbm9kZV9lbnRyeSAqKShiaC0+Yl9kYXRhICsgb2Zmc2V0KTsKKwkJCWlmICgh
bGUtPmRsX2ZuYW1lWzBdKQogCQkJCWNvbnRpbnVlOwogCQkJaWYgKCEoZGUtPmRpX3N0YXR1cyAm
IChRTlg0X0ZJTEVfVVNFRHxRTlg0X0ZJTEVfTElOSykpKQogCQkJCWNvbnRpbnVlOwogCQkJaWYg
KCEoZGUtPmRpX3N0YXR1cyAmIFFOWDRfRklMRV9MSU5LKSkKLQkJCQlzaXplID0gUU5YNF9TSE9S
VF9OQU1FX01BWDsKKwkJCQlzaXplID0gc3RybmxlbihkZS0+ZGlfZm5hbWUsIHNpemVvZihkZS0+
ZGlfZm5hbWUpKTsKIAkJCWVsc2UKLQkJCQlzaXplID0gUU5YNF9OQU1FX01BWDsKLQkJCXNpemUg
PSBzdHJubGVuKGRlLT5kaV9mbmFtZSwgc2l6ZSk7CisJCQkJc2l6ZSA9IHN0cm5sZW4obGUtPmRs
X2ZuYW1lLCBzaXplb2YobGUtPmRsX2ZuYW1lKSk7CiAJCQlRTlg0REVCVUcoKEtFUk5fSU5GTyAi
cW54NF9yZWFkZGlyOiUuKnNcbiIsIHNpemUsIGRlLT5kaV9mbmFtZSkpOwogCQkJaWYgKCEoZGUt
PmRpX3N0YXR1cyAmIFFOWDRfRklMRV9MSU5LKSkKIAkJCQlpbm8gPSBibGtudW0gKiBRTlg0X0lO
T0RFU19QRVJfQkxPQ0sgKyBpeCAtIDE7CiAJCQllbHNlIHsKLQkJCQlsZSAgPSAoc3RydWN0IHFu
eDRfbGlua19pbmZvKilkZTsKIAkJCQlpbm8gPSAoIGxlMzJfdG9fY3B1KGxlLT5kbF9pbm9kZV9i
bGspIC0gMSApICoKIAkJCQkJUU5YNF9JTk9ERVNfUEVSX0JMT0NLICsKIAkJCQkJbGUtPmRsX2lu
b2RlX25keDsKLS0gCjIuMjkuMgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
