Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DCEC43334
	for <ath11k@archiver.kernel.org>; Tue, 21 Jun 2022 15:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Un39hGKlhRSuHEw3oYoTC6//ta6lclg/rIwdsT3UGP4=; b=n99hHnmc+OfuE/
	SFnseKA+BjuTRwRqoHOx9KepU6U36yK+67tqe7hsF1dZAEFzYFstUhiENNg9DFkBajoASkpc4KEP4
	74P6PwykwWsnFzfVjEA0TNNDcZr21a8zMzjVFmoXd52P6xccL7ECZ+R2MJN3yPy5ruOgIAhSqiSen
	GXEfSNWTyPXxLYm1OxKlpOxIX6RAy9hbbSTmjRivd0Zg1gcCOfJDvWxLktSn2/iGxulRElKZXF3yO
	8nOYxaZaK29ZONkSZ66UrmJM0QPGQ/2oGfPRGBL2BE67zMtezWhLCXvAI7oetC61jzfZBHeZh5qXB
	usVqLgL0mAeHUwUc2gRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3foX-006ARE-96; Tue, 21 Jun 2022 15:29:13 +0000
Received: from 8.mo576.mail-out.ovh.net ([46.105.56.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3foT-006AMb-I3
	for ath11k@lists.infradead.org; Tue, 21 Jun 2022 15:29:11 +0000
Received: from player746.ha.ovh.net (unknown [10.109.156.194])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 99C9623496
	for <ath11k@lists.infradead.org>; Tue, 21 Jun 2022 15:28:59 +0000 (UTC)
Received: from galgus.net (86-127-225-236.digimobil.es [86.127.225.236])
	(Authenticated sender: jesus.manzano@galgus.net)
	by player746.ha.ovh.net (Postfix) with ESMTPSA id 69F041E73F8C4;
	Tue, 21 Jun 2022 15:28:55 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-95G0011089bdc4-1693-4846-8e01-d25de9a4e602,
                    14DB0BF606E187386CEFFBBE484AA2084A70D6C3) smtp.auth=jesus.manzano@galgus.net
X-OVh-ClientIp: 86.127.225.236
Message-ID: <212d978d-3b70-1382-4c97-bbe79905aba6@galgus.net>
Date: Tue, 21 Jun 2022 17:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ath11k: fix number of VHT beamformee spatial streams
Content-Language: en-US
To: Sipos Csaba <dchardware@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20220616173947.21901-1-jesus.manzano@galgus.net>
 <CALQr=E8S6gt_UjaP7GS3M0Tn-MGg7-Xs03Q3suuV7=OP4XmiEQ@mail.gmail.com>
 <fd68f826-8e38-cbfd-87cc-720a2a3b1530@galgus.net>
 <CALQr=E8BNQB0vG2AXqfuUmbOKKCXZR7MFBxAc72db00QTiVPTw@mail.gmail.com>
From: =?UTF-8?Q?Jes=c3=bas_Fern=c3=a1ndez_Manzano?= <jesus.manzano@galgus.net>
In-Reply-To: <CALQr=E8BNQB0vG2AXqfuUmbOKKCXZR7MFBxAc72db00QTiVPTw@mail.gmail.com>
X-Ovh-Tracer-Id: 16409428195330355519
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeffedgkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttdefjeenucfhrhhomheplfgvshprshgphfgvrhhnjohnuggviigpofgrnhiirghnohcuoehjvghsuhhsrdhmrghniigrnhhosehgrghlghhushdrnhgvtheqnecuggftrfgrthhtvghrnhepfeeiueeltdfghfegfffgkedtfeefgfduuddvkeekleevieehieelveevfeeghffgnecukfhppedtrddtrddtrddtpdekiedruddvjedrvddvhedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeegiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjvghsuhhsrdhmrghniigrnhhosehgrghlghhushdrnhgvthdpnhgspghrtghpthhtohepuddprhgtphhtthhopegrthhhuddukheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheejie
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_082909_766211_27FACCF5 
X-CRM114-Status: GOOD (  11.28  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

RWwgMjEvNi8yMiBhIGxhcyAxNDowNiwgU2lwb3MgQ3NhYmEgZXNjcmliacOzOgo+IEkgYW0gbm90
IHN1cmUgaWYgeW91IG5vdGljZWQsIHRoYXQgd2hlbiB5b3UgZG8gdXBsaW5rIGhlYXZ5IHRlc3Rz
IG9uCj4gQVgsIGluIHRoZSBjdXJyZW50IHN0YXRlIHVwbGluayBwb3dlciBpcyBncm9zc2x5IGZs
dWN0dWF0aW5nIHJlcG9ydGVkCj4gYnkgdGhlIGRyaXZlciwgd2hpbGUgdGhlIFJGIGVudmlyb25t
ZW50IGlzIHN0YXRpYy4gSSBhbSBub3Qgc3VyZSBpZgo+IHRoaXMgaXNzdWUgd2l0aCBCRiB3aWxs
IGZpeCBpdCwgYnV0IHN1cmUgaXQgc291bmRzIHBsYXVzaWJsZS4gSXQgaXMKPiBhbHNvIHVua25v
d24gaG93IHRoZSBkcml2ZXIgY2FsY3VsYXRlcyBSWCBwb3dlciBwZXIgY2xpZW50OiBkb2VzIGl0
Cj4gdXNlcyBzb21lIHNvcnQgb2YgcmVmZXJlbmNlIHNpZ25hbCwgb3IgdGhlIGNhbGN1bGF0ZWQg
cG93ZXIgZGVwZW5kcyBvbgo+IHRyYWZmaWMgdm9sdW1lPwoKSGkgQ3NhYmEsCgpZZXMgSSBub3Rp
Y2VkIHRoZSBzYW1lIGlzc3VlIGluIGhlYXZ5IGlwZXJmMyB1cGxpbmsgdGVzdHMuIEJ1dCB0aGF0
IHdhcyAKaGFwcGVuaW5nIHRvIG1lIHdpdGggZmlybXdhcmUgMi40LCBub3cgd2l0aCAyLjUgYW5k
IHRoZSBsYXRlc3QgCmJvYXJkLTIuYmluIGl0IHdvcmtzIGxpa2UgYSBjaGFybS4gTWF5YmUgeW91
IG5lZWQgc29tZSBtb3JlIHBhdGNoZXMgaW4gCmF0aDExaz8gSSBhbSB1c2luZyBhIGNvbWJpbmF0
aW9uIG9mIHVwc3RyZWFtIHBhdGNoZXMgZnJvbSByZWNlbnQga2VybmVscyAKYW5kIHNvbWUgcWNh
IHBhdGNoZXMuIElmIHlvdSB3YW50LCB3ZSBjYW4gZGlzY3VzcyB0aGUgdG9waWMgb3V0c2lkZSB0
aGUgCm1haWxpbmcgbGlzdCB0byBub3Qgc3BhbSBvdGhlciBwZW9wbGUuCgpSZWdhcmRzLApKZXN1
cy4KCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
