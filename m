Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA79EE7FF4
	for <ath11k@archiver.kernel.org>; Mon, 11 Sep 2023 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYzi6SbjO1k8mxrZmqAb6eCwMH1riSTPcB98pdBDEjI=; b=FzpqktEtJ4NVbA
	6kxwYHYQj8CKDSHquAzww5KFBUxfIFpIBHl+ljYQZX9wXbC8f9N4PcHMLqASU3jIo59hZaXVLJo+5
	KV9GjZD06SLOBBA5FwfesxQDjmi7SMEQT+KxjxH2UG9u1AJ8HqXeypmIRytjfaGuCtqbZRSS3eeYW
	+jw8CvuJFhWd0Lv7fhsZ0ETwI1sPzPDbNo1rV1zWSzU8Uam4dLr2a18P3eps8x09fIYFNImK8ngq2
	SnuZzYxGcZJtx3p9CO4FuqBf64cZvRW8bb2IU4D1R5M9qPw6VD/XLIFRXnoZOs6HI9MZWrTyhCqln
	yuIRl06yNjUwXmFNssUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qff2v-000NUG-1E;
	Mon, 11 Sep 2023 11:25:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qff2s-000NTh-37
	for ath11k@lists.infradead.org;
	Mon, 11 Sep 2023 11:25:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 64D81B810A7;
	Mon, 11 Sep 2023 11:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DFFC433C8;
	Mon, 11 Sep 2023 11:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694431532;
	bh=sGIYAdymxgcsqD8DyDcWzzxNCOg+DwN8FZvxonNOyqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eaIdgMjxtVNhX3sYqfK4O8rNHZB6vEif/ZmcmFeGz/3LVBOZmnm6KGu8lSDC9SoJw
	 Yze7qcAL9Ptrb+LAf97AEvQw6wdaPuaoVwloO4CBKY6PwUfJFG5UTM0Dxk63lp8bJ3
	 c0foHLdBud6u1bMUD6gRZHYtZ+ky59K2Zc9wtYsh8K1yyLrA+gI26GAbG0k7T3UNT2
	 vFtteTZ902GgIzzCKBjIWe2b+KBgkz0M25KtNQKqlFsnQLzjQAp2reYXpleEzxDgGY
	 iQSwJJv9XDTbJ842dcPgyVxiBRdkQ5u49wRbWPN/CWsYgRtdea7cb5AXwXNshZROGw
	 52Zy28U5R8tCQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qff2n-0003sE-18;
	Mon, 11 Sep 2023 13:25:29 +0200
Date: Mon, 11 Sep 2023 13:25:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Alex R <alex@ironrobin.net>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855: Request: Support ThinkPad X13s 21BY-S03Y00
Message-ID: <ZP75KZDz7zjDDbSO@hovoldconsulting.com>
References: <mYl9fKKm9_Kn1aqjsnk6yx9YxhhFShCQeF2qptjjWlKDJ-XpxsO038Eag4A9S4EABiWbhiJ8polAtrOwVGIZeZ1yYTSwNYldBBDeZXMmtxI=@ironrobin.net>
 <87jzt3ellx.fsf@kernel.org>
 <ZPhCq32KlaZteCzG@hovoldconsulting.com>
 <d191d35f-f006-45e6-bf69-3d4d251a892b@quicinc.com>
 <ZPiS7EJe7teOpOyw@hovoldconsulting.com>
 <aMi4zXfWxMWs2QxBRyLwLb30U-nf6DPgkOd27if32rD-T5rYfBcS5q8fXgUE-FAarK7NlWmNjDt12o81fDVLJMtygm5mpracZ2TuvrVoFQg=@ironrobin.net>
 <ZP7EERThjmdfIjJl@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZP7EERThjmdfIjJl@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_042535_165225_0502D017 
X-CRM114-Status: UNSURE (   7.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, Sep 11, 2023 at 09:38:57AM +0200, Johan Hovold wrote:

> You sent an encrypted mail to a public mailing list, which does not
> really work.

Apparently it was also sent unencrypted to the list so I'll reply to my
deciphered copy, but please fix your mail setup to only send plain text
when communicating with upstream.

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
