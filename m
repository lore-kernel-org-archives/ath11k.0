Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801ECEE57DF
	for <ath11k@archiver.kernel.org>; Mon, 11 Sep 2023 07:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jl1AbEFlgmqCX96fdEk55lk46BVgvfyJJ5kJXEfi9Aw=; b=IiJQFy1vYpE4ao
	7mvdJjvOUcSde+m96AwKxa0UxOD5CXSY0LIHaqqWt4eoq+BeJ6NyMGk2Mtc9eG9dJwQrZsbnxEmmg
	bgIOScMLH3EHE3uEqL+iRyw8V3JX0Xi19CGasoXBzQOb0eAQZlUPb/gdMuQlj5QOROLPjrndOH0gm
	ETtoefUunFYCYyVhdjtLgC87vVGh8pPDbWkwAtTFMLbNF40N5nGdz9PMQDAtDEqZ4738fogjBxXZb
	FSVsAnsjiPv5SbPKdYxXlHJgUvEELJ0ySRx0JEjA4fupH3WKaXfocaE07nTf6agejqr80kPHUEQ+R
	43zrnwX7b7ZFeHov1O9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbVh-00HQqT-0w;
	Mon, 11 Sep 2023 07:39:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbVf-00HQqB-0l
	for ath11k@lists.infradead.org;
	Mon, 11 Sep 2023 07:39:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3121B80E69;
	Mon, 11 Sep 2023 07:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D8DC433C7;
	Mon, 11 Sep 2023 07:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694417939;
	bh=HxCuO+57mqYUW9iEG10BXOfbR+5C1YI43i83vJ0jGZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUA6B4Ku/n4obKjRk1QQauMCOiWEULZvIfGPkYeFIE9mBrj1LY80P3emnBtK6lrqh
	 RYJRiKxaI3U7me/aiXoB/lDfREyE2eLp54i/9PvwwnOgrBNeAb53a2BmDwni0PP6JQ
	 iwQL42wj07c0X3UU/HRQp3B5UpCuC1wZGKRmSecpe5iolNVFU5j98OuSF9/Ty73b0O
	 Sat5gMwRC40DxQ4zfPCcO4RQ8cZJt3trS/i/1oJpGV8Cc8w4xexOZGWAt2PTW5uaXC
	 ZwqH4jyZDRD4i0JptIi4IlAXD+fdpkBF2B15H3RvHTqP11fQ89kr/HWwm7ueFaOskS
	 aAq8rQK8Sfuiw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qfbVZ-0001Ww-05;
	Mon, 11 Sep 2023 09:38:57 +0200
Date: Mon, 11 Sep 2023 09:38:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Alex R <alex@ironrobin.net>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855: Request: Support ThinkPad X13s 21BY-S03Y00
Message-ID: <ZP7EERThjmdfIjJl@hovoldconsulting.com>
References: <mYl9fKKm9_Kn1aqjsnk6yx9YxhhFShCQeF2qptjjWlKDJ-XpxsO038Eag4A9S4EABiWbhiJ8polAtrOwVGIZeZ1yYTSwNYldBBDeZXMmtxI=@ironrobin.net>
 <87jzt3ellx.fsf@kernel.org>
 <ZPhCq32KlaZteCzG@hovoldconsulting.com>
 <d191d35f-f006-45e6-bf69-3d4d251a892b@quicinc.com>
 <ZPiS7EJe7teOpOyw@hovoldconsulting.com>
 <aMi4zXfWxMWs2QxBRyLwLb30U-nf6DPgkOd27if32rD-T5rYfBcS5q8fXgUE-FAarK7NlWmNjDt12o81fDVLJMtygm5mpracZ2TuvrVoFQg=@ironrobin.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMi4zXfWxMWs2QxBRyLwLb30U-nf6DPgkOd27if32rD-T5rYfBcS5q8fXgUE-FAarK7NlWmNjDt12o81fDVLJMtygm5mpracZ2TuvrVoFQg=@ironrobin.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_003903_442090_33775136 
X-CRM114-Status: UNSURE (   5.48  )
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

Alex,

You sent an encrypted mail to a public mailing list, which does not
really work.

Please resend your reply unencrypted.

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
