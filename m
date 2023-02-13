Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4EDC636D4
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bT8NDKNZppY48y51heLCBfSEnwoqfMJDJZ3rR1of2SI=; b=TT6GnjjA6jtDoAC0pUZBh1jcbX
	Ubr8gxyHmpEpgSl27t+76tmEYwL9332UKmvmMAXUOAhFNOui5DyGqj4dAtrJS/tfuaYLn/9cggiyK
	leEYSB71ST9cMqZL28ekMNRSnINhcErHCjYHhetr0jlTakJnP55o029XX+FmLlPqkvf03WmTjV9fh
	dzAV97LAUULltjbpbuWiQH/RGbfEKUzPV5Nib76eGnd2MEUJOfB6CM6tJ2rV04flBrQOzsB7uLa95
	zYgLCaxsMtR7qvtQmvR5OzefW+LvUmYNE+4/V6hmHhc09B+Cak7oTc3S5Sd9tjlHUMOlSAbHfFKce
	K//Wob5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYfl-00EmRT-Ln; Mon, 13 Feb 2023 13:15:09 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYfh-00EmPX-UG
	for ath11k@lists.infradead.org; Mon, 13 Feb 2023 13:15:07 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C0BB1636DD4A;
	Mon, 13 Feb 2023 14:15:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id MWux1QefvsHK; Mon, 13 Feb 2023 14:15:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7BFDD6399217;
	Mon, 13 Feb 2023 14:15:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7kfiiSziCj4W; Mon, 13 Feb 2023 14:15:02 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5D795636DD4A;
	Mon, 13 Feb 2023 14:15:02 +0100 (CET)
Date: Mon, 13 Feb 2023 14:15:02 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: kvalo <kvalo@kernel.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, 
	ath11k <ath11k@lists.infradead.org>
Message-ID: <1617726247.124241.1676294102295.JavaMail.zimbra@nod.at>
In-Reply-To: <87pmadvj66.fsf@kernel.org>
References: <1263051271.53086.1674425560245.JavaMail.zimbra@nod.at> <873579wze8.fsf@kernel.org> <370539199.123516.1676291073661.JavaMail.zimbra@nod.at> <87pmadvj66.fsf@kernel.org>
Subject: Re: Resume from hibernation fails due to ath11k_pci
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Resume from hibernation fails due to ath11k_pci
Thread-Index: aNidDqcSdYsc9VDUnTvkaPgVSmJ/Vg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_051506_144503_1B89F4E8 
X-CRM114-Status: UNSURE (   5.61  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImt2YWxvIiA8a3ZhbG9Aa2Vy
bmVsLm9yZz4KPiBJSVJDIHRoZSBpc3N1ZSBpcyB0aGF0IGF0aDExayBleHBlY3RzIHRoZSBmaXJt
d2FyZSB0byBiZSBydW5uaW5nIGR1cmluZwo+IHN1c3BlbmQuIEFuZCB0aGlzIHdhcyBiZWNhdXNl
IHNodXR0aW5nIGRvd24gdGhlIGZpcm13YXJlIGZvciBzdXNwZW5kCj4gY2F1c2VkIHByb2JsZW1z
IGluIHRoZSBNSEkgc3Vic3lzdGVtIGR1cmluZyByZXN1bWUuIFRvIGZpeCB0aGlzIEkKPiBzdXNw
ZWN0IHdlIG5lZWQgY2hhbmdlcyBib3RoIGluIGF0aDExayBhbmQgaW4gdGhlIE1ISSBzdWJzeXN0
ZW0sIHNvIG5vdAo+IGVhc3kuCgpIbS4KU28sIGN1cnJlbnRseSB0aGUgZGV2aWNlIGlzIHB1dCBp
bnRvIFdvVyBtb2RlIGluc3RlYWQgb2YgcG93ZXJpbmcgaXQgb2ZmIGJlY2F1c2UKb2YgaXNzdWVz
IGluIHRoZSBNSEkgc3Vic3lzdGVtLgpBdCBsZWFzdCB0aGlzIHBhdGNoIHNlcmllcyBpbmRpY2F0
ZXMgc286Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xNjA3NzA4MTUwLTIxMDY2LTEtZ2l0
LXNlbmQtZW1haWwta3ZhbG9AY29kZWF1cm9yYS5vcmcvCiAKT24gdGhlIG90aGVyIGhhbmQsIG15
IGRldmljZSBzZWVtcyB0byBoYXZlIHRyb3VibGUgd2l0aCB0aGF0IHdvcmthcm91bmQuCk1heWJl
IHBvd2VyaW5nIGl0IG9mZiBjb21wbGV0ZWx5IGhlbHBzLgoKRG8geW91IGhhdmUgYSBwb2ludGVy
IHRvIHNhaWQgTUhJIGlzc3Vlcz8KClRoYW5rcywKLy9yaWNoYXJkCgotLSAKYXRoMTFrIG1haWxp
bmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
