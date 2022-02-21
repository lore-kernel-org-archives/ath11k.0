Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C94C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUw6xFPSW0mV/Pcg/NdTKz/hANLrekZqZwzOR7pQS9k=; b=f9L6MCWrezIUCP
	86fLrjaHMoFs8FrwOxJvDM+jcKbmmTz1X1tVcXN4pEjSn4Mrxs89PYRIR8AAhPNRZ7YYzeLyZVFrt
	B7A7MwAJfhyS+Q4I7H7HFpGgLYBzk93c7KxI+7bKvGK/41Wx6AunXpj5r+j7Aee9nZwuUWxaUHHGP
	ebzyQjozza+4bvd2M60HgYgLHOVYurXnyF8HmWXlU4o8M/mzRh3NGQY4mASAGTMMrTOwlKyaupn+F
	4BvrEsMOSzwcnoaYuelZp0uQZ+Llg+QOvAQnusG7ts1XQP/YIZlQL6z7F32tswtR9CSgOni1dpoZ4
	0R2aQYlShGvOAQkWV8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM6IG-0057Xw-Uk; Mon, 21 Feb 2022 10:51:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5sQ-004tvg-HI
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 10:25:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C45C60FF6;
 Mon, 21 Feb 2022 10:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879B5C340E9;
 Mon, 21 Feb 2022 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645439105;
 bh=I0h6TXzpI9LTd9+PXWtc7STtHBWbZ1omafIuWXHUcvM=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=dPpIDnIeu+OeUBZ1vTyvbO1j9NeQvZqlqC/YN5IoGmfD/CmJdP73k2C0mtiBUGOFc
 WEQTyXgwoZcQG4gYHaZZsux6ucbLuUJgrgoVjdC6djv3VScHpsUFAKxpbYpv6EM1qC
 3JPLd0bRsue5qdYek8oAjYxJpl2KLGAlukVL9X0MFt0jydNeleoZJaFijz7X+plocd
 YWEqAQ867NxG1pc+ftAOMD/cpZ0GXb1Xz0uilkg+Ng17WlsSDgJXggRyQsj62cyHUD
 FW32uTlLw4uqRlTbI3vOerJSI7T++XtD//7EFfTA7Afpt3vFODb2XpqfaKQC2g6CBB
 t22zEnQ8dYohQ==
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: Replace zero-length arrays with
 flexible-array members
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220216194836.GA904035@embeddedor>
References: <20220216194836.GA904035@embeddedor>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164543910185.26423.18264056361764169829.kvalo@kernel.org>
Date: Mon, 21 Feb 2022 10:25:03 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_022506_646440_A8F3F679 
X-CRM114-Status: UNSURE (   8.71  )
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

Ikd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBU
aGVyZSBpcyBhIHJlZ3VsYXIgbmVlZCBpbiB0aGUga2VybmVsIHRvIHByb3ZpZGUgYSB3YXkgdG8g
ZGVjbGFyZQo+IGhhdmluZyBhIGR5bmFtaWNhbGx5IHNpemVkIHNldCBvZiB0cmFpbGluZyBlbGVt
ZW50cyBpbiBhIHN0cnVjdHVyZS4KPiBLZXJuZWwgY29kZSBzaG91bGQgYWx3YXlzIHVzZSDigJxm
bGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZQo+IGNhc2VzLiBUaGUgb2xkZXIg
c3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlzIHNob3VsZAo+IG5vIGxv
bmdlciBiZSB1c2VkWzJdLgo+IAo+IFsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9G
bGV4aWJsZV9hcnJheV9tZW1iZXIKPiBbMl0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRt
bC92NS4xNi9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJvLWxlbmd0aC1hbmQtb25lLWVsZW1l
bnQtYXJyYXlzCj4gCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0tTUFAvbGludXgvaXNzdWVz
Lzc4Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJu
ZWwub3JnPgo+IFJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4K
PiBTaWduZWQtb2ZmLWJ5OiBLYWxsZSBWYWxvIDxxdWljX2t2YWxvQHF1aWNpbmMuY29tPgoKUGF0
Y2ggYXBwbGllZCB0byBhdGgtbmV4dCBicmFuY2ggb2YgYXRoLmdpdCwgdGhhbmtzLgoKZTllNTkx
Njg2Y2NiIGF0aDExazogUmVwbGFjZSB6ZXJvLWxlbmd0aCBhcnJheXMgd2l0aCBmbGV4aWJsZS1h
cnJheSBtZW1iZXJzCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xp
bnV4LXdpcmVsZXNzL3BhdGNoLzIwMjIwMjE2MTk0ODM2LkdBOTA0MDM1QGVtYmVkZGVkb3IvCgpo
dHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRp
b24vc3VibWl0dGluZ3BhdGNoZXMKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDExawo=
