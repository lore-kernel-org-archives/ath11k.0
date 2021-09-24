Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3E9C433EF
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:13:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7820E60EE4
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7820E60EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkA2HDTy88BSFnLDwoJw2STZjaOxBBu348imKknS34k=; b=VbqLFczrgySYDG
	MB4BTtWo+EDQ2KWEBQvTpJgcsjzQOuHQokeE137BlsQ0mNs3NjfEYm4NlcIbfmDJ/JOVZFpO2gGvs
	CYBSQGj2laG7vy6gNbvH/p8OttUhoBzeWxQ3KmiesxogbYvPr6CaC72CiRxw5/LluRzl2ZFXblDHx
	Srsz9oM+15FZCjiFPGis+yuiWPvHTByvW3EifCa3bBZT+mlcL9Yy6n8A6sehREipk7WExOMzQiJae
	t16EV2y8gY5//hZBlBs7zcKvxMUqGOdcVaAwMMrcuyZBvt+M8mZMhoIHazkAvxPjt+lLGCn40i4wc
	ZoCbrS0MsF1N8ipZFwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTiD8-00E4nC-PM; Fri, 24 Sep 2021 10:13:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTiD6-00E4l1-2J
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 10:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=PSDjjqFEK8yvy3cpVLa1oXndjT4ON15AUe4vO91EleE=; 
 t=1632478419; x=1633688019; b=TQrUWz32yyGfQvPH0vK/lESaK70yb8skJcPEh6NUyFgtiSm
 uuaZPoy/BLFl5CRqm0JJr8IdT+bKMllEMUn4hCZY67DPWIMFCTmX2F3fQbFRmi2wh0bfjoJ/CeGvx
 l2QaroVM7J/74y4/V8QWzeGSCNUexgDXd9gZhA+tRxziQjUZJZ1BhvXMD1MuNfKYt+D9qhp3ei8DU
 iY8+Z5FMqHuMTpoP0aDcWqvmC7xupAB8CosKew7U9b5PGPr0knMPc1MLDPnHnarJCXk+njDslO9Ly
 zxIWYJAgmMj7tSa2tgUpGLHhExZBosGCOvh9gMepOV5eCveF6fMxsmgbBn8AdA7A==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mTiD3-00B9Fh-Iu; Fri, 24 Sep 2021 12:13:37 +0200
Message-ID: <b02735cc844c9ba2222d23a7e6ad112a82a36891.camel@sipsolutions.net>
Subject: Re: [PATCH v4 5/6] mac80211: use ieee802_11_parse_elems() to find
 ies instead of ieee80211_bss_get_ie()
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 24 Sep 2021 12:13:36 +0200
In-Reply-To: <20210924100052.32029-6-wgong@codeaurora.org>
References: <20210924100052.32029-1-wgong@codeaurora.org>
 <20210924100052.32029-6-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_031340_141520_D28768AA 
X-CRM114-Status: UNSURE (   7.10  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

VGFraW5nIGEgYnJpZWYgbG9vayBiZWZvcmUgbHVuY2gsCgo+IMKgCWlmICghKGlmbWdkLT5mbGFn
cyAmIElFRUU4MDIxMV9TVEFfRElTQUJMRV9IVCkgJiYgIWlzXzZnaHopIHsKPiDCoAkJY29uc3Qg
dTggKmh0X29wZXJfaWUsICpodF9jYXBfaWU7Cj4gwqAKPiAKPiAKPiAKPiAtCQlodF9vcGVyX2ll
ID0gaWVlZTgwMjExX2Jzc19nZXRfaWUoY2JzcywgV0xBTl9FSURfSFRfT1BFUkFUSU9OKTsKPiAr
CQlodF9vcGVyX2llID0gZWxlbXMtPmh0X29wZXJhdGlvbiA/Cj4gKwkJCSgoY29uc3QgdTggKill
bGVtcy0+aHRfb3BlcmF0aW9uKSAtIDIgOgo+ICsJCQlOVUxMOwo+IMKgCQlpZiAoaHRfb3Blcl9p
ZSAmJiBodF9vcGVyX2llWzFdID49IHNpemVvZigqaHRfb3BlcikpCj4gwqAJCQlodF9vcGVyID0g
KHZvaWQgKikoaHRfb3Blcl9pZSArIDIpOwoKQ2FuJ3Qgd2UgZHJvcCB0aGVzZSBjaGVja3MsIGFu
ZCBzaW1wbHkgZG8KCmh0X29wZXIgPSBlbGVtcy0+aHRfb3BlcmF0aW9uPwoKQWZ0ZXIgYWxsLCBp
ZWVlODAyXzExX3BhcnNlX2VsZW1zKCkgc2hvdWxkIGFscmVhZHkgYmUgZG9pbmcgdGhlCm5lY2Vz
c2FyeSBsZW5ndGggY2hlY2tzPyBXZSBqdXN0IGRpZG4ndCBoYXZlIHRoYXQgd2l0aAppZWVlODAy
MTFfYnNzX2dldF9pZSgpLgoKPiAtCQlodF9jYXBfaWUgPSBpZWVlODAyMTFfYnNzX2dldF9pZShj
YnNzLCBXTEFOX0VJRF9IVF9DQVBBQklMSVRZKTsKPiArCQlodF9jYXBfaWUgPSBlbGVtcy0+aHRf
Y2FwX2VsZW0gPwo+ICsJCQkoKGNvbnN0IHU4ICopZWxlbXMtPmh0X2NhcF9lbGVtKSAtIDIgOgo+
ICsJCQlOVUxMOwo+IMKgCQlpZiAoaHRfY2FwX2llICYmIGh0X2NhcF9pZVsxXSA+PSBzaXplb2Yo
Kmh0X2NhcCkpCj4gwqAJCQlodF9jYXAgPSAodm9pZCAqKShodF9jYXBfaWUgKyAyKTsKCkxpa2V3
aXNlIGZvciBhbGwgdGhlIG90aGVycy4KCmpvaGFubmVzCgoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
